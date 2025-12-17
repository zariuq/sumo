import Lean
import SumoKif.Sexp
import SumoKif.Signature

set_option autoImplicit false

namespace SumoKif

open Lean

structure Issue : Type where
  file : Option String := none
  msg : String
  sexp : Option Sexp := none
  deriving Repr

def Issue.withFile (file : String) (i : Issue) : Issue :=
  { i with file := some file }

def Issue.render (i : Issue) : String :=
  let filePrefix :=
    match i.file with
    | none => ""
    | some f => f ++ ": "
  match i.sexp with
  | none => filePrefix ++ i.msg
  | some s => filePrefix ++ i.msg ++ "\n  " ++ s.render

def arityCheckOne (sig : Signature) (s : Sexp) : List Issue :=
  match s with
  | .list (head :: args) =>
      match head.asSym? with
      | none => []
      | some pred =>
          match sig.symArity.get? pred with
          | none => []
          | some (.variadic) => []
          | some (.fixed arity) =>
              if args.length = arity then
                []
              else
                [{ msg := s!"arity mismatch for `{pred}`: expected {arity}, got {args.length}", sexp := some s }]
  | _ => []

partial def collectArityIssues (sig : Signature) (s : Sexp) : List Issue :=
  let here := arityCheckOne sig s
  let below :=
    match s with
    | .atom _ => []
    | .list xs => List.flatMap (collectArityIssues sig) xs
  here ++ below

def domainIndexIssues (sig : Signature) : List Issue :=
  List.flatMap (fun (pred, m) =>
    match sig.symArity.get? pred with
    | none =>
        [{ msg := s!"domain declaration for `{pred}` but no arity info (no fixed-arity `instance` found and no arity could be inferred)" }]
    | some (.variadic) =>
        []
    | some (.fixed ar) =>
        m.toList.filterMap (fun (idx, cls) =>
          if idx = 0 || idx > ar then
            some { msg := s!"domain index out of range for `{pred}`: arg {idx} has domain `{cls}`, but arity is {ar}" }
          else
            none)) (sig.domains.toList)

def arityConflictIssues (sig : Signature) : List Issue :=
  sig.arityConflicts.toList.map (fun (sym, as) =>
    { msg := s!"conflicting arities inferred for `{sym}`: {reprStr as}" })

def domainDeclIssuesInForm (sig : Signature) (s : Sexp) : List Issue :=
  match s with
  | .list ((.atom (.sym "domain")) :: (.atom (.sym sym)) :: (.atom (.sym idxStr)) :: (.atom (.sym cls)) :: _) =>
      match idxStr.toNat? with
      | none => [{ msg := s!"invalid domain index `{idxStr}` for `{sym}`", sexp := some s }]
      | some idx =>
          match sig.symArity.get? sym with
          | none => [{ msg := s!"domain declaration for `{sym}` but no arity info", sexp := some s }]
          | some (.variadic) => []
          | some (.fixed ar) =>
              if idx = 0 || idx > ar then
                [{ msg := s!"domain index out of range for `{sym}`: arg {idx} has domain `{cls}`, but arity is {ar}", sexp := some s }]
              else
                []
  | .list ((.atom (.sym "domainSubclass")) :: (.atom (.sym sym)) :: (.atom (.sym idxStr)) :: (.atom (.sym cls)) :: _) =>
      match idxStr.toNat? with
      | none => [{ msg := s!"invalid domainSubclass index `{idxStr}` for `{sym}`", sexp := some s }]
      | some idx =>
          match sig.symArity.get? sym with
          | none => [{ msg := s!"domainSubclass declaration for `{sym}` but no arity info", sexp := some s }]
          | some (.variadic) => []
          | some (.fixed ar) =>
              if idx = 0 || idx > ar then
                [{ msg := s!"domainSubclass index out of range for `{sym}`: arg {idx} has domain `{cls}`, but arity is {ar}", sexp := some s }]
              else
                []
  | _ => []

-- Get all superclasses of a class (transitive)
partial def allSuperclasses (sig : Signature) (cls : String) : List String :=
  go [cls] []
where
  go : List String → List String → List String
    | [], acc => acc.eraseDups
    | c :: cs, acc =>
        if acc.contains c then
          go cs acc
        else
          let sups := sig.classSupers.getD c []
          go (sups ++ cs) (c :: acc)

-- Check if two classes are disjoint (considering subclass relations)
def areDisjoint (sig : Signature) (c1 c2 : String) : Bool :=
  let supers1 := allSuperclasses sig c1
  let supers2 := allSuperclasses sig c2
  supers1.any fun s1 =>
    supers2.any fun s2 =>
      sig.disjointPairs.any fun (d1, d2) =>
        (d1 == s1 && d2 == s2) || (d1 == s2 && d2 == s1)

-- Check if a class is a subclass of another (transitive)
partial def isSubclass (sig : Signature) (sub sup : String) : Bool :=
  if sub == sup then true
  else
    match sig.classSupers.get? sub with
    | none => false
    | some sups => sups.any fun s => isSubclass sig s sup

-- Collect domain constraints for variables in a formula
partial def collectVarDomains (sig : Signature) (s : Sexp) : Std.HashMap String (List String) :=
  go s {}
where
  go (s : Sexp) (acc : Std.HashMap String (List String)) : Std.HashMap String (List String) :=
    match s with
    | .list ((.atom (.sym "instance")) :: (.atom (.sym var)) :: (.atom (.sym cls)) :: _) =>
        if var.startsWith "?" then
          let existing := acc.getD var []
          acc.insert var (cls :: existing)
        else
          acc
    | .list ((.atom (.sym pred)) :: args) =>
        -- Add domain constraints from predicate arguments
        let accWithPred :=
          match sig.domains.get? pred with
          | none => acc
          | some domMap =>
              args.foldl (fun (acc', idx) arg =>
                match arg.asSym?, domMap.get? (idx + 1) with
                | some var, some cls =>
                    if var.startsWith "?" then
                      let existing := acc'.getD var []
                      (acc'.insert var (cls :: existing), idx + 1)
                    else
                      (acc', idx + 1)
                | _, _ => (acc', idx + 1)) (acc, 0) |>.1
        -- Recurse into subexpressions
        args.foldl (fun acc' child => go child acc') accWithPred
    | .list xs => xs.foldl (fun acc' child => go child acc') acc
    | _ => acc

-- Check for disjoint domain constraints on the same variable
def domainSatisfiabilityIssues (sig : Signature) (s : Sexp) : List Issue :=
  let varDoms := collectVarDomains sig s
  varDoms.toList.flatMap fun (var, doms) =>
    let uniqDoms := doms.eraseDups
    -- Check all pairs of domains for disjointness
    uniqDoms.flatMap fun d1 =>
      uniqDoms.filterMap fun d2 =>
        if d1 != d2 && areDisjoint sig d1 d2 then
          some { msg := s!"inconsistent variable types: {var} has disjoint domains {d1} and {d2}", sexp := some s }
        else
          none

def checkForm (sig : Signature) (s : Sexp) : List Issue :=
  domainDeclIssuesInForm sig s ++ collectArityIssues sig s ++ domainSatisfiabilityIssues sig s

structure IssueBag : Type where
  limit : Nat := 1000
  count : Nat := 0
  issues : Array Issue := #[]
  deriving Repr

def IssueBag.add (b : IssueBag) (i : Issue) : IssueBag :=
  if b.issues.size < b.limit then
    { b with count := b.count + 1, issues := b.issues.push i }
  else
    { b with count := b.count + 1 }

def IssueBag.addMany (b : IssueBag) (is : List Issue) : IssueBag :=
  is.foldl (fun acc i => acc.add i) b

def checkKb (sig : Signature) (xs : List Sexp) : List Issue :=
  let arityIssues := List.flatMap (collectArityIssues sig) xs
  let domainIssues := domainIndexIssues sig
  arityConflictIssues sig ++ domainIssues ++ arityIssues

end SumoKif
