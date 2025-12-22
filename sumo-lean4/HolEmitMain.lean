import Std
import Lean
import SumoKif.ParseSexp
import SumoKif.Signature
import SumoKif.ExportAxioms
import SumoKif.ToAst
import SumoKif.HolEmit

set_option autoImplicit false

open Lean
open SumoKif
open SumoKif.HolEmit

partial def chunkList {α : Type} (n : Nat) (xs : List α) : List (List α) :=
  if n = 0 then
    [xs]
  else
    match xs with
    | [] => []
    | _ =>
        let (a, b) := xs.splitAt n
        a :: chunkList n b

partial def collectKifFiles (root : System.FilePath) (includeTests : Bool) (includeTiny : Bool) :
    IO (Array System.FilePath) := do
  let paths ←
    System.FilePath.walkDir root (enter := fun p => do
      let name := p.fileName
      if name = ".git" || name = ".lake" || name = "sumo-lean4" then
        return false
      else if !includeTests && name = "tests" then
        return false
      else
        return true)
  let mut files := paths.filter (fun p => p.toString.endsWith ".kif")
  if !includeTiny then
    files := files.filter (fun p => !((p.fileName.getD "").startsWith "tiny"))
  return files.qsort (fun a b => a.toString < b.toString)

def SumoKif.MetaDecls.merge (a b : SumoKif.MetaDecls) : SumoKif.MetaDecls :=
  { domains := a.domains ++ b.domains
    domainSubclasses := a.domainSubclasses ++ b.domainSubclasses
    ranges := a.ranges ++ b.ranges
    rangeSubclasses := a.rangeSubclasses ++ b.rangeSubclasses }

def dedupNamedAxioms (axs : List SumoKif.HolEmit.AxiomDecl) : List SumoKif.HolEmit.AxiomDecl :=
  let (_, rev) :=
    axs.foldl
      (init := (({} : Std.HashSet String), ([] : List SumoKif.HolEmit.AxiomDecl)))
      (fun (seen, acc) ax =>
        match ax.name? with
        | some n =>
            if seen.contains n then
              (seen, acc)
            else
              (seen.insert n, ax :: acc)
        | none =>
            (seen, ax :: acc))
  rev.reverse

def isMetaInstanceDecl (s : SumoKif.Sexp) : Bool :=
  match s with
  | .list ((.atom (.sym "instance")) :: (.atom (.sym _sym)) :: (.atom (.sym cls)) :: _) =>
      match SumoKif.arityOfSymbolClass? cls with
      | some _ => true
      | none =>
          cls = "Class" || cls = "Relation" || cls = "Predicate" || cls = "Function" ||
            cls.endsWith "Predicate" || cls.endsWith "Relation" || cls.endsWith "Function"
  | _ => false

def rewriteSubrelation? (sig : Signature) (fnSyms : Std.HashSet String) (s : SumoKif.Sexp) :
    Option Sumo.Ast.Expr :=
  match s with
  | .list ((.atom (.sym "subrelation")) :: (.atom (.sym r1)) :: (.atom (.sym r2)) :: _) =>
      match sig.symArity.get? r1, sig.symArity.get? r2 with
      | some .variadic, some .variadic =>
          let row : Sumo.Ast.Var := Sumo.Ast.rowVar "@ROW"
          let body : Sumo.Ast.Expr :=
            .imp (.app (.sym r1) [.splice "@ROW"]) (.app (.sym r2) [.splice "@ROW"])
          some (.forall_ [row] body)
      | some (.fixed n1), some (.fixed n2) =>
          if n1 = n2 then
            let vars : List Sumo.Ast.Var :=
              (List.range n1).map (fun i => Sumo.Ast.termVar s!"?X{i+1}")
            let args : List Sumo.Ast.Expr := vars.map (fun v => .var v)
            let body : Sumo.Ast.Expr :=
              if fnSyms.contains r1 && fnSyms.contains r2 then
                -- SUMO sometimes relates *function symbols* via `subrelation` (treating their graphs as relations).
                -- In a curried HOL view this is best approximated as pointwise equality.
                .app (.sym "equal") [(.app (.sym r1) args), (.app (.sym r2) args)]
              else
                .imp (.app (.sym r1) args) (.app (.sym r2) args)
            some (.forall_ vars body)
          else
            none
      | _, _ => none
  | _ => none

def isMetaClassName (cls : String) : Bool :=
  match SumoKif.arityOfSymbolClass? cls with
  | some _ => true
  | none =>
      cls = "Class" || cls = "Relation" || cls = "Predicate" || cls = "Function" ||
        cls.endsWith "Predicate" || cls.endsWith "Relation" || cls.endsWith "Function"

partial def containsMetaInstance : SumoKif.Sexp → Bool
  | .list ((.atom (.sym "instance")) :: _ :: (.atom (.sym cls)) :: _) =>
      isMetaClassName cls
  | .list xs => xs.any containsMetaInstance
  | _ => false

def isMetaOntologyPredicateHead (h : String) : Bool :=
  h = "domain" || h = "domainSubclass" || h = "range" || h = "rangeSubclass"

def isNonClassSymbol (sig : Signature) (sym : String) : Bool :=
  match sig.symArity.get? sym with
  | some _ => true
  | none => false

partial def containsMetaOntologyPredicate : SumoKif.Sexp → Bool
  | .list xs =>
      let headIsMeta :=
        match xs with
        | (.atom (.sym h)) :: _ => isMetaOntologyPredicateHead h
        | _ => false
      headIsMeta || xs.any containsMetaOntologyPredicate
  | _ => false

def isRelPropertyClass (cls : String) : Bool :=
  cls = "TransitiveRelation" ||
    cls = "SymmetricRelation" ||
    cls = "AsymmetricRelation" ||
    cls = "ReflexiveRelation" ||
    cls = "IrreflexiveRelation" ||
    cls = "AntisymmetricRelation"

def mkRelPropAxiom? (sig : Signature) (sym : String) (cls : String) :
    Option SumoKif.HolEmit.AxiomDecl :=
  match sig.symArity.get? sym with
  | some (.fixed 2) =>
      let x : Sumo.Ast.Var := Sumo.Ast.termVar "?X"
      let y : Sumo.Ast.Var := Sumo.Ast.termVar "?Y"
      let z : Sumo.Ast.Var := Sumo.Ast.termVar "?Z"
      let vx : Sumo.Ast.Expr := .var x
      let vy : Sumo.Ast.Expr := .var y
      let vz : Sumo.Ast.Expr := .var z
      let R (a b : Sumo.Ast.Expr) : Sumo.Ast.Expr := .app (.sym sym) [a, b]
      let eqXY : Sumo.Ast.Expr := .app (.sym "equal") [vx, vy]
      let expr : Sumo.Ast.Expr :=
        match cls with
        | "TransitiveRelation" =>
            .forall_ [x, y, z] (.imp (R vx vy) (.imp (R vy vz) (R vx vz)))
        | "SymmetricRelation" =>
            .forall_ [x, y] (.imp (R vx vy) (R vy vx))
        | "AsymmetricRelation" =>
            .forall_ [x, y] (.imp (R vx vy) (.not_ (R vy vx)))
        | "ReflexiveRelation" =>
            .forall_ [x] (R vx vx)
        | "IrreflexiveRelation" =>
            .forall_ [x] (.not_ (R vx vx))
        | "AntisymmetricRelation" =>
            .forall_ [x, y] (.imp (R vx vy) (.imp (R vy vx) eqXY))
        | _ =>
            -- not supported here
            .and_ []
      let name := sanitizeIdent ((aliasSym sym).toLower ++ "_" ++ cls.toLower)
      some { name? := some name
             src := s!"(instance {sym} {cls}) (compiled relation property)"
             expr := expr }
  | _ => none

def mkDomainAxiom? (sig : Signature) (sym : String) (idx : Nat) (cls : String) (asSubclass : Bool) :
    Option SumoKif.HolEmit.AxiomDecl :=
  match sig.symArity.get? sym with
  | some (.fixed n) =>
      if idx == 0 || idx > n then
        none
      else
        let vars : List Sumo.Ast.Var :=
          (List.range n).map (fun i => Sumo.Ast.termVar s!"?X{i+1}")
        let args : List Sumo.Ast.Expr := vars.map (fun v => .var v)
        let head : Sumo.Ast.Expr := .app (.sym sym) args
        let arg := args.getD (idx - 1) (.sym "__missingArg")
        let concl : Sumo.Ast.Expr :=
          if asSubclass then
            .app (.sym "subclass") [arg, .sym cls]
          else
            .app (.sym "instance") [arg, .sym cls]
        some
          { name? := some (sanitizeIdent (aliasSym sym) ++ s!"_domain{idx}")
            src := if asSubclass then s!"(domainSubclass {sym} {idx} {cls}) (compiled)" else s!"(domain {sym} {idx} {cls}) (compiled)"
            expr := .forall_ vars (.imp head concl) }
  | _ => none

def mkRangeAxiom? (sig : Signature) (sym : String) (cls : String) (asSubclass : Bool) :
    Option SumoKif.HolEmit.AxiomDecl :=
  match sig.symArity.get? sym with
  | some (.fixed n) =>
      let vars : List Sumo.Ast.Var :=
        (List.range n).map (fun i => Sumo.Ast.termVar s!"?X{i+1}")
      let args : List Sumo.Ast.Expr := vars.map (fun v => .var v)
      let term : Sumo.Ast.Expr := .app (.sym sym) args
      let concl : Sumo.Ast.Expr :=
        if asSubclass then
          .app (.sym "subclass") [term, .sym cls]
        else
          .app (.sym "instance") [term, .sym cls]
      some
        { name? := some (sanitizeIdent (aliasSym sym) ++ (if asSubclass then "_rangeSubclass" else "_range"))
          src := if asSubclass then s!"(rangeSubclass {sym} {cls}) (compiled)" else s!"(range {sym} {cls}) (compiled)"
          expr := if vars.isEmpty then concl else .forall_ vars concl }
  | some .variadic =>
      let row : Sumo.Ast.Var := Sumo.Ast.rowVar "@ROW"
      let term : Sumo.Ast.Expr := .app (.sym sym) [.splice "@ROW"]
      let concl : Sumo.Ast.Expr :=
        if asSubclass then
          .app (.sym "subclass") [term, .sym cls]
        else
          .app (.sym "instance") [term, .sym cls]
      some
        { name? := some (sanitizeIdent (aliasSym sym) ++ (if asSubclass then "_rangeSubclass" else "_range"))
          src := if asSubclass then s!"(rangeSubclass {sym} {cls}) (compiled)" else s!"(range {sym} {cls}) (compiled)"
          expr := .forall_ [row] concl }
  | _ => none

structure CliConfig : Type where
  input : System.FilePath := "../tinySUMO.kif"
  root : System.FilePath := ".."
  all : Bool := false
  includeTests : Bool := false
  includeTiny : Bool := false
  -- Output root directory for generated modules (typically the project root `.`).
  outputDir : System.FilePath := "."
  name : String := "TinyAuto"
  maxAxioms : Option Nat := none

def parseArgs (args : List String) : Except String CliConfig :=
  go args {}
where
  go : List String → CliConfig → Except String CliConfig
    | [], cfg => .ok cfg
    | "--all" :: rest, cfg => go rest { cfg with all := true }
    | "--include-tests" :: rest, cfg => go rest { cfg with includeTests := true }
    | "--include-tiny" :: rest, cfg => go rest { cfg with includeTiny := true }
    | "--root" :: dir :: rest, cfg => go rest { cfg with root := System.FilePath.mk dir }
    | "--root" :: [], _ => .error "missing argument for --root"
    | "--input" :: p :: rest, cfg => go rest { cfg with input := System.FilePath.mk p }
    | "--input" :: [], _ => .error "missing argument for --input"
    | "--output" :: p :: rest, cfg => go rest { cfg with outputDir := System.FilePath.mk p }
    | "--output" :: [], _ => .error "missing argument for --output"
    | "--name" :: n :: rest, cfg => go rest { cfg with name := n }
    | "--name" :: [], _ => .error "missing argument for --name"
    | "--max-axioms" :: n :: rest, cfg =>
        match n.toNat? with
        | some k => go rest { cfg with maxAxioms := some k }
        | none => .error s!"bad Nat for --max-axioms: {n}"
    | "--max-axioms" :: [], _ => .error "missing argument for --max-axioms"
    | other :: _, _ => .error s!"unknown arg: {other}"

def modulePath (modName : String) : System.FilePath :=
  let parts := modName.splitOn "."
  -- NOTE: Start from `.` to ensure we produce a relative path (not `/...`).
  parts.foldl (fun acc p => acc / System.FilePath.mk p) (System.FilePath.mk ".")

def writeModule (outputDir : System.FilePath) (modName : String) (src : String) : IO Unit := do
  let rel := modulePath modName
  let out := outputDir / (System.FilePath.mk (rel.toString ++ ".lean"))
  if let some parent := out.parent then
    IO.FS.createDirAll parent
  IO.FS.writeFile out src

def main (args : List String) : IO UInt32 := do
  let cfg ←
    match parseArgs args with
    | .ok cfg => pure cfg
    | .error err =>
        IO.eprintln s!"arg error: {err}"
        IO.eprintln "usage: lake exe sumo_kif_hol_emit [--input FILE] [--all --root DIR] [--include-tests] [--include-tiny] [--output DIR] [--name NAME] [--max-axioms N]"
        return 2

  let files : List System.FilePath ←
    if cfg.all then
      let ps ← collectKifFiles cfg.root cfg.includeTests cfg.includeTiny
      pure ps.toList
    else
      pure [cfg.input]

  let mut allForms : List SumoKif.Sexp := []
  let mut metaDecls : MetaDecls := {}
  let mut assertions : List SumoKif.Sexp := []

  for file in files do
    let input ← IO.FS.readFile file
    match SumoKif.Parse.parseAll input with
    | .error err =>
        IO.eprintln s!"parse error in {file}: {err}"
        return 2
    | .ok xs =>
        allForms := allForms ++ xs
        let (m, a) := foldDecls xs
        metaDecls := metaDecls.merge m
        assertions := assertions ++ a

  let sig := Signature.fromKb allForms

  let clsArgs : ClsArgMap :=
    (metaDecls.domainSubclasses ++
        -- Many SUMO functions take classes/sets as arguments using `(domain ... SetOrClass)`; in HOL this
        -- is best represented as a `Class` argument.
        metaDecls.domains.filter (fun (_sym, _idx, cls) => cls = "Class" || cls = "SetOrClass")
      ).foldl
      (fun acc (sym, idx, _cls) =>
        let inner := acc.getD sym {}
        acc.insert sym (inner.insert idx))
      {}

  let predArgs : ClsArgMap :=
    metaDecls.domains.foldl
      (fun acc (sym, idx, cls) =>
        if cls = "Predicate" || cls.endsWith "Predicate" || cls = "Relation" || cls.endsWith "Relation" then
          let inner := acc.getD sym {}
          acc.insert sym (inner.insert idx)
        else
          acc)
      {}

  let fnSyms : Std.HashSet String :=
    let base : Std.HashSet String :=
      metaDecls.ranges.foldl
        (fun acc (p : String × String) => acc.insert p.1)
        ({} : Std.HashSet String)
    metaDecls.rangeSubclasses.foldl
      (fun acc (p : String × String) => acc.insert p.1)
      base
  let fnSyms : Std.HashSet String :=
    -- Also treat explicit `instance` declarations for function-arity classes as function symbols.
    allForms.foldl
      (fun acc s =>
        match s with
        | .list ((.atom (.sym "instance")) :: (.atom (.sym sym)) :: (.atom (.sym cls)) :: _) =>
            if cls.endsWith "Function" then acc.insert sym else acc
        | _ => acc)
      fnSyms

  let clsFnSyms : Std.HashSet String :=
    metaDecls.rangeSubclasses.foldl
      (fun acc (p : String × String) => acc.insert p.1)
      ({} : Std.HashSet String)

  let hsig : HolSig :=
    { sig := sig, clsArgs := clsArgs, predArgs := predArgs, fnSyms := fnSyms, clsFnSyms := clsFnSyms }

  let mut axioms : List SumoKif.HolEmit.AxiomDecl := []

  -- Compile (domain ...) declarations into domain axioms for predicates.
  for (sym, idx, cls) in metaDecls.domains do
    -- Domains into meta-ontology sorts (Relation/Function/Class/...) are not part of the
    -- HOL shallow semantics; treat them as compiled-away typing hints.
    if isMetaClassName cls then
      continue
    -- Some domain declarations incorrectly use relation/function symbols as domain "classes"
    -- (e.g. `agent`, `destination`). Skip these: keeping them would force ill-typed
    -- Lean declarations (a name cannot be both `Class` and a predicate).
    if isNonClassSymbol sig cls then
      continue
    if fnSyms.contains sym then
      continue
    if isMetaOntologyPredicateHead sym || sym = "subrelation" then
      continue
    if sym = "instance" || sym = "subclass" || sym = "disjoint" || sym = "equal" then
      continue
    if let some ax := mkDomainAxiom? sig sym idx cls false then
      axioms := axioms ++ [ax]

  -- Compile (domainSubclass ...) declarations into subclass-domain axioms.
  for (sym, idx, cls) in metaDecls.domainSubclasses do
    if isNonClassSymbol sig cls then
      continue
    if fnSyms.contains sym then
      continue
    if isMetaOntologyPredicateHead sym || sym = "subrelation" then
      continue
    if sym = "instance" || sym = "subclass" || sym = "disjoint" || sym = "equal" then
      continue
    if let some ax := mkDomainAxiom? sig sym idx cls true then
      axioms := axioms ++ [ax]

  -- Compile (range ...) declarations into range axioms for functions.
  for (sym, cls) in metaDecls.ranges do
    if isMetaOntologyPredicateHead sym || sym = "subrelation" then
      continue
    if let some ax := mkRangeAxiom? sig sym cls false then
      axioms := axioms ++ [ax]

  -- Compile (rangeSubclass ...) declarations into subclass-range axioms for class-valued functions.
  for (sym, cls) in metaDecls.rangeSubclasses do
    if isMetaOntologyPredicateHead sym || sym = "subrelation" then
      continue
    if let some ax := mkRangeAxiom? sig sym cls true then
      axioms := axioms ++ [ax]

  let mut assertionCount : Nat := 0
  for a in assertions do
    if containsMetaOntologyPredicate a then
      continue
    -- Compile `(instance R TransitiveRelation)`-style metadata into HOL axioms.
    match a with
    | .list ((.atom (.sym "instance")) :: _ :: _ :: _) =>
        -- Keep ordinary `(instance … …)` assertions as axioms; only skip meta-level
        -- symbol-class typing declarations (Class/Relation/Function/…).
        if isMetaInstanceDecl a then
          continue
    | _ =>
        if isMetaInstanceDecl a then
          continue
    let srcStr := a.render.take 180
    let subrelNames? : Option (String × String) :=
      match a with
      | .list ((.atom (.sym "subrelation")) :: (.atom (.sym r1)) :: (.atom (.sym r2)) :: _) => some (r1, r2)
      | _ => none
    let expr :=
      match rewriteSubrelation? sig fnSyms a with
      | some e => e
      | none => closeForall a
    let name? :=
      match subrelNames? with
      | some (r1, r2) => some (sanitizeIdent (aliasSym r1) ++ "_subrelation_" ++ sanitizeIdent (aliasSym r2))
      | none => none
    axioms := axioms ++ [{ name? := name?, src := srcStr, expr := expr }]
    if let some max := cfg.maxAxioms then
      assertionCount := assertionCount + 1
      if assertionCount ≥ max then
        break

  axioms := dedupNamedAxioms axioms

  let base := "LeanSUMO.Generated." ++ cfg.name
  let preludeMod := base ++ ".Prelude"
  let axiomsPreludeMod := base ++ ".AxiomsPrelude"
  let axiomsNs := base ++ ".Axioms"
  let axiomsMod := axiomsNs
  let typedMod := base ++ ".Typed"
  let cfgOut : EmitConfig :=
    { moduleName := base
      preludeModule := preludeMod
      axiomsModule := axiomsMod
      axiomsNamespace := axiomsNs }

  let allExprs := axioms.map (fun a => a.expr)
  let syms :=
    allExprs.foldl (fun acc e => collectSyms hsig acc .formula e) ({})

  -- Prelude can be very large (tens of thousands of lines of symbol declarations), and Lean may
  -- stack overflow while elaborating a single giant file. Emit it in chunks.
  let preludeBaseMod := base ++ ".PreludeBase"
  writeModule cfg.outputDir preludeBaseMod (emitPreludeBase cfgOut preludeBaseMod)

  let preludeDecls := collectPreludeDeclLines hsig syms
  let preludeChunkSize : Nat := 5000
  let preludeParts := chunkList preludeChunkSize preludeDecls.lines
  let mut preludePartMods : List String := []
  let mut preludePartNum : Nat := 1
  for partLines in preludeParts do
    let partMod := base ++ s!".PreludePart{preludePartNum}"
    writeModule cfg.outputDir partMod (emitPreludePart cfgOut preludeBaseMod partLines)
    preludePartMods := preludePartMods ++ [partMod]
    preludePartNum := preludePartNum + 1

  -- Wrapper module that imports PreludeBase + all PreludePartN modules under the usual name.
  let preludeWrapperSrc :=
    String.intercalate "\n"
      ([s!"import {preludeBaseMod}"] ++
        (preludePartMods.map (fun m => s!"import {m}")) ++
        [ ""
        , "/-! Auto-generated KIF→HOL LeanSUMO prelude (chunked). -/"
        ])
  writeModule cfg.outputDir preludeMod preludeWrapperSrc

  let axiomsPrelude := emitAxiomsPrelude cfgOut
  writeModule cfg.outputDir axiomsPreludeMod axiomsPrelude

  -- Emit axioms in chunks to avoid Lean stack overflows on very large files.
  let chunkSize : Nat := 2000
  let parts := chunkList chunkSize axioms
  let mut partMods : List String := []
  let mut startIdx : Nat := 1
  let mut partNum : Nat := 1
  for part in parts do
    let partMod := base ++ s!".AxiomsPart{partNum}"
    let cfgPart : EmitConfig :=
      { moduleName := base
        preludeModule := preludeMod
        axiomsModule := partMod
        axiomsNamespace := axiomsNs }
    let src := emitAxioms cfgPart hsig syms part startIdx
    writeModule cfg.outputDir partMod src
    partMods := partMods ++ [partMod]
    startIdx := startIdx + part.length
    partNum := partNum + 1

  -- Wrapper module that imports all parts under a single logical namespace.
  let wrapperSrc :=
    String.intercalate "\n"
      ([s!"import {axiomsPreludeMod}"] ++ (partMods.map (fun m => s!"import {m}")) ++
        [ ""
        , "/-! Auto-generated KIF→HOL LeanSUMO axioms (chunked). -/"
        ])
  writeModule cfg.outputDir axiomsMod wrapperSrc

  -- Typed view module (best-effort), generated from metadata.
  let typedSrc := emitTypedView cfgOut hsig syms metaDecls
  writeModule cfg.outputDir typedMod typedSrc

  -- Root convenience module
  let rootSrc :=
    String.intercalate "\n"
      [ s!"import {preludeMod}"
      , s!"import {axiomsMod}"
      , s!"import {typedMod}"
      , ""
      , "/-! Auto-generated KIF→HOL LeanSUMO module. -/"
      ]
  writeModule cfg.outputDir base rootSrc

  IO.println s!"Wrote: {preludeMod}"
  IO.println s!"Wrote: {preludeBaseMod}"
  for m in preludePartMods do
    IO.println s!"Wrote: {m}"
  IO.println s!"Wrote: {axiomsPreludeMod}"
  IO.println s!"Wrote: {axiomsMod} (wrapper)"
  IO.println s!"Wrote: {typedMod}"
  for m in partMods do
    IO.println s!"Wrote: {m}"
  IO.println s!"Wrote: {base}"
  return 0
