import Std
import Lean
import SumoKif.ParseSexp
import SumoKif.ExportAxioms
import SumoKif.ToAst
import Sumo.AstChecks

set_option autoImplicit false

open Lean
open SumoKif

partial def collectKifFiles (root : System.FilePath) : IO (Array System.FilePath) := do
  let paths ←
    System.FilePath.walkDir root (enter := fun p => do
      let name := p.fileName
      if name = ".git" || name = ".lake" || name = "sumo-lean4" then
        return false
      else
        return true)
  let files := paths.filter (fun p => p.toString.endsWith ".kif")
  return files.qsort (fun a b => a.toString < b.toString)

structure CliConfig : Type where
  root : System.FilePath := ".."
  all : Bool := false
  files : List String := []

def parseArgs (args : List String) : Except String CliConfig :=
  go args {}
where
  go : List String → CliConfig → Except String CliConfig
    | [], cfg => .ok cfg
    | "--all" :: rest, cfg => go rest { cfg with all := true }
    | "--root" :: dir :: rest, cfg => go rest { cfg with root := System.FilePath.mk dir }
    | "--root" :: [], _ => .error "missing argument for --root"
    | f :: rest, cfg => go rest { cfg with files := cfg.files ++ [f] }

def main (args : List String) : IO UInt32 := do
  let cfg ←
    match parseArgs args with
    | .ok cfg => pure cfg
    | .error err =>
        IO.eprintln s!"arg error: {err}"
        return 2

  let files ←
    if cfg.all then
      let ps ← collectKifFiles cfg.root
      pure (ps.toList.map (fun p => p.toString))
    else if !cfg.files.isEmpty then
      pure cfg.files
    else
      pure ["../Merge.kif"]

  let mut axioms : List Sumo.Ast.Expr := []
  let mut totalForms : Nat := 0
  for file in files do
    let input ← IO.FS.readFile file
    match SumoKif.Parse.parseAll input with
    | .error err =>
        IO.eprintln s!"parse error in {file}: {err}"
        return 2
    | .ok xs =>
        totalForms := totalForms + xs.length
        let (_, assertions) := foldDecls xs
        axioms := axioms ++ assertions.map closeForall

  let report := Sumo.AstChecks.findGroundAtomicContradictions axioms
  IO.println s!"files: {files.length}, parsed top-level forms: {totalForms}"
  IO.println s!"axioms (non-metadata): {axioms.length}"
  IO.println s!"ground atomic positives: {report.positives}"
  IO.println s!"ground atomic negatives: {report.negatives}"
  IO.println s!"ground atomic contradictions: {report.contradictions.length}"
  for k in report.contradictions do
    IO.println s!"- {k}"

  if report.contradictions.isEmpty then
    return 0
  else
    return 1

