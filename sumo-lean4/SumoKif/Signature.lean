import Std.Data.HashMap
import SumoKif.Sexp

set_option autoImplicit false

namespace SumoKif

inductive Arity : Type
  | fixed (n : Nat)
  | variadic
  deriving DecidableEq, BEq, Repr

structure Signature : Type where
  -- symbol -> arity
  symArity : Std.HashMap String Arity := {}
  -- symbol -> (arg index -> domain class symbol)
  domains : Std.HashMap String (Std.HashMap Nat String) := {}
  -- symbol -> distinct arities inferred from its class memberships (if >1, likely inconsistent KB)
  arityConflicts : Std.HashMap String (List Arity) := {}
  -- symbol -> arity inferred from max domain index (when no class-based arity could be found)
  arityInferredFromDomains : Std.HashMap String Nat := {}
  -- class hierarchy for subsumption checking
  classSupers : Std.HashMap String (List String) := {}
  -- pairs of disjoint classes (transitive closure computed)
  disjointPairs : List (String × String) := []

def Signature.empty : Signature := {}

def Signature.setArity (sig : Signature) (sym : String) (arity : Arity) : Signature :=
  { sig with symArity := sig.symArity.insert sym arity }

def Signature.addDomain (sig : Signature) (sym : String) (idx : Nat) (cls : String) : Signature :=
  let inner :=
    match sig.domains.get? sym with
    | some m => m
    | none => {}
  let inner := inner.insert idx cls
  { sig with domains := sig.domains.insert sym inner }

def arityOfSymbolClass? (name : String) : Option Arity :=
  match name with
  | "UnaryPredicate" => some (.fixed 1)
  | "BinaryPredicate" => some (.fixed 2)
  | "TernaryPredicate" => some (.fixed 3)
  | "QuaternaryPredicate" => some (.fixed 4)
  | "QuintaryPredicate" => some (.fixed 5)
  | "HexaryPredicate" => some (.fixed 6)
  | "UnaryRelation" => some (.fixed 1)
  | "BinaryRelation" => some (.fixed 2)
  | "TernaryRelation" => some (.fixed 3)
  | "QuaternaryRelation" => some (.fixed 4)
  | "QuintaryRelation" => some (.fixed 5)
  | "HexaryRelation" => some (.fixed 6)
  | "UnaryFunction" => some (.fixed 1)
  | "BinaryFunction" => some (.fixed 2)
  | "TernaryFunction" => some (.fixed 3)
  | "QuaternaryFunction" => some (.fixed 4)
  | "QuintaryFunction" => some (.fixed 5)
  | "HexaryFunction" => some (.fixed 6)
  | "VariableArityPredicate" => some .variadic
  | "VariableArityRelation" => some .variadic
  | "VariableArityFunction" => some .variadic
  | _ => none

structure SigBuilder : Type where
  symArityExplicit : Std.HashMap String Arity := {}
  symArityExplicitConflicts : Std.HashMap String (List Arity) := {}
  symClasses : Std.HashMap String (List String) := {}
  classSupers : Std.HashMap String (List String) := {}
  domains : Std.HashMap String (Std.HashMap Nat String) := {}
  disjointPairs : List (String × String) := []

def SigBuilder.empty : SigBuilder := {}

def SigBuilder.addExplicitArity (b : SigBuilder) (sym : String) (arity : Arity) : SigBuilder :=
  match b.symArityExplicit.get? sym with
  | none => { b with symArityExplicit := b.symArityExplicit.insert sym arity }
  | some a =>
      if a = arity then
        b
      else
        let cs := (b.symArityExplicitConflicts.getD sym []).eraseDups
        let cs := (arity :: a :: cs).eraseDups
        { b with
          symArityExplicit := b.symArityExplicit.insert sym arity
          symArityExplicitConflicts := b.symArityExplicitConflicts.insert sym cs }

def SigBuilder.addSymClass (b : SigBuilder) (sym : String) (cls : String) : SigBuilder :=
  let cs := b.symClasses.getD sym []
  { b with symClasses := b.symClasses.insert sym (cls :: cs) }

def SigBuilder.addSubclass (b : SigBuilder) (sub : String) (sup : String) : SigBuilder :=
  let sups := b.classSupers.getD sub []
  { b with classSupers := b.classSupers.insert sub (sup :: sups) }

def SigBuilder.addDomain (b : SigBuilder) (sym : String) (idx : Nat) (cls : String) : SigBuilder :=
  let inner := b.domains.getD sym {}
  let inner := inner.insert idx cls
  { b with domains := b.domains.insert sym inner }

def SigBuilder.addDisjoint (b : SigBuilder) (c1 : String) (c2 : String) : SigBuilder :=
  { b with disjointPairs := (c1, c2) :: b.disjointPairs }

def SigBuilder.ingest (b : SigBuilder) : Sexp → SigBuilder
  | .list xs =>
      match xs with
      | (.atom (.sym "instance")) :: (.atom (.sym sym)) :: (.atom (.sym cls)) :: _ =>
          match arityOfSymbolClass? cls with
          | some ar => b.addExplicitArity sym ar
          | none => b.addSymClass sym cls
      | (.atom (.sym "subclass")) :: (.atom (.sym sub)) :: (.atom (.sym sup)) :: _ =>
          b.addSubclass sub sup
      | (.atom (.sym "domain")) :: (.atom (.sym sym)) :: (.atom (.sym idxStr)) :: (.atom (.sym cls)) :: _ =>
          match idxStr.toNat? with
          | some idx => b.addDomain sym idx cls
          | none => b
      | (.atom (.sym "domainSubclass")) :: (.atom (.sym sym)) :: (.atom (.sym idxStr)) :: (.atom (.sym cls)) :: _ =>
          match idxStr.toNat? with
          | some idx => b.addDomain sym idx cls
          | none => b
      | (.atom (.sym "disjoint")) :: (.atom (.sym c1)) :: (.atom (.sym c2)) :: _ =>
          b.addDisjoint c1 c2
      | (.atom (.sym "disjointDecomposition")) :: _ :: rest =>
          rest.foldl (fun b' child =>
            match child with
            | .atom (.sym c) => addDisjointPairwise b' c rest
            | _ => b') b
      | _ => b
  | _ => b
where
  addDisjointPairwise (b : SigBuilder) (c : String) (rest : List Sexp) : SigBuilder :=
    rest.foldl (fun b' child =>
      match child with
      | .atom (.sym c2) => if c != c2 then b'.addDisjoint c c2 else b'
      | _ => b') b

partial def resolveClassArity? (classSupers : Std.HashMap String (List String)) : String → List String → Option Arity
  | cls, visited =>
      if visited.contains cls then
        none
      else
        match arityOfSymbolClass? cls with
        | some a => some a
        | none =>
            let sups := classSupers.getD cls []
            resolveAny? sups (cls :: visited)
where
  resolveAny? : List String → List String → Option Arity
    | [], _ => none
    | c :: cs, visited =>
        match resolveClassArity? classSupers c visited with
        | some a => some a
        | none => resolveAny? cs visited

def combineArities (as : List Arity) : Option Arity × List Arity :=
  let uniq := as.eraseDups
  match uniq with
  | [] => (none, [])
  | [a] => (some a, [])
  | _ =>
      if uniq.any (fun a => a = .variadic) then
        (some .variadic, uniq)
      else
        let maxFixed :=
          uniq.foldl
            (fun acc a =>
              match acc, a with
              | n, .fixed m => Nat.max n m
              | n, .variadic => n)
            0
        (some (.fixed maxFixed), uniq)

def SigBuilder.ingestAll (b : SigBuilder) (xs : List Sexp) : SigBuilder :=
  xs.foldl SigBuilder.ingest b

-- Compute all subclasses of a class (transitive closure)
partial def allSubclasses (classSupers : Std.HashMap String (List String)) (cls : String) : List String :=
  go [cls] []
where
  go : List String → List String → List String
    | [], acc => acc.eraseDups
    | c :: cs, acc =>
        if acc.contains c then
          go cs acc
        else
          let subs := classSupers.toList.filter (fun (_, sups) => sups.contains c) |>.map Prod.fst
          go (subs ++ cs) (c :: acc)

-- Compute transitive closure of disjointness using subclass relations
def computeDisjointClosure (classSupers : Std.HashMap String (List String)) (pairs : List (String × String)) : List (String × String) :=
  pairs.flatMap fun (c1, c2) =>
    let subs1 := allSubclasses classSupers c1
    let subs2 := allSubclasses classSupers c2
    List.flatMap (fun s1 => subs2.map fun s2 => (s1, s2)) subs1

def SigBuilder.finalize (b : SigBuilder) : Signature := Id.run do
  let mut sig : Signature :=
    { symArity := b.symArityExplicit
      domains := b.domains
      arityConflicts := b.symArityExplicitConflicts
      arityInferredFromDomains := {}
      classSupers := b.classSupers
      disjointPairs := [] }
  for (sym, classes) in b.symClasses.toList do
    let mut inferred : List Arity := []
    for cls in classes do
      match resolveClassArity? b.classSupers cls [] with
      | none => continue
      | some a => inferred := a :: inferred
    let (maybeAr, conflicts) := combineArities inferred
    match maybeAr with
    | none => pure ()
    | some a =>
        match sig.symArity.get? sym with
        | none =>
            sig := { sig with symArity := sig.symArity.insert sym a }
        | some a' =>
            if a' = a then
              pure ()
            else
              let cs := [a', a] ++ conflicts
              sig :=
                { sig with
                  symArity := sig.symArity.insert sym a
                  arityConflicts := sig.arityConflicts.insert sym (cs.eraseDups) }
    if !conflicts.isEmpty then
      let existing := sig.arityConflicts.getD sym []
      sig := { sig with arityConflicts := sig.arityConflicts.insert sym ((existing ++ conflicts).eraseDups) }
  for (sym, doms) in b.domains.toList do
    match sig.symArity.get? sym with
    | some _ => continue
    | none =>
        let maxIdx :=
          doms.toList.foldl (fun mx (idx, _) => Nat.max mx idx) 0
        if maxIdx = 0 then
          continue
        sig :=
          { sig with
            symArity := sig.symArity.insert sym (.fixed maxIdx)
            arityInferredFromDomains := sig.arityInferredFromDomains.insert sym maxIdx }
  -- Compute transitive closure of disjointness
  let disjointClosure := computeDisjointClosure b.classSupers b.disjointPairs
  sig := { sig with disjointPairs := disjointClosure.eraseDups }
  return sig

def Signature.fromKb (xs : List Sexp) : Signature :=
  (xs.foldl SigBuilder.ingest SigBuilder.empty).finalize

end SumoKif
