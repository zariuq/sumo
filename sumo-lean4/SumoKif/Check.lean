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

def checkForm (sig : Signature) (s : Sexp) : List Issue :=
  domainDeclIssuesInForm sig s ++ collectArityIssues sig s

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
