import Std
import Sumo.Ast
import SumoKif.ParseSexp
import SumoKif.ExportAxioms
import SumoKif.Signature
import SumoKif.ToAst

set_option autoImplicit false

namespace SumoKif.HolEmit

open Sumo
open Sumo.Ast
open SumoKif

/-!
KIF → HOL-native Lean emitter.

Goal: generate readable LeanSUMO-style files (no `sig.rel ⟨"..."⟩.holds [...]`),
using:
- `Entity : Type`
- `Class Entity := Entity → Prop`
- curried predicates/functions for fixed arities
- `List`-based application for variable arity and `@ROW` splices
- `KappaFn` as `LeanSUMO.kappa`

This is intended to *author and use* SUMO in Lean, not to preserve every bit
of SUMO’s meta-ontology as first-class objects.
-/

/-! ## Identifiers -/

def aliasSym (s : String) : String :=
  -- Avoid Lean keyword collisions and keep common SUMO names readable.
  match s with
  | "attribute" => "hasAttribute"
  | other => other

def sanitizeIdent (s : String) : String :=
  let s :=
    if s.startsWith "?" then
      "v_" ++ s.drop 1
    else if s.startsWith "@" then
      "row_" ++ s.drop 1
    else
      s
  let s := s.replace "-" "_"
  let s := s.replace "." "_"
  let s := s.replace "+" "Plus"
  let s := s.replace "*" "Star"
  let s := s.replace "/" "Slash"
  let s := s.replace "%" "Pct"
  let s := s.replace "'" "Prime"
  if s ∈ ["class", "instance", "theorem", "lemma", "axiom", "def",
          "if", "then", "else", "match", "with", "where", "let", "in",
          "fun", "do", "return", "for", "while", "end", "import", "open",
          "namespace", "section", "variable", "universe", "inductive",
          "structure", "abbrev", "set_option", "True", "False",
          -- Lean core identifiers / syntax helpers we don't want to shadow
          "measure",
          -- reserved by our prelude/core
          "Obj", "Class", "instanceOf", "subclass", "disjoint", "kappa",
          "partition", "partitionVA", "exhaustiveDecomposition", "exhaustiveDecompositionVA",
          "disjointDecomposition", "disjointDecompositionVA", "Row", "VarPred", "subrelationVA",
          "VarFn", "ClassFn",
          -- var-arity adapters (LeanSUMO.Core)
          "va0", "va1", "va2", "va3", "va4", "va5", "va6",
          -- SUMO class/term bridge (LeanSUMO.Core)
          "classObj", "objClass",
          -- SUMO predicate/function ↔ Obj bridges (LeanSUMO.Core)
          "predObj", "objPred", "fnObj", "objFn", "classFnObj", "objClassFn"]
  then s ++ "_"
  else s

def isMetaSymbolClassName (cls : String) : Bool :=
  match SumoKif.arityOfSymbolClass? cls with
  | some _ => true
  | none =>
      cls = "Class" || cls = "Relation" || cls = "Predicate" || cls = "Function" ||
        cls.endsWith "Predicate" || cls.endsWith "Relation" || cls.endsWith "Function"

def stringFilter (s : String) (p : Char → Bool) : String :=
  String.mk (s.toList.filter p)

def stringTake (s : String) (n : Nat) : String :=
  String.mk (s.toList.take n)

def stringMap (s : String) (f : Char → Char) : String :=
  String.mk (s.toList.map f)

def litStrName (s : String) : String :=
  let base := stringTake (stringFilter s (fun c => c.isAlphanum)) 24
  let h := toString (Hashable.hash s)
  sanitizeIdent s!"str_{base}_{h}"

def litNumName (n : String) : String :=
  let base := stringMap n (fun c => if c = '-' then 'n' else if c = '.' then '_' else c)
  let base := stringTake (stringFilter base (fun c => c.isAlphanum || c = '_')) 24
  let h := toString (Hashable.hash n)
  sanitizeIdent s!"num_{base}_{h}"

def formulaTermName (e : Expr) : String :=
  let stem :=
    match e with
    | .app (.sym f) _ => sanitizeIdent (aliasSym f)
    | .and_ _ => "and"
    | .or_ _ => "or"
    | .not_ _ => "not"
    | .imp _ _ => "imp"
    | .iff _ _ => "iff"
    | .forall_ _ _ => "forall"
    | .exists_ _ _ => "exists"
    | _ => "form"
  let h := toString (Hashable.hash (reprStr e))
  sanitizeIdent s!"form_{stem}_{h}"

/-! ## Emission Config -/

structure EmitConfig where
  moduleName : String
  preludeModule : String
  axiomsModule : String
  axiomsNamespace : String
  deriving Repr

/-! ## Arity/Role Helpers -/

abbrev ClsArgMap : Type := Std.HashMap String (Std.HashSet Nat)

def ClsArgMap.isClassArg (m : ClsArgMap) (sym : String) (idx : Nat) : Bool :=
  (m.getD sym {}).contains idx

structure HolSig where
  sig : Signature
  clsArgs : ClsArgMap := {}
  predArgs : ClsArgMap := {}
  fnSyms : Std.HashSet String := {}
  -- Function symbols declared with `rangeSubclass` (i.e., class-valued).
  clsFnSyms : Std.HashSet String := {}

/-! ## Symbol Collection -/

structure SymSets where
  classes : Std.HashSet String := {}
  rels : Std.HashSet String := {}
  relObjs : Std.HashSet String := {}
  fns : Std.HashSet String := {}
  classFns : Std.HashSet String := {}
  ents : Std.HashSet String := {}
  strLits : Std.HashSet String := {}
  numLits : Std.HashSet String := {}

def SymSets.insertClass (s : SymSets) (name : String) : SymSets :=
  { s with classes := s.classes.insert name }

def SymSets.insertRel (s : SymSets) (name : String) : SymSets :=
  { s with rels := s.rels.insert name }

def SymSets.insertRelObj (s : SymSets) (name : String) : SymSets :=
  { s with relObjs := s.relObjs.insert name }

def SymSets.insertFn (s : SymSets) (name : String) : SymSets :=
  { s with fns := s.fns.insert name }

def SymSets.insertClassFn (s : SymSets) (name : String) : SymSets :=
  { s with classFns := s.classFns.insert name }

def SymSets.insertEnt (s : SymSets) (name : String) : SymSets :=
  { s with ents := s.ents.insert name }

def SymSets.insertStrLit (s : SymSets) (lit : String) : SymSets :=
  { s with strLits := s.strLits.insert lit }

def SymSets.insertNumLit (s : SymSets) (lit : String) : SymSets :=
  { s with numLits := s.numLits.insert lit }

inductive Expected : Type
  | formula
  | term
  | cls
  | pred
  deriving DecidableEq, Repr

/-! ## Variable Roles (for HO predicate variables and row vars) -/

inductive TermRole : Type
  | ent
  | cls
  | relVA
  | fnVA
  | clsFnVA
  deriving DecidableEq, Repr

inductive RowRole : Type
  | ent
  | cls
  deriving DecidableEq, Repr

structure Roles where
  term : Std.HashMap String TermRole := {}
  row : Std.HashMap String RowRole := {}

def Roles.withTerm (r : Roles) (name : String) (k : TermRole) : Roles :=
  match r.term.get? name with
  | none => { r with term := r.term.insert name k }
  | some k' => if k' = k then r else { r with term := r.term.insert name k }

def Roles.withRow (r : Roles) (name : String) (k : RowRole) : Roles :=
  match r.row.get? name with
  | none => { r with row := r.row.insert name k }
  | some k' => if k' = k then r else { r with row := r.row.insert name k }

def Roles.termRole (r : Roles) (name : String) : TermRole :=
  r.term.getD name .ent

def Roles.rowRole (r : Roles) (name : String) : RowRole :=
  r.row.getD name .ent

partial def inferRoles (hsig : HolSig) (r : Roles) (expected : Expected) : Expr → Roles
  | .var v =>
      match expected with
      | .cls => r.withTerm v.name .cls
      | .pred => r.withTerm v.name .relVA
      | _ => r
  | .splice s =>
      -- In SUMO-KIF, row variables range over *terms* (single-sorted), even when those
      -- terms denote classes/relations. We therefore treat all `@ROW` binders as `Row Obj`
      -- and interpret elements as needed via `objClass`, `predObj`, etc.
      r.withRow s .ent
  | .app (.var v) args =>
      let r :=
        match expected with
        | .formula => r.withTerm v.name .relVA
        | .term => r.withTerm v.name .fnVA
        | .cls => r.withTerm v.name .clsFnVA
        | .pred => r.withTerm v.name .relVA
      args.foldl (fun acc e => inferRoles hsig acc .term e) r
  | .app (.sym "instance") [t, (.sym cls)] =>
      if isMetaSymbolClassName cls then
        match t with
        | .var v =>
            if cls = "Class" then
              r.withTerm v.name .cls
            else if cls.endsWith "Function" || cls = "Function" then
              r.withTerm v.name .fnVA
            else if cls.endsWith "Predicate" || cls.endsWith "Relation" || cls = "Predicate" || cls = "Relation" then
              r.withTerm v.name .relVA
            else
              r
        | _ => r
      else
        let r := inferRoles hsig r .term t
        inferRoles hsig r .cls (.sym cls)
  | .app (.sym "instance") [t, c] =>
      let r := inferRoles hsig r .term t
      inferRoles hsig r .cls c
  | .app (.sym "subrelation") [r1, r2] =>
      let markRel : Roles → Expr → Roles
        | acc, .var v => acc.withTerm v.name .relVA
        | acc, _ => acc
      markRel (markRel r r1) r2
  | .app (.sym "subclass") [c1, c2]
  | .app (.sym "disjoint") [c1, c2] =>
      let r := inferRoles hsig r .cls c1
      inferRoles hsig r .cls c2
  | .app (.sym "partition") (parent :: children)
  | .app (.sym "exhaustiveDecomposition") (parent :: children)
  | .app (.sym "disjointDecomposition") (parent :: children) =>
      let r := inferRoles hsig r .cls parent
      children.foldl (fun acc e => inferRoles hsig acc .cls e) r
  | .app (.sym "KappaFn") [_binder, body] =>
      inferRoles hsig r .formula body
  | .app (.sym _f) args =>
      let f := _f
      -- If an application occurs in term position but isn't a known function symbol, SUMO is
      -- using a formula as a term argument (reification). We treat it as opaque at this layer.
      if expected = .term && !(hsig.fnSyms.contains f) then
        r
      else
      let (_, r) :=
        args.foldl
          (init := (1, r))
          (fun (i, acc) e =>
            let expectedArg : Expected :=
              if hsig.clsArgs.isClassArg f i then .cls
              else if hsig.predArgs.isClassArg f i then .pred
              else .term
            (i + 1, inferRoles hsig acc expectedArg e))
      r
  | .and_ xs =>
      if expected = .term then r else xs.foldl (fun acc e => inferRoles hsig acc .formula e) r
  | .or_ xs =>
      if expected = .term then r else xs.foldl (fun acc e => inferRoles hsig acc .formula e) r
  | .not_ e =>
      if expected = .term then r else inferRoles hsig r .formula e
  | .imp a b =>
      if expected = .term then r else inferRoles hsig (inferRoles hsig r .formula a) .formula b
  | .iff a b =>
      if expected = .term then r else inferRoles hsig (inferRoles hsig r .formula a) .formula b
  | .forall_ vars body =>
      if expected = .term then
        r
      else
        let r := vars.foldl (fun acc v =>
          match v.kind with
          | .row => acc.withRow v.name .ent
          | .term => acc.withTerm v.name .ent) r
        inferRoles hsig r .formula body
  | .exists_ vars body =>
      if expected = .term then
        r
      else
        let r := vars.foldl (fun acc v =>
          match v.kind with
          | .row => acc.withRow v.name .ent
          | .term => acc.withTerm v.name .ent) r
        inferRoles hsig r .formula body
  | _ => r

partial def collectSyms (hsig : HolSig) (acc : SymSets) (expected : Expected) : Expr → SymSets
  | .sym s =>
      match expected with
      | .cls =>
          -- If a relation/function symbol is used where a *class* is expected, SUMO is reifying it
          -- as an object and then interpreting that object as a class (single-sorted object language).
          -- We render this as `objClass <sym>_obj`, so ensure `<sym>_obj` is declared.
          let acc := acc.insertClass s
          match hsig.sig.symArity.get? s with
          | some _ => acc.insertRelObj s
          | none => acc
      | .pred => acc.insertRel s
      | .term =>
          -- If a relation/function symbol is used as a *term*, SUMO is reifying it as an object.
          -- In Lean we represent this by a separate constant `<sym>_obj : Obj`.
          match hsig.sig.symArity.get? s with
          | some _ => acc.insertRelObj s
          | none =>
              if acc.rels.contains s || acc.fns.contains s || acc.classFns.contains s || acc.classes.contains s || acc.relObjs.contains s then
                acc
              else
                acc.insertEnt s
      | .formula => acc
  | .str s =>
      match expected with
      | .term => acc.insertStrLit s
      | _ => acc
  | .num n =>
      match expected with
      | .term => acc.insertNumLit n
      | _ => acc
  | .var _ => acc
  | .splice _ => acc
  | e@(.and_ xs) =>
      if expected = .term then
        acc.insertEnt (formulaTermName e)
      else
        xs.foldl (fun a e => collectSyms hsig a .formula e) acc
  | e@(.or_ xs) =>
      if expected = .term then
        acc.insertEnt (formulaTermName e)
      else
        xs.foldl (fun a e => collectSyms hsig a .formula e) acc
  | e@(.not_ x) =>
      if expected = .term then
        acc.insertEnt (formulaTermName e)
      else
        collectSyms hsig acc .formula x
  | e@(.imp a b) =>
      if expected = .term then
        acc.insertEnt (formulaTermName e)
      else
        collectSyms hsig (collectSyms hsig acc .formula a) .formula b
  | e@(.iff a b) =>
      if expected = .term then
        acc.insertEnt (formulaTermName e)
      else
        collectSyms hsig (collectSyms hsig acc .formula a) .formula b
  | e@(.forall_ _ body) =>
      if expected = .term then
        acc.insertEnt (formulaTermName e)
      else
        collectSyms hsig acc .formula body
  | e@(.exists_ _ body) =>
      if expected = .term then
        acc.insertEnt (formulaTermName e)
      else
        collectSyms hsig acc .formula body
  | e@(.app (.sym "instance") [t, (.sym cls)]) =>
      if expected = .term then
        acc.insertEnt (formulaTermName e)
      else if isMetaSymbolClassName cls then
        collectSyms hsig acc .term t
      else
        collectSyms hsig (collectSyms hsig acc .term t) .cls (.sym cls)
  | e@(.app (.sym "instance") [t, c]) =>
      if expected = .term then
        acc.insertEnt (formulaTermName e)
      else
        let acc := collectSyms hsig acc .term t
        -- SUMO sometimes uses a *term* where a class is expected (single-sorted object language).
        -- We will render these as `objClass ( ...term... )`, so collect symbols as terms.
        match c with
        | .app (.sym f) _ =>
            if hsig.clsFnSyms.contains f || f = "KappaFn" then
              collectSyms hsig acc .cls c
            else
              collectSyms hsig acc .term c
        | _ =>
            collectSyms hsig acc .cls c
  | e@(.app (.sym "subclass") [c1, c2])
  | e@(.app (.sym "disjoint") [c1, c2]) =>
      if expected = .term then
        acc.insertEnt (formulaTermName e)
      else
        let collectClassish (a : SymSets) (e : Expr) : SymSets :=
          match e with
          | .app (.sym f) _ =>
              if hsig.clsFnSyms.contains f || f = "KappaFn" then
                collectSyms hsig a .cls e
              else
                collectSyms hsig a .term e
          | _ => collectSyms hsig a .cls e
        collectClassish (collectClassish acc c1) c2
  | e@(.app (.sym "partition") (parent :: children))
  | e@(.app (.sym "exhaustiveDecomposition") (parent :: children))
  | e@(.app (.sym "disjointDecomposition") (parent :: children)) =>
      if expected = .term then
        acc.insertEnt (formulaTermName e)
      else
        let collectClassish (a : SymSets) (e : Expr) : SymSets :=
          match e with
          | .app (.sym f) _ =>
              if hsig.clsFnSyms.contains f || f = "KappaFn" then
                collectSyms hsig a .cls e
              else
                collectSyms hsig a .term e
          | _ => collectSyms hsig a .cls e
        let acc := collectClassish acc parent
        children.foldl (fun a e => collectClassish a e) acc
  | e@(.app (.sym "KappaFn") [_binder, body]) =>
      if expected = .term then
        acc.insertEnt (formulaTermName e)
      else
        collectSyms hsig acc .formula body
  | e@(.app (.sym f) args) =>
      if expected = .term && !(hsig.fnSyms.contains f) then
        -- Treat predicate applications in term position as opaque reified formula objects.
        acc.insertEnt (formulaTermName e)
      else
      -- classify f by arity-class instance declarations when available; fall back to usage position
      let acc :=
        match hsig.sig.symArity.get? f with
        | some _ =>
            -- heuristically: if used in formula context, treat as relation; in term context, function/classFn
            match expected with
            | .formula => acc.insertRel f
            | .term => acc.insertFn f
            | .cls =>
                if hsig.clsFnSyms.contains f then
                  acc.insertClassFn f
                else
                  acc.insertFn f
            | .pred => acc.insertRel f
        | none =>
            match expected with
            | .formula => acc.insertRel f
            | .term => acc.insertFn f
            | .cls =>
                if hsig.clsFnSyms.contains f then
                  acc.insertClassFn f
                else
                  acc.insertFn f
            | .pred => acc.insertRel f
      let (_, acc) :=
        args.foldl
          (init := (1, acc))
          (fun (i, a) e =>
            let expectedArg : Expected :=
              if hsig.clsArgs.isClassArg f i then .cls
              else if hsig.predArgs.isClassArg f i then .pred
              else .term
            (i + 1, collectSyms hsig a expectedArg e))
      acc
  | .app head args =>
      let acc := collectSyms hsig acc .term head
      args.foldl (fun a e => collectSyms hsig a .term e) acc

/-! ## Rendering -/

def renderRowExpr (renderOne : Expr → String) (args : List Expr) : String :=
  let (segsRev, pendingRev) :=
    args.foldl
      (init := (([] : List (Sum (List String) String)), ([] : List String)))
      (fun (segs, pending) a =>
        match a with
        | .splice s =>
            let segs :=
              if pending.isEmpty then segs else Sum.inl pending.reverse :: segs
            (Sum.inr (sanitizeIdent s) :: segs, [])
        | _ =>
            (segs, renderOne a :: pending))

  let segsRev :=
    if pendingRev.isEmpty then segsRev else Sum.inl pendingRev.reverse :: segsRev

  let renderSeg : Sum (List String) String → String
    | Sum.inl ts => "[" ++ String.intercalate ", " ts ++ "]"
    | Sum.inr row => row

  match segsRev.reverse.map renderSeg with
  | [] => "[]"
  | [x] => x
  | xs => String.intercalate " ++ " xs

def binderVarName? : Expr → Option String
  | .var v => some v.name
  | .app (.var v) [] => some v.name
  | _ => none

def paren (s : String) : String :=
  "(" ++ s ++ ")"

def SymSets.isPureClassSym (syms : SymSets) (s : String) : Bool :=
  syms.classes.contains s &&
    !(syms.rels.contains s) &&
    !(syms.fns.contains s) &&
    !(syms.classFns.contains s)

def vaName? (n : Nat) : Option String :=
  match n with
  | 0 => some "va0"
  | 1 => some "va1"
  | 2 => some "va2"
  | 3 => some "va3"
  | 4 => some "va4"
  | 5 => some "va5"
  | 6 => some "va6"
  | _ => none

def isObjOnlyRel (hsig : HolSig) (sym : String) (arity : Nat) : Bool :=
  (List.range arity).all (fun i =>
    let idx := i + 1
    !(hsig.clsArgs.isClassArg sym idx) && !(hsig.predArgs.isClassArg sym idx))

def renderSymAsVarPred (hsig : HolSig) (sym : String) : String :=
  let base := sanitizeIdent (aliasSym sym)
  match hsig.sig.symArity.get? sym with
  | some .variadic => base
  | none => base
  | some (.fixed n) =>
      if isObjOnlyRel hsig sym n then
        match vaName? n with
        | some va => s!"{va} {paren base}"
        | none => "(fun _ => False)"
      else
        "(fun _ => False)"

partial def collectUsedBinderNames (e : Expr) : Std.HashSet String :=
  let rec go (acc : Std.HashSet String) : Expr → Std.HashSet String
    | .var v => acc.insert (sanitizeIdent v.name)
    | .splice s => acc.insert (sanitizeIdent s)
    | .and_ xs | .or_ xs => xs.foldl go acc
    | .not_ x => go acc x
    | .imp a b | .iff a b => go (go acc a) b
    | .forall_ vs b | .exists_ vs b =>
        let acc := vs.foldl (fun a v => a.insert (sanitizeIdent v.name)) acc
        go acc b
    | .app h as => (as.foldl go (go acc h))
    | _ => acc
  go {} e

mutual
  partial def renderPredArg (hsig : HolSig) (_syms : SymSets) (_roles : Roles) (e : Expr) : String :=
    match e with
    | .sym s => renderSymAsVarPred hsig s
    | .var v => sanitizeIdent v.name
    | .app (.var v) [] => sanitizeIdent v.name
    | _ => "(fun _ => False)"

  partial def renderTerm (hsig : HolSig) (syms : SymSets) (roles : Roles) (e : Expr) : String :=
    match e with
    | .sym s =>
        let base := sanitizeIdent (aliasSym s)
        if syms.relObjs.contains s || SymSets.isPureClassSym syms s then
          base ++ "_obj"
        else
          base
    | .var v =>
        match roles.termRole v.name with
        | .cls => s!"classObj {paren (sanitizeIdent v.name)}"
        | .relVA => s!"predObj {paren (sanitizeIdent v.name)}"
        | .fnVA => s!"fnObj {paren (sanitizeIdent v.name)}"
        | .clsFnVA => s!"classFnObj {paren (sanitizeIdent v.name)}"
        | .ent => sanitizeIdent v.name
    | .str s => sanitizeIdent (litStrName s)
    | .num n => sanitizeIdent (litNumName n)
    | .app (.var v) args =>
        match roles.termRole v.name with
        | .fnVA =>
            let row := renderRowExpr (renderTerm hsig syms roles) args
            s!"{sanitizeIdent v.name} ({row})"
        | .clsFnVA =>
            let row := renderRowExpr (renderTerm hsig syms roles) args
            s!"classObj {paren (s!"{sanitizeIdent v.name} ({row})")}"
        | _ =>
            formulaTermName e
    | .app (.sym f) args =>
        if f = "KappaFn" then
          -- κ-binders denote classes; in term position, reify via `classObj`.
          s!"classObj {paren (renderClass hsig syms roles e)}"
        else if hsig.clsFnSyms.contains f then
          -- Class-valued function used in a term position: reify the resulting class to an object.
          s!"classObj {paren (renderClass hsig syms roles e)}"
        else if !(hsig.fnSyms.contains f) then
          -- SUMO frequently passes formulas as term arguments; represent these as opaque objects.
          formulaTermName e
        else
          let renderArgAt (idx : Nat) (a : Expr) : String :=
            if hsig.clsArgs.isClassArg f idx then
              renderClass hsig syms roles a
            else if hsig.predArgs.isClassArg f idx then
              renderPredArg hsig syms roles a
            else
              renderTerm hsig syms roles a
          match hsig.sig.symArity.get? f with
          | some .variadic =>
              let row := renderRowExpr (renderTerm hsig syms roles) args
              s!"{sanitizeIdent (aliasSym f)} ({row})"
          | none =>
              let row := renderRowExpr (renderTerm hsig syms roles) args
              s!"{sanitizeIdent (aliasSym f)} ({row})"
          | some (.fixed _) =>
              let (_, rev) :=
                args.foldl
                  (init := (1, ([] : List String)))
                  (fun (i, acc) a => (i + 1, renderArgAt i a :: acc))
              let argsStr := rev.reverse
              if argsStr.isEmpty then
                s!"{sanitizeIdent (aliasSym f)}"
              else
                s!"{sanitizeIdent (aliasSym f)} {String.intercalate " " (argsStr.map paren)}"
    | .splice s => sanitizeIdent s
    | .and_ _ | .or_ _ | .not_ _ | .imp _ _ | .iff _ _ | .forall_ _ _ | .exists_ _ _ =>
        formulaTermName e
    | _ =>
        formulaTermName e

  partial def renderClass (hsig : HolSig) (syms : SymSets) (roles : Roles) (e : Expr) : String :=
    match e with
    | .sym s =>
        if SymSets.isPureClassSym syms s then
          sanitizeIdent (aliasSym s)
        else
          s!"objClass {paren (renderTerm hsig syms roles (.sym s))}"
    | .var v =>
        if roles.termRole v.name = .cls then
          sanitizeIdent v.name
        else
          s!"objClass {paren (sanitizeIdent v.name)}"
    | .app (.var v) args =>
        let row := renderRowExpr (renderTerm hsig syms roles) args
        match roles.termRole v.name with
        | .clsFnVA => s!"{sanitizeIdent v.name} ({row})"
        | .fnVA => s!"objClass {paren (s!"{sanitizeIdent v.name} ({row})")}"
        | _ => "(fun _ => False)"
    | .app (.sym "KappaFn") (binder :: body :: _) =>
        match binderVarName? binder with
        | some v =>
            -- In SUMO-KIF, κ-binders range over ordinary terms. Even if the binder variable is
            -- *used* as a class (single-sorted), we keep it as `Obj` here and insert `objClass`
            -- at use sites via rendering (by forcing its role to `.ent` within the body).
            let roles' : Roles := { roles with term := roles.term.insert v .ent }
            s!"kappa (fun {sanitizeIdent v} => {renderFormula hsig syms roles' body})"
        | none => s!"kappa (fun x => {renderFormula hsig syms roles body})"
    | .app (.sym f) args =>
        if !(hsig.clsFnSyms.contains f) then
          -- A term-valued expression occurring where a class is expected.
          s!"objClass {paren (renderTerm hsig syms roles e)}"
        else
        let renderArgAt (idx : Nat) (a : Expr) : String :=
          if hsig.clsArgs.isClassArg f idx then
            renderClass hsig syms roles a
          else if hsig.predArgs.isClassArg f idx then
            renderPredArg hsig syms roles a
          else
            renderTerm hsig syms roles a
        match hsig.sig.symArity.get? f with
        | some .variadic =>
            let row := renderRowExpr (renderTerm hsig syms roles) args
            s!"{sanitizeIdent (aliasSym f)} ({row})"
        | none =>
            let row := renderRowExpr (renderTerm hsig syms roles) args
            s!"{sanitizeIdent (aliasSym f)} ({row})"
        | some (.fixed _) =>
            let (_, rev) :=
              args.foldl
                (init := (1, ([] : List String)))
                (fun (i, acc) a => (i + 1, renderArgAt i a :: acc))
            let argsStr := rev.reverse
            if argsStr.isEmpty then
              s!"{sanitizeIdent (aliasSym f)}"
            else
              s!"{sanitizeIdent (aliasSym f)} {String.intercalate " " (argsStr.map paren)}"
    | _ => "(fun _ => False)"

  partial def renderFormula (hsig : HolSig) (syms : SymSets) (roles : Roles) (e : Expr) : String :=
    match e with
    | .app (.sym "instance") [t, c] =>
        let cIsMeta : Bool :=
          match c with
          | .sym cls => isMetaSymbolClassName cls
          | _ => false
        if cIsMeta then
          -- meta-level typing facts (Predicate/Function/...) are compiled away
          "True"
        else
          s!"instanceOf {paren (renderTerm hsig syms roles t)} {paren (renderClass hsig syms roles c)}"
    | .app (.sym "subrelation") [r1, r2] =>
        let a := renderPredArg hsig syms roles r1
        let b := renderPredArg hsig syms roles r2
        s!"subrelationVA {paren a} {paren b}"
    | .app (.sym "subclass") [c1, c2] =>
        s!"subclass {paren (renderClass hsig syms roles c1)} {paren (renderClass hsig syms roles c2)}"
    | .app (.sym "disjoint") [c1, c2] =>
        s!"disjoint {paren (renderClass hsig syms roles c1)} {paren (renderClass hsig syms roles c2)}"
    | .app (.sym "equal") [a, b] =>
        let isClassExpr : Expr → Bool
          | .sym s => SymSets.isPureClassSym syms s
          | .var v => roles.termRole v.name = .cls
          | .app (.sym "KappaFn") _ => true
          | .app (.sym f) _ => hsig.clsFnSyms.contains f
          | .app (.var v) _ => roles.termRole v.name = .clsFnVA
          | _ => false
        match isClassExpr a, isClassExpr b with
        | true, true =>
            s!"{paren (renderClass hsig syms roles a)} = {paren (renderClass hsig syms roles b)}"
        | false, false =>
            s!"{paren (renderTerm hsig syms roles a)} = {paren (renderTerm hsig syms roles b)}"
        | true, false =>
            s!"classObj {paren (renderClass hsig syms roles a)} = {paren (renderTerm hsig syms roles b)}"
        | false, true =>
            s!"{paren (renderTerm hsig syms roles a)} = classObj {paren (renderClass hsig syms roles b)}"
    | .app (.sym "partition") args =>
        if args.any (fun a => match a with | .splice _ => true | _ => false) then
          let row := renderRowExpr (renderTerm hsig syms roles) args
          s!"partitionVA ({row})"
        else
          match args with
          | parent :: children =>
              s!"partition {paren (renderClass hsig syms roles parent)} [{String.intercalate ", " (children.map (renderClass hsig syms roles))}]"
          | [] => "False"
    | .app (.sym "exhaustiveDecomposition") args =>
        if args.any (fun a => match a with | .splice _ => true | _ => false) then
          let row := renderRowExpr (renderTerm hsig syms roles) args
          s!"exhaustiveDecompositionVA ({row})"
        else
          match args with
          | parent :: children =>
              s!"exhaustiveDecomposition {paren (renderClass hsig syms roles parent)} [{String.intercalate ", " (children.map (renderClass hsig syms roles))}]"
          | [] => "False"
    | .app (.sym "disjointDecomposition") args =>
        if args.any (fun a => match a with | .splice _ => true | _ => false) then
          let row := renderRowExpr (renderTerm hsig syms roles) args
          s!"disjointDecompositionVA ({row})"
        else
          match args with
          | parent :: children =>
              s!"disjointDecomposition {paren (renderClass hsig syms roles parent)} [{String.intercalate ", " (children.map (renderClass hsig syms roles))}]"
          | [] => "False"
    | .app (.var v) args =>
        let row := renderRowExpr (renderTerm hsig syms roles) args
        s!"{sanitizeIdent v.name} ({row})"
    | .app (.sym p) args =>
        let renderArgAt (idx : Nat) (a : Expr) : String :=
          if hsig.clsArgs.isClassArg p idx then
            renderClass hsig syms roles a
          else if hsig.predArgs.isClassArg p idx then
            renderPredArg hsig syms roles a
          else
            renderTerm hsig syms roles a
        match hsig.sig.symArity.get? p with
        | some .variadic =>
            let row := renderRowExpr (renderTerm hsig syms roles) args
            s!"{sanitizeIdent (aliasSym p)} ({row})"
        | none =>
            let row := renderRowExpr (renderTerm hsig syms roles) args
            s!"{sanitizeIdent (aliasSym p)} ({row})"
        | some (.fixed _) =>
            let (_, rev) :=
              args.foldl
                (init := (1, ([] : List String)))
                (fun (i, acc) a => (i + 1, renderArgAt i a :: acc))
            let argsStr := rev.reverse
            if argsStr.isEmpty then
              s!"{sanitizeIdent (aliasSym p)}"
            else
              let baseName := sanitizeIdent (aliasSym p)
              s!"{baseName} {String.intercalate " " (argsStr.map paren)}"
    | .and_ [] => "True"
    | .and_ [x] => renderFormula hsig syms roles x
    | .and_ xs => "(" ++ String.intercalate " ∧ " (xs.map (renderFormula hsig syms roles)) ++ ")"
    | .or_ [] => "False"
    | .or_ [x] => renderFormula hsig syms roles x
    | .or_ xs => "(" ++ String.intercalate " ∨ " (xs.map (renderFormula hsig syms roles)) ++ ")"
    | .not_ φ => s!"¬({renderFormula hsig syms roles φ})"
    | .imp φ ψ => s!"({renderFormula hsig syms roles φ} → {renderFormula hsig syms roles ψ})"
    | .iff φ ψ => s!"({renderFormula hsig syms roles φ} ↔ {renderFormula hsig syms roles ψ})"
    | .forall_ vars body =>
        let binders :=
          vars.map (fun v =>
            let n := sanitizeIdent v.name
            match v.kind with
            | .row =>
                match roles.rowRole v.name with
                | .cls => s!"({n} : Row Class)"
                | .ent => s!"({n} : Row Obj)"
            | .term =>
                match roles.termRole v.name with
                | .cls => s!"({n} : Class)"
                | .relVA => s!"({n} : VarPred)"
                | .fnVA => s!"({n} : VarFn)"
                | .clsFnVA => s!"({n} : ClassFn)"
                | .ent => s!"({n} : Obj)") |> String.intercalate " "
        s!"(∀ {binders}, {renderFormula hsig syms roles body})"
    | .exists_ vars body =>
        let binders :=
          vars.map (fun v =>
            let n := sanitizeIdent v.name
            match v.kind with
            | .row =>
                match roles.rowRole v.name with
                | .cls => s!"({n} : Row Class)"
                | .ent => s!"({n} : Row Obj)"
            | .term =>
                match roles.termRole v.name with
                | .cls => s!"({n} : Class)"
                | .relVA => s!"({n} : VarPred)"
                | .fnVA => s!"({n} : VarFn)"
                | .clsFnVA => s!"({n} : ClassFn)"
                | .ent => s!"({n} : Obj)") |> String.intercalate " "
        s!"(∃ {binders}, {renderFormula hsig syms roles body})"
    | _ => "True"
end

def axiomStem (e : Expr) : String :=
  let rec headSym : Expr → Option String
    | .app (.sym s) _ => some s
    | .imp _ b => headSym b
    | .forall_ _ b => headSym b
    | .exists_ _ b => headSym b
    | .and_ (x :: _) => headSym x
    | .or_ (x :: _) => headSym x
    | _ => none
  match headSym e with
  | some s => sanitizeIdent (aliasSym s)
  | none => "axiom"

def renderAxiomDecl (hsig : HolSig) (syms : SymSets) (roles : Roles) (idx : Nat) (src : String) (e : Expr) : String :=
  let name := s!"{axiomStem e}_{idx}"
  let prop := renderFormula hsig syms roles e
  s!"/-- {src} -/\naxiom {name} : {prop}"

structure AxiomDecl where
  name? : Option String := none
  src : String
  expr : Expr
  deriving Repr

def curriedTy (argTy retTy : String) : Nat → String
  | 0 => retTy
  | n+1 => s!"{argTy} → {curriedTy argTy retTy n}"

def curriedTys (argTys : List String) (retTy : String) : String :=
  argTys.foldr (fun a acc => s!"{a} → {acc}") retTy

def sortStrings (xs : List String) : List String :=
  (xs.toArray.qsort (· < ·)).toList

def emitPrelude (cfg : EmitConfig) (hsig : HolSig) (syms : SymSets) : String :=
  let argTy (sym : String) (idx : Nat) : String :=
    if hsig.predArgs.isClassArg sym idx then "VarPred"
    else if hsig.clsArgs.isClassArg sym idx then "Class"
    else "Obj"
  let classDecls :=
    sortStrings syms.classes.toList
      |>.filter (fun s =>
        -- Prefer predicate/function interpretations when a symbol is overloaded.
        !(syms.rels.contains s) && !(syms.fns.contains s) && !(syms.classFns.contains s))
      |>.map (fun s => s!"axiom {sanitizeIdent (aliasSym s)} : Class")
  let classObjDecls :=
    sortStrings syms.classes.toList
      |>.filter (fun s =>
        !(syms.rels.contains s) && !(syms.fns.contains s) && !(syms.classFns.contains s))
      |>.map (fun s => s!"axiom {sanitizeIdent (aliasSym s)}_obj : Obj")
  let relDecls : List String :=
    sortStrings syms.rels.toList
      |>.filter (fun s => s != "instance" && s != "subclass" && s != "disjoint" && s != "equal" &&
        s != "partition" && s != "exhaustiveDecomposition" && s != "disjointDecomposition")
      -- Prefer function/classFn interpretation when metadata says so, even if the symbol is overloaded.
      |>.filter (fun s => !(hsig.fnSyms.contains s) && !(hsig.clsFnSyms.contains s))
      |>.map (fun s =>
        match hsig.sig.symArity.get? s with
        | some (.variadic) => s!"axiom {sanitizeIdent (aliasSym s)} : VarPred"
        | some (.fixed n) =>
            let tys := (List.range n).map (fun i => argTy s (i + 1))
            s!"axiom {sanitizeIdent (aliasSym s)} : {curriedTys tys "Prop"}"
        | none => s!"axiom {sanitizeIdent (aliasSym s)} : VarPred")
  let fnDecls : List String :=
    sortStrings syms.fns.toList
      -- Only treat symbols as functions when metadata says they are functions, and avoid class-valued fns.
      |>.filter (fun s => hsig.fnSyms.contains s && !(hsig.clsFnSyms.contains s))
      |>.map (fun s =>
        match hsig.sig.symArity.get? s with
        | some (.variadic) => s!"axiom {sanitizeIdent (aliasSym s)} : VarFn"
        | some (.fixed n) =>
            let tys := (List.range n).map (fun i => argTy s (i + 1))
            s!"axiom {sanitizeIdent (aliasSym s)} : {curriedTys tys "Obj"}"
        | none => s!"axiom {sanitizeIdent (aliasSym s)} : VarFn")
  let clsFnDecls : List String :=
    sortStrings syms.classFns.toList
      |>.filter (fun s => !(syms.rels.contains s) && !(syms.classes.contains s))
      |>.map (fun s =>
        match hsig.sig.symArity.get? s with
        | some (.variadic) => s!"axiom {sanitizeIdent (aliasSym s)} : ClassFn"
        | some (.fixed n) =>
            let tys := (List.range n).map (fun i => argTy s (i + 1))
            s!"axiom {sanitizeIdent (aliasSym s)} : {curriedTys tys "Class"}"
        | none => s!"axiom {sanitizeIdent (aliasSym s)} : ClassFn")
  let entDecls :=
    sortStrings syms.ents.toList
      |>.filter (fun s =>
        !(syms.classes.contains s) && !(syms.rels.contains s) && !(syms.fns.contains s) && !(syms.classFns.contains s))
      |>.map (fun s => s!"axiom {sanitizeIdent (aliasSym s)} : Obj")
  let relObjDecls :=
    sortStrings syms.relObjs.toList
      |>.map (fun s => s!"axiom {sanitizeIdent (aliasSym s)}_obj : Obj")
  let strDecls :=
    sortStrings syms.strLits.toList
      |>.map (fun s => s!"axiom {sanitizeIdent (litStrName s)} : Obj")
  let numDecls :=
    sortStrings syms.numLits.toList
      |>.map (fun s => s!"axiom {sanitizeIdent (litNumName s)} : Obj")

  let blocks :=
    [ "/-! ## Classes -/\n" ++ String.intercalate "\n" classDecls
    , "/-! ## Entities -/\n" ++ String.intercalate "\n" (classObjDecls ++ entDecls ++ relObjDecls ++ strDecls ++ numDecls)
    , "/-! ## Relations -/\n" ++ String.intercalate "\n" relDecls
    , "/-! ## Functions -/\n" ++ String.intercalate "\n" fnDecls
    , "/-! ## Class-Valued Functions -/\n" ++ String.intercalate "\n" clsFnDecls
    ]
  String.intercalate "\n\n"
    ([ s!"import LeanSUMO.Core\n\nset_option autoImplicit false\n\nnamespace {cfg.preludeModule}\n\nuniverse u\naxiom Obj : Type u\n\nabbrev Class := LeanSUMO.Class Obj\nabbrev instanceOf := @LeanSUMO.instanceOf Obj\nabbrev subclass := @LeanSUMO.subclass Obj\nabbrev disjoint := @LeanSUMO.disjoint Obj\n\naxiom classObj : Class → Obj\naxiom objClass : Obj → Class\n\nabbrev Row := LeanSUMO.Row\nabbrev VarPred : Type := LeanSUMO.VarPred Obj\nabbrev VarFn : Type := LeanSUMO.VarFn Obj\nabbrev ClassFn : Type := LeanSUMO.ClassFn Obj\n\naxiom predObj : VarPred → Obj\naxiom objPred : Obj → VarPred\naxiom fnObj : VarFn → Obj\naxiom objFn : Obj → VarFn\naxiom classFnObj : ClassFn → Obj\naxiom objClassFn : Obj → ClassFn\n\nabbrev va0 := @LeanSUMO.va0 Obj\nabbrev va1 := @LeanSUMO.va1 Obj\nabbrev va2 := @LeanSUMO.va2 Obj\nabbrev va3 := @LeanSUMO.va3 Obj\nabbrev va4 := @LeanSUMO.va4 Obj\nabbrev va5 := @LeanSUMO.va5 Obj\nabbrev va6 := @LeanSUMO.va6 Obj\nabbrev kappa := @LeanSUMO.kappa Obj\nabbrev partition := @LeanSUMO.partition Obj\nabbrev exhaustiveDecomposition := @LeanSUMO.exhaustiveDecomposition Obj\nabbrev disjointDecomposition := @LeanSUMO.disjointDecomposition Obj\nabbrev partitionVA := @LeanSUMO.partitionVA Obj\nabbrev exhaustiveDecompositionVA := @LeanSUMO.exhaustiveDecompositionVA Obj\nabbrev disjointDecompositionVA := @LeanSUMO.disjointDecompositionVA Obj\nabbrev subrelationVA := @LeanSUMO.subrelationVA Obj\n"
      ] ++ blocks ++
     [ s!"\nend {cfg.preludeModule}\n" ])

/-! ## Prelude chunking support -/

structure PreludeDeclLines where
  lines : List String

def collectPreludeDeclLines (hsig : HolSig) (syms : SymSets) : PreludeDeclLines :=
  let argTy (sym : String) (idx : Nat) : String :=
    if hsig.predArgs.isClassArg sym idx then "VarPred"
    else if hsig.clsArgs.isClassArg sym idx then "Class"
    else "Obj"
  let classDecls :=
    sortStrings syms.classes.toList
      |>.filter (fun s =>
        -- Prefer predicate/function interpretations when a symbol is overloaded.
        !(syms.rels.contains s) && !(syms.fns.contains s) && !(syms.classFns.contains s))
      |>.map (fun s => s!"axiom {sanitizeIdent (aliasSym s)} : Class")
  let classObjDecls :=
    sortStrings syms.classes.toList
      |>.filter (fun s =>
        !(syms.rels.contains s) && !(syms.fns.contains s) && !(syms.classFns.contains s))
      |>.map (fun s => s!"axiom {sanitizeIdent (aliasSym s)}_obj : Obj")
  let relDecls : List String :=
    sortStrings syms.rels.toList
      |>.filter (fun s => s != "instance" && s != "subclass" && s != "disjoint" && s != "equal" &&
        s != "partition" && s != "exhaustiveDecomposition" && s != "disjointDecomposition")
      -- Prefer function/classFn interpretation when metadata says so, even if the symbol is overloaded.
      |>.filter (fun s => !(hsig.fnSyms.contains s) && !(hsig.clsFnSyms.contains s))
      |>.map (fun s =>
        match hsig.sig.symArity.get? s with
        | some (.variadic) => s!"axiom {sanitizeIdent (aliasSym s)} : VarPred"
        | some (.fixed n) =>
            let tys := (List.range n).map (fun i => argTy s (i + 1))
            s!"axiom {sanitizeIdent (aliasSym s)} : {curriedTys tys "Prop"}"
        | none => s!"axiom {sanitizeIdent (aliasSym s)} : VarPred")
  let fnDecls : List String :=
    sortStrings syms.fns.toList
      -- Only treat symbols as functions when metadata says they are functions, and avoid class-valued fns.
      |>.filter (fun s => hsig.fnSyms.contains s && !(hsig.clsFnSyms.contains s))
      |>.map (fun s =>
        match hsig.sig.symArity.get? s with
        | some (.variadic) => s!"axiom {sanitizeIdent (aliasSym s)} : VarFn"
        | some (.fixed n) =>
            let tys := (List.range n).map (fun i => argTy s (i + 1))
            s!"axiom {sanitizeIdent (aliasSym s)} : {curriedTys tys "Obj"}"
        | none => s!"axiom {sanitizeIdent (aliasSym s)} : VarFn")
  let clsFnDecls : List String :=
    sortStrings syms.classFns.toList
      |>.filter (fun s => !(syms.rels.contains s) && !(syms.classes.contains s))
      |>.map (fun s =>
        match hsig.sig.symArity.get? s with
        | some (.variadic) => s!"axiom {sanitizeIdent (aliasSym s)} : ClassFn"
        | some (.fixed n) =>
            let tys := (List.range n).map (fun i => argTy s (i + 1))
            s!"axiom {sanitizeIdent (aliasSym s)} : {curriedTys tys "Class"}"
        | none => s!"axiom {sanitizeIdent (aliasSym s)} : ClassFn")
  let entDecls :=
    sortStrings syms.ents.toList
      |>.filter (fun s =>
        !(syms.classes.contains s) && !(syms.rels.contains s) && !(syms.fns.contains s) && !(syms.classFns.contains s))
      |>.map (fun s => s!"axiom {sanitizeIdent (aliasSym s)} : Obj")
  let relObjDecls :=
    sortStrings syms.relObjs.toList
      |>.map (fun s => s!"axiom {sanitizeIdent (aliasSym s)}_obj : Obj")
  let strDecls :=
    sortStrings syms.strLits.toList
      |>.map (fun s => s!"axiom {sanitizeIdent (litStrName s)} : Obj")
  let numDecls :=
    sortStrings syms.numLits.toList
      |>.map (fun s => s!"axiom {sanitizeIdent (litNumName s)} : Obj")
  { lines :=
      ["/-! ## Classes -/"] ++ classDecls ++
      ["" , "/-! ## Entities -/"] ++ (classObjDecls ++ entDecls ++ relObjDecls ++ strDecls ++ numDecls) ++
      ["" , "/-! ## Relations -/"] ++ relDecls ++
      ["" , "/-! ## Functions -/"] ++ fnDecls ++
      ["" , "/-! ## Class-Valued Functions -/"] ++ clsFnDecls }

def emitPreludeBase (cfg : EmitConfig) (preludeBaseMod : String) : String :=
  String.intercalate "\n"
    [ "import LeanSUMO.Core"
    , ""
    , "set_option autoImplicit false"
    , ""
    , s!"namespace {cfg.preludeModule}"
    , ""
    , "universe u"
    , "axiom Obj : Type u"
    , ""
    , "abbrev Class := LeanSUMO.Class Obj"
    , "abbrev instanceOf := @LeanSUMO.instanceOf Obj"
    , "abbrev subclass := @LeanSUMO.subclass Obj"
    , "abbrev disjoint := @LeanSUMO.disjoint Obj"
    , ""
    , "axiom classObj : Class → Obj"
    , "axiom objClass : Obj → Class"
    , ""
    , "abbrev Row := LeanSUMO.Row"
    , "abbrev VarPred : Type := LeanSUMO.VarPred Obj"
    , "abbrev VarFn : Type := LeanSUMO.VarFn Obj"
    , "abbrev ClassFn : Type := LeanSUMO.ClassFn Obj"
    , ""
    , "axiom predObj : VarPred → Obj"
    , "axiom objPred : Obj → VarPred"
    , "axiom fnObj : VarFn → Obj"
    , "axiom objFn : Obj → VarFn"
    , "axiom classFnObj : ClassFn → Obj"
    , "axiom objClassFn : Obj → ClassFn"
    , ""
    , "abbrev va0 := @LeanSUMO.va0 Obj"
    , "abbrev va1 := @LeanSUMO.va1 Obj"
    , "abbrev va2 := @LeanSUMO.va2 Obj"
    , "abbrev va3 := @LeanSUMO.va3 Obj"
    , "abbrev va4 := @LeanSUMO.va4 Obj"
    , "abbrev va5 := @LeanSUMO.va5 Obj"
    , "abbrev va6 := @LeanSUMO.va6 Obj"
    , "abbrev kappa := @LeanSUMO.kappa Obj"
    , "abbrev partition := @LeanSUMO.partition Obj"
    , "abbrev exhaustiveDecomposition := @LeanSUMO.exhaustiveDecomposition Obj"
    , "abbrev disjointDecomposition := @LeanSUMO.disjointDecomposition Obj"
    , "abbrev partitionVA := @LeanSUMO.partitionVA Obj"
    , "abbrev exhaustiveDecompositionVA := @LeanSUMO.exhaustiveDecompositionVA Obj"
    , "abbrev disjointDecompositionVA := @LeanSUMO.disjointDecompositionVA Obj"
    , "abbrev subrelationVA := @LeanSUMO.subrelationVA Obj"
    , ""
    , s!"end {cfg.preludeModule}"
    , ""
    , s!"/-! Auto-generated support module: `{preludeBaseMod}` -/"
    ]

def emitPreludePart (cfg : EmitConfig) (preludeBaseMod : String) (decls : List String) : String :=
  String.intercalate "\n"
    ([ s!"import {preludeBaseMod}"
     , ""
     , "set_option autoImplicit false"
     , ""
     , s!"namespace {cfg.preludeModule}"
     , ""
     ] ++ decls ++
     [ ""
     , s!"end {cfg.preludeModule}"
     ])

def emitAxiomsPrelude (cfg : EmitConfig) : String :=
  -- NOTE: The generated axioms live under `LeanSUMO.Generated.<NAME>.Axioms`, which itself is a
  -- sub-namespace of `LeanSUMO`. Without local aliases, names like `Class`/`VarPred` resolve to
  -- `LeanSUMO.Class`/`LeanSUMO.VarPred` (type constructors) and become ill-typed in binder
  -- positions. We define the specialized aliases once here to keep chunked parts clean.
  let axiomsPreludeMod := cfg.moduleName ++ ".AxiomsPrelude"
  String.intercalate "\n"
    [ s!"import {cfg.preludeModule}"
    , ""
    , "set_option autoImplicit false"
    , "set_option linter.unusedVariables false"
    , ""
    , s!"namespace {cfg.axiomsNamespace}"
    , ""
    , s!"open {cfg.preludeModule}"
    , ""
    , s!"abbrev Obj := {cfg.preludeModule}.Obj"
    , s!"abbrev Class := {cfg.preludeModule}.Class"
    , s!"abbrev Row := {cfg.preludeModule}.Row"
    , s!"abbrev VarPred := {cfg.preludeModule}.VarPred"
    , s!"abbrev VarFn := {cfg.preludeModule}.VarFn"
    , s!"abbrev ClassFn := {cfg.preludeModule}.ClassFn"
    , s!"abbrev instanceOf := {cfg.preludeModule}.instanceOf"
    , s!"abbrev subclass := {cfg.preludeModule}.subclass"
    , s!"abbrev disjoint := {cfg.preludeModule}.disjoint"
    , s!"abbrev va0 := {cfg.preludeModule}.va0"
    , s!"abbrev va1 := {cfg.preludeModule}.va1"
    , s!"abbrev va2 := {cfg.preludeModule}.va2"
    , s!"abbrev va3 := {cfg.preludeModule}.va3"
    , s!"abbrev va4 := {cfg.preludeModule}.va4"
    , s!"abbrev va5 := {cfg.preludeModule}.va5"
    , s!"abbrev va6 := {cfg.preludeModule}.va6"
    , s!"abbrev kappa := {cfg.preludeModule}.kappa"
    , s!"abbrev partition := {cfg.preludeModule}.partition"
    , s!"abbrev exhaustiveDecomposition := {cfg.preludeModule}.exhaustiveDecomposition"
    , s!"abbrev disjointDecomposition := {cfg.preludeModule}.disjointDecomposition"
    , s!"abbrev partitionVA := {cfg.preludeModule}.partitionVA"
    , s!"abbrev exhaustiveDecompositionVA := {cfg.preludeModule}.exhaustiveDecompositionVA"
    , s!"abbrev disjointDecompositionVA := {cfg.preludeModule}.disjointDecompositionVA"
    , s!"abbrev subrelationVA := {cfg.preludeModule}.subrelationVA"
    , ""
    , s!"end {cfg.axiomsNamespace}"
    , ""
    , s!"/-! Auto-generated support module: `{axiomsPreludeMod}` -/"
    ]

/-! ## Typed View Emission -/

def mkDomainAxiomName (sym : String) (idx : Nat) : String :=
  sanitizeIdent (aliasSym sym) ++ s!"_domain{idx}"

def mkRangeAxiomName (sym : String) (asSubclass : Bool) : String :=
  sanitizeIdent (aliasSym sym) ++ (if asSubclass then "_rangeSubclass" else "_range")

structure TypedViewInfo where
  -- For each symbol and argument position, a *preferred* (first) domain class name.
  dom : Std.HashMap String (Std.HashMap Nat String) := {}
  -- Function symbol → range class
  range : Std.HashMap String String := {}
  -- Class-valued function symbol → rangeSubclass class
  rangeSubclass : Std.HashMap String String := {}

def TypedViewInfo.addDom (m : TypedViewInfo) (sym : String) (idx : Nat) (cls : String) : TypedViewInfo :=
  let inner := m.dom.getD sym {}
  -- Keep the first declaration as the preferred type (deterministic, minimal).
  if inner.contains idx then m
  else { m with dom := m.dom.insert sym (inner.insert idx cls) }

def TypedViewInfo.domClass? (m : TypedViewInfo) (sym : String) (idx : Nat) : Option String :=
  (m.dom.getD sym {}).get? idx

def buildTypedViewInfo (hsig : HolSig) (syms : SymSets) (decls : MetaDecls) : TypedViewInfo :=
  let pureClass (c : String) : Bool :=
    SymSets.isPureClassSym syms c &&
      !(isMetaSymbolClassName c) &&
      !(hsig.predArgs.isClassArg c 1) -- cheap guard; meta names only
  let dom :=
    decls.domains.foldl
      (fun acc (sym, idx, cls) =>
        if idx = 0 then acc
        else if isMetaSymbolClassName cls then acc
        else if !(pureClass cls) then acc
        else acc.addDom sym idx cls)
      ({ } : TypedViewInfo)
  let dom :=
    decls.domainSubclasses.foldl
      (fun acc (_sym, idx, _cls) =>
        -- domainSubclass is handled as `Class`-typed arguments, not as subtypes.
        if idx = 0 then acc else acc)
      dom
  let dom :=
    decls.ranges.foldl
      (fun acc (sym, cls) =>
        if pureClass cls then
          -- Keep the first declaration (deterministic, matches `dedupNamedAxioms` behavior for `_range`).
          if acc.range.contains sym then acc else { acc with range := acc.range.insert sym cls }
        else
          acc)
      dom
  decls.rangeSubclasses.foldl
    (fun acc (sym, cls) =>
      if pureClass cls then
        -- Keep the first declaration (deterministic, matches `dedupNamedAxioms` behavior for `_rangeSubclass`).
        if acc.rangeSubclass.contains sym then acc
        else { acc with rangeSubclass := acc.rangeSubclass.insert sym cls }
      else
        acc)
    dom

def emitTypedView (cfg : EmitConfig) (hsig : HolSig) (syms : SymSets) (decls : MetaDecls) : String :=
  let info := buildTypedViewInfo hsig syms decls
  let typedMod := cfg.moduleName ++ ".Typed"
  let preludeMod := cfg.preludeModule
  let axiomsNs := cfg.axiomsNamespace

  let classTypes : List String :=
    sortStrings syms.classes.toList
      |>.filter (fun c => SymSets.isPureClassSym syms c && !(isMetaSymbolClassName c))
      |>.map (fun c =>
        let nm := sanitizeIdent (aliasSym c)
        s!"abbrev {nm} : Type := Of ({preludeMod}.{nm})")

  let mkArgTy (sym : String) (idx : Nat) : String :=
    if hsig.predArgs.isClassArg sym idx then "VarPred"
    else if hsig.clsArgs.isClassArg sym idx then "Class"
    else
      match info.domClass? sym idx with
      | some cls => sanitizeIdent (aliasSym cls)
      | none => "Obj"

  let mkArgCoerce (ty : String) (v : String) : String :=
    match ty with
    | "Obj" => v
    | "Class" => v
    | "VarPred" => v
    | _ => s!"({v} : Obj)"

  let relDefs : List String :=
    sortStrings syms.rels.toList
      |>.filter (fun s =>
        s != "instance" && s != "subclass" && s != "disjoint" && s != "equal" &&
          s != "partition" && s != "exhaustiveDecomposition" && s != "disjointDecomposition")
      |>.filter (fun s =>
        match hsig.sig.symArity.get? s with
        | some (.fixed _) => true
        | _ => false)
      |>.filter (fun s =>
        -- Only emit a typed wrapper if at least one arg can be specialized.
        match hsig.sig.symArity.get? s with
        | some (.fixed n) =>
            (List.range n).any (fun i =>
              let idx := i + 1
              !(mkArgTy s idx = "Obj"))
        | _ => false)
      |>.map (fun s =>
        let sNm := sanitizeIdent (aliasSym s)
        let n :=
          match hsig.sig.symArity.get? s with
          | some (.fixed n) => n
          | _ => 0
        let argTys := (List.range n).map (fun i => mkArgTy s (i + 1))
        let vars := (List.range n).map (fun i => s!"x{i+1}")
        let sigTy := curriedTys argTys "Prop"
        let args :=
          (List.zip argTys vars).map (fun (ty, v) => mkArgCoerce ty v)
        let body := s!"{preludeMod}.{sNm} {String.intercalate " " (args.map paren)}"
        s!"def {sNm} : {sigTy} := fun {String.intercalate " " vars} => {body}")

  let fnDefs : List String :=
    sortStrings syms.fns.toList
      |>.filter (fun s =>
        match hsig.sig.symArity.get? s with
        | some (.fixed _) => true
        | _ => false)
      |>.filter (fun s => info.range.contains s)
      |>.map (fun s =>
        let sNm := sanitizeIdent (aliasSym s)
        let n :=
          match hsig.sig.symArity.get? s with
          | some (.fixed n) => n
          | _ => 0
        let argTys := (List.range n).map (fun i => mkArgTy s (i + 1))
        let vars := (List.range n).map (fun i => s!"x{i+1}")
        let sigTy := curriedTys argTys (sanitizeIdent (aliasSym (info.range.getD s "")))
        let args :=
          (List.zip argTys vars).map (fun (ty, v) => mkArgCoerce ty v)
        let rangeAx := mkRangeAxiomName s false
        let app := s!"{preludeMod}.{sNm} {String.intercalate " " (args.map paren)}"
        let proof :=
          s!"{axiomsNs}.{rangeAx} {String.intercalate " " (args.map paren)}"
        s!"def {sNm} : {sigTy} := fun {String.intercalate " " vars} => ⟨{app}, by simpa using {proof}⟩")

  let clsFnDefs : List String :=
    sortStrings syms.classFns.toList
      |>.filter (fun s =>
        match hsig.sig.symArity.get? s with
        | some (.fixed _) => true
        | _ => false)
      |>.map (fun s =>
        let sNm := sanitizeIdent (aliasSym s)
        let n :=
          match hsig.sig.symArity.get? s with
          | some (.fixed n) => n
          | _ => 0
        let argTys := (List.range n).map (fun i => mkArgTy s (i + 1))
        let vars := (List.range n).map (fun i => s!"x{i+1}")
        let sigTy := curriedTys argTys "Class"
        let args :=
          (List.zip argTys vars).map (fun (ty, v) => mkArgCoerce ty v)
        let body := s!"{preludeMod}.{sNm} {String.intercalate " " (args.map paren)}"
        s!"def {sNm} : {sigTy} := fun {String.intercalate " " vars} => {body}")

  String.intercalate "\n"
    ([ s!"import {preludeMod}"
     , s!"import {cfg.axiomsModule}"
     , ""
     , "set_option autoImplicit false"
     , ""
     , s!"namespace {typedMod}"
     , ""
     , "noncomputable section"
     , ""
     , s!"open {preludeMod}"
     , ""
     , s!"abbrev Obj := {preludeMod}.Obj"
     , s!"abbrev Class := {preludeMod}.Class"
     , s!"abbrev VarPred := {preludeMod}.VarPred"
     , ""
     , "/-- Objects satisfying a class predicate. -/"
     , "abbrev Of (C : Class) : Type := { x : Obj // C x }"
     , "instance {C : Class} : CoeTC (Of C) Obj where coe x := x.1"
     , ""
     , "/-! ## Class Types -/"
     ] ++ classTypes ++
     [ ""
     , "/-! ## Typed Relations (best-effort, from domain metadata) -/"
     ] ++ relDefs ++
     [ ""
     , "/-! ## Typed Functions (using range metadata) -/"
     ] ++ fnDefs ++
     [ ""
     , "/-! ## Typed Class-Valued Functions -/"
     ] ++ clsFnDefs ++
     [ ""
     , "end"
     , s!"end {typedMod}"
     ])

def emitAxioms (cfg : EmitConfig) (hsig : HolSig) (syms : SymSets) (axioms : List AxiomDecl) (startIdx : Nat := 1) : String :=
  let decls :=
    let (_, rev) :=
      axioms.foldl
        (init := (startIdx, ([] : List String)))
        (fun (i, acc) ax =>
          let roles := inferRoles hsig {} .formula ax.expr
          let nm := ax.name?.getD s!"{axiomStem ax.expr}_{i}"
          let prop := renderFormula hsig syms roles ax.expr
          -- The KIF snippet may contain arbitrary text (including `/-`), so prefer a line comment
          -- over a block comment to avoid unterminated-comment errors in generated code.
          let doc := s!"-- {ax.src.replace "\n" " "}"
          (i + 1, s!"{doc}\naxiom {nm} : {prop}" :: acc))
    rev.reverse
  String.intercalate "\n\n"
    [ s!"import {cfg.moduleName}.AxiomsPrelude\n\nset_option autoImplicit false\nset_option linter.unusedVariables false\n\nnamespace {cfg.axiomsNamespace}\n\nopen {cfg.preludeModule}\n"
    , String.intercalate "\n\n" decls
    , s!"\nend {cfg.axiomsNamespace}\n"
    ]

end HolEmit
