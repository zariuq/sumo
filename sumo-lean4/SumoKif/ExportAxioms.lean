import Std
import SumoKif.Sexp
import SumoKif.Symbols

set_option autoImplicit false

namespace SumoKif

structure MetaDecls : Type where
  domains : List (String × Nat × String) := []
  domainSubclasses : List (String × Nat × String) := []
  ranges : List (String × String) := []
  rangeSubclasses : List (String × String) := []

def MetaDecls.addDomain (m : MetaDecls) (sym : String) (idx : Nat) (cls : String) : MetaDecls :=
  { m with domains := (sym, idx, cls) :: m.domains }

def MetaDecls.addDomainSubclass (m : MetaDecls) (sym : String) (idx : Nat) (cls : String) : MetaDecls :=
  { m with domainSubclasses := (sym, idx, cls) :: m.domainSubclasses }

def MetaDecls.addRange (m : MetaDecls) (sym : String) (cls : String) : MetaDecls :=
  { m with ranges := (sym, cls) :: m.ranges }

def MetaDecls.addRangeSubclass (m : MetaDecls) (sym : String) (cls : String) : MetaDecls :=
  { m with rangeSubclasses := (sym, cls) :: m.rangeSubclasses }

def quoteIdent (s : String) : String :=
  "«" ++ s ++ "»"

def renderConst (s : String) : String :=
  "Const." ++ quoteIdent s

def renderVar (s : String) : String :=
  quoteIdent s

def renderStrLit (s : String) : String :=
  "strLit " ++ reprStr s

def renderNumLit (s : String) : String :=
  "numLit " ++ reprStr s

def renderListLiteral (xs : List String) : String :=
  "[" ++ String.intercalate ", " xs ++ "]"

mutual

  partial def renderObj : Sexp → String
    | .atom (.str v) => renderStrLit v
    | .atom (.sym s) =>
        if isVarLike s then
          renderVar s
        else if isNumericToken s then
          renderNumLit s
        else
          renderConst s
    | .list xs =>
        match xs with
        | [] => renderListLiteral []
        | head :: args =>
            match head.asSym? with
            | some "and" => "mkAnd " ++ renderListLiteral (args.map renderObj)
            | some "or" => "mkOr " ++ renderListLiteral (args.map renderObj)
            | some "not" =>
                match args with
                | [φ] => "mkNot (" ++ renderObj φ ++ ")"
                | _ => "mkNot (" ++ renderListLiteral (args.map renderObj) ++ ")"
            | some "=>" =>
                match args with
                | [] => "mkAnd []"
                | [φ] => renderObj φ
                | φ :: rest =>
                    rest.foldl (fun acc ψ => "mkImp (" ++ acc ++ ") (" ++ renderObj ψ ++ ")") (renderObj φ)
            | some "<=>" =>
                match args with
                | [φ, ψ] => "mkIff (" ++ renderObj φ ++ ") (" ++ renderObj ψ ++ ")"
                | _ => "mkIff (" ++ renderListLiteral (args.map renderObj) ++ ") (" ++ renderListLiteral [] ++ ")"
            | some "forall" =>
                match args with
                | binder :: body :: _ => renderQuant "mkForall" "mkForallRow" binder body
                | _ => "mkAnd []"
            | some "exists" =>
                match args with
                | binder :: body :: _ => renderQuant "mkExists" "mkExistsRow" binder body
                | _ => "mkAnd []"
            | _ =>
                let hObj := renderObj head
                let spine := renderArgSpine args
                "ap (" ++ hObj ++ ") (" ++ spine ++ ")"

  partial def renderArgSpine (args : List Sexp) : String :=
    let (segsRev, pendingRev) :=
      args.foldl
        (init := (([] : List (Sum (List String) String)), ([] : List String)))
        (fun (segs, pending) a =>
          match a.asSym? with
          | some s =>
              if s.startsWith "@" then
                let segs :=
                  if pending.isEmpty then
                    segs
                  else
                    Sum.inl pending.reverse :: segs
                (Sum.inr (renderVar s) :: segs, [])
              else
                (segs, renderObj a :: pending)
          | none =>
              (segs, renderObj a :: pending))

    let segsRev :=
      if pendingRev.isEmpty then
        segsRev
      else
        Sum.inl pendingRev.reverse :: segsRev

    let renderSeg : Sum (List String) String → String
      | Sum.inl ts => renderListLiteral ts
      | Sum.inr row => row

    match (segsRev.reverse.map renderSeg) with
    | [] => "[]"
    | [x] => x
    | xs => String.intercalate " ++ " xs

  partial def renderQuant (qObj qRow : String) (binder body : Sexp) : String :=
    let vars :=
      match binder with
      | .list vs => vs
      | v => [v]
    let mkOne (v : Sexp) (inner : String) : String :=
      match v.asSym? with
      | some name =>
          if name.startsWith "@" then
            qRow ++ " (fun (" ++ renderVar name ++ " : List Obj) => " ++ inner ++ ")"
          else
            qObj ++ " (fun (" ++ renderVar name ++ " : Obj) => " ++ inner ++ ")"
      | none => inner
    vars.foldr (fun v inner => mkOne v inner) (renderObj body)

end

def parseDomainDecl? (s : Sexp) : Option (String × Nat × String × Bool) :=
  match s with
  | .list ((.atom (.sym "domain")) :: (.atom (.sym sym)) :: (.atom (.sym idxStr)) :: (.atom (.sym cls)) :: _) =>
      idxStr.toNat?.map (fun n => (sym, n, cls, false))
  | .list ((.atom (.sym "domainSubclass")) :: (.atom (.sym sym)) :: (.atom (.sym idxStr)) :: (.atom (.sym cls)) :: _) =>
      idxStr.toNat?.map (fun n => (sym, n, cls, true))
  | _ => none

def parseRangeDecl? (s : Sexp) : Option (String × String × Bool) :=
  match s with
  | .list ((.atom (.sym "range")) :: (.atom (.sym sym)) :: (.atom (.sym cls)) :: _) =>
      some (sym, cls, false)
  | .list ((.atom (.sym "rangeSubclass")) :: (.atom (.sym sym)) :: (.atom (.sym cls)) :: _) =>
      some (sym, cls, true)
  | _ => none

def isMetaHead (h : String) : Bool :=
  h = "documentation" || h = "termFormat" || h = "format" ||
    h = "domain" || h = "domainSubclass" || h = "range" || h = "rangeSubclass"

def hashSetUnion (a b : Std.HashSet String) : Std.HashSet String :=
  b.toList.foldl (fun acc s => acc.insert s) a

partial def freeVars (s : Sexp) (boundTerms : Std.HashSet String := {}) (boundRows : Std.HashSet String := {}) :
    Std.HashSet String × Std.HashSet String :=
  match s with
  | .atom (.sym v) =>
      if v.startsWith "?" then
        if boundTerms.contains v then
          ({}, {})
        else
          (Std.HashSet.emptyWithCapacity.insert v, {})
      else if v.startsWith "@" then
        if boundRows.contains v then
          ({}, {})
        else
          ({}, Std.HashSet.emptyWithCapacity.insert v)
      else
        ({}, {})
  | .atom (.str _) => ({}, {})
  | .list xs =>
      match xs with
      | (.atom (.sym "forall")) :: binder :: body :: _ =>
          let (bt, br) := addBinder binder boundTerms boundRows
          freeVars body bt br
      | (.atom (.sym "exists")) :: binder :: body :: _ =>
          let (bt, br) := addBinder binder boundTerms boundRows
          freeVars body bt br
      | _ =>
          xs.foldl
            (fun (accT, accR) child =>
              let (t, r) := freeVars child boundTerms boundRows
              (hashSetUnion accT t, hashSetUnion accR r))
            ({}, {})
where
  addBinder (b : Sexp) (bt : Std.HashSet String) (br : Std.HashSet String) : Std.HashSet String × Std.HashSet String :=
    let vs :=
      match b with
      | .list xs => xs
      | x => [x]
    vs.foldl
      (fun (bt', br') v =>
        match v.asSym? with
        | some name =>
            if name.startsWith "@" then
              (bt', br'.insert name)
            else if name.startsWith "?" then
              (bt'.insert name, br')
            else
              (bt', br')
        | none => (bt', br'))
      (bt, br)

def sortStrings (xs : List String) : List String :=
  (xs.toArray.qsort (fun a b => a < b)).toList

def renderAssertion (idx : Nat) (s : Sexp) : String :=
  let (fts, frs) := freeVars s
  let termVars := sortStrings fts.toList
  let rowVars := sortStrings frs.toList
  let binders :=
    (termVars.map (fun v => "(" ++ renderVar v ++ " : Obj)")) ++
      (rowVars.map (fun v => "(" ++ renderVar v ++ " : List Obj)"))
  let axiomPrefix :=
    if binders.isEmpty then
      ""
    else
      "∀ " ++ String.intercalate " " binders ++ ", "
  "axiom ax_" ++ toString idx ++ " : " ++ axiomPrefix ++ "Holds (" ++ renderObj s ++ ")"

def foldDecls (xs : List Sexp) : MetaDecls × List Sexp :=
  xs.foldl
    (fun (m, acc) s =>
      match parseDomainDecl? s with
      | some (sym, idx, cls, false) => (m.addDomain sym idx cls, acc)
      | some (sym, idx, cls, true) => (m.addDomainSubclass sym idx cls, acc)
      | none =>
          match parseRangeDecl? s with
          | some (sym, cls, false) => (m.addRange sym cls, acc)
          | some (sym, cls, true) => (m.addRangeSubclass sym cls, acc)
          | none =>
              match s with
              | .list (h :: _) =>
                  match h.asSym? with
                  | some head => if isMetaHead head then (m, acc) else (m, s :: acc)
                  | none => (m, s :: acc)
              | _ => (m, s :: acc))
    ({}, [])
    |> fun (m, acc) => (m, acc.reverse)

def renderMetaDecls (m : MetaDecls) : String :=
  let renderDom (sym : String) (idx : Nat) (cls : String) : String :=
    s!"  (Const.{quoteIdent sym}, {idx}, Const.{quoteIdent cls})"
  let renderRng (sym : String) (cls : String) : String :=
    s!"  (Const.{quoteIdent sym}, Const.{quoteIdent cls})"
  let doms := (m.domains.map (fun (sym, idx, cls) => renderDom sym idx cls)).reverse
  let domSubs := (m.domainSubclasses.map (fun (sym, idx, cls) => renderDom sym idx cls)).reverse
  let rngs := (m.ranges.map (fun (sym, cls) => renderRng sym cls)).reverse
  let rngSubs := (m.rangeSubclasses.map (fun (sym, cls) => renderRng sym cls)).reverse
  String.intercalate "\n"
    [ "noncomputable section"
    , "def domainDecls : List (Obj × Nat × Obj) :="
    , " [" ++ "\n" ++ String.intercalate ",\n" doms ++ "\n ]"
    , "def domainSubclassDecls : List (Obj × Nat × Obj) :="
    , " [" ++ "\n" ++ String.intercalate ",\n" domSubs ++ "\n ]"
    , "def rangeDecls : List (Obj × Obj) :="
    , " [" ++ "\n" ++ String.intercalate ",\n" rngs ++ "\n ]"
    , "def rangeSubclassDecls : List (Obj × Obj) :="
    , " [" ++ "\n" ++ String.intercalate ",\n" rngSubs ++ "\n ]"
    , "end"
    ]

def renderAxiomsFile (moduleName : String) (xs : List Sexp) : String :=
  let (metaDecls, assertions) := foldDecls xs
  let axLines :=
    let (_, revLines) :=
      assertions.foldl
        (init := (1, ([] : List String)))
        (fun (idx, acc) s => (idx + 1, renderAssertion idx s :: acc))
    revLines.reverse
  String.intercalate "\n\n"
    [ "import Sumo.Signature"
    , "namespace Sumo"
    , s!"namespace {moduleName}"
    , renderMetaDecls metaDecls
    , String.intercalate "\n" axLines
    , s!"end {moduleName}"
    , "end Sumo"
    ]

end SumoKif
