import Std
import SumoKif.Sexp
import SumoKif.Symbols
import SumoKif.ExportAxioms

set_option autoImplicit false

namespace SumoKif

def renderAstVar (v : String) : String :=
  if v.startsWith "@" then
    "Sumo.Ast.rowVar " ++ reprStr v
  else
    "Sumo.Ast.termVar " ++ reprStr v

def renderAstVarFromBinder (s : Sexp) : Option String :=
  match s.asSym? with
  | some v =>
      if v.startsWith "?" || v.startsWith "@" then
        some (renderAstVar v)
      else
        none
  | none => none

mutual

  partial def renderAstExpr : Sexp → String
    | .atom (.str v) => "Sumo.Ast.Expr.str " ++ reprStr v
    | .atom (.sym s) =>
        if isNumericToken s then
          "Sumo.Ast.Expr.num " ++ reprStr s
        else if s.startsWith "?" || s.startsWith "@" then
          "Sumo.Ast.Expr.var (" ++ renderAstVar s ++ ")"
        else
          "Sumo.Ast.Expr.sym " ++ reprStr s
    | .list xs =>
        match xs with
        | [] => "Sumo.Ast.Expr.and_ []"
        | head :: args =>
            match head.asSym? with
            | some "and" => "Sumo.Ast.Expr.and_ " ++ renderListLiteral (args.map renderAstExpr)
            | some "or" => "Sumo.Ast.Expr.or_ " ++ renderListLiteral (args.map renderAstExpr)
            | some "not" =>
                match args with
                | [φ] => "Sumo.Ast.Expr.not_ (" ++ renderAstExpr φ ++ ")"
                | _ => renderGenericApp head args
            | some "=>" =>
                match args with
                | [φ, ψ] => "Sumo.Ast.Expr.imp (" ++ renderAstExpr φ ++ ") (" ++ renderAstExpr ψ ++ ")"
                | _ => renderGenericApp head args
            | some "<=>" =>
                match args with
                | [φ, ψ] => "Sumo.Ast.Expr.iff (" ++ renderAstExpr φ ++ ") (" ++ renderAstExpr ψ ++ ")"
                | _ => renderGenericApp head args
            | some "forall" =>
                match args with
                | binder :: body :: _ => renderAstQuant "Sumo.Ast.Expr.forall_" binder body
                | _ => renderGenericApp head args
            | some "exists" =>
                match args with
                | binder :: body :: _ => renderAstQuant "Sumo.Ast.Expr.exists_" binder body
                | _ => renderGenericApp head args
            | _ => renderGenericApp head args
  where
    renderGenericApp (head : Sexp) (args : List Sexp) : String :=
      "Sumo.Ast.Expr.app (" ++ renderAstExpr head ++ ") " ++
        renderListLiteral (args.map renderAstArg)

  partial def renderAstArg : Sexp → String
    | .atom (.sym s) =>
        if s.startsWith "@" then
          "Sumo.Ast.Expr.splice " ++ reprStr s
        else
          renderAstExpr (.atom (.sym s))
    | other => renderAstExpr other

  partial def renderAstQuant (ctor : String) (binder body : Sexp) : String :=
    let vars :=
      match binder with
      | .list vs => vs
      | v => [v]
    let rendered :=
      vars.filterMap renderAstVarFromBinder
    ctor ++ " [" ++ String.intercalate ", " rendered ++ "] (" ++ renderAstExpr body ++ ")"

end

def renderAstMetaDecls (m : MetaDecls) : String :=
  let renderDom (sym : String) (idx : Nat) (cls : String) : String :=
    s!"  ({reprStr sym}, {idx}, {reprStr cls})"
  let renderRng (sym : String) (cls : String) : String :=
    s!"  ({reprStr sym}, {reprStr cls})"
  let doms := (m.domains.map (fun (sym, idx, cls) => renderDom sym idx cls)).reverse
  let domSubs := (m.domainSubclasses.map (fun (sym, idx, cls) => renderDom sym idx cls)).reverse
  let rngs := (m.ranges.map (fun (sym, cls) => renderRng sym cls)).reverse
  let rngSubs := (m.rangeSubclasses.map (fun (sym, cls) => renderRng sym cls)).reverse
  String.intercalate "\n"
    [ "def domainDecls : List (String × Nat × String) :="
    , " [" ++ "\n" ++ String.intercalate ",\n" doms ++ "\n ]"
    , "def domainSubclassDecls : List (String × Nat × String) :="
    , " [" ++ "\n" ++ String.intercalate ",\n" domSubs ++ "\n ]"
    , "def rangeDecls : List (String × String) :="
    , " [" ++ "\n" ++ String.intercalate ",\n" rngs ++ "\n ]"
    , "def rangeSubclassDecls : List (String × String) :="
    , " [" ++ "\n" ++ String.intercalate ",\n" rngSubs ++ "\n ]"
    ]

def renderClosedAstExpr (s : Sexp) : String :=
  let (fts, frs) := freeVars s
  let termVars := sortStrings fts.toList
  let rowVars := sortStrings frs.toList
  let body := renderAstExpr s
  let binders :=
    (termVars.map renderAstVar) ++ (rowVars.map renderAstVar)
  if binders.isEmpty then
    body
  else
    "Sumo.Ast.Expr.forall_ [" ++ String.intercalate ", " binders ++ "] (" ++ body ++ ")"

partial def chunkList {α : Type} (xs : List α) (n : Nat) : List (List α) :=
  if n = 0 then
    [xs]
  else
    match xs with
    | [] => []
    | _ =>
        let head := xs.take n
        let tail := xs.drop n
        head :: chunkList tail n

def renderAxiomChunks (chunks : List (List String)) : String × List String :=
  let (_, defsRev, namesRev) :=
    chunks.foldl
      (init := (1, ([] : List String), ([] : List String)))
      (fun (i, defs, names) chunk =>
        let name := s!"axioms_chunk_{i}"
        let defn :=
          String.intercalate "\n"
            [ s!"def {name} : List Sumo.Ast.Expr :="
            , " [" ++ "\n" ++ String.intercalate ",\n" chunk ++ "\n ]"
            ]
        (i + 1, defn :: defs, name :: names))
  (String.intercalate "\n\n" defsRev.reverse, namesRev.reverse)

def renderAstTheoryFile (moduleName : String) (xs : List Sexp) : String :=
  let (metaDecls, assertions) := foldDecls xs
  let axioms := assertions.map renderClosedAstExpr
  let axiomCount := assertions.length
  let chunkSize : Nat := 200
  let chunks := chunkList axioms chunkSize
  let (chunkDefs, chunkNames) := renderAxiomChunks chunks
  String.intercalate "\n\n"
    [ "import Sumo.Ast"
    , "set_option autoImplicit false"
    , "set_option maxRecDepth 4096"
    , "namespace Sumo"
    , s!"namespace {moduleName}"
    , renderAstMetaDecls metaDecls
    , chunkDefs
    , "def axioms : List Sumo.Ast.Expr :="
    , "  " ++ String.intercalate " ++ " chunkNames
    , s!"def axiomCount : Nat := {axiomCount}"
    , s!"end {moduleName}"
    , "end Sumo"
    ]

end SumoKif
