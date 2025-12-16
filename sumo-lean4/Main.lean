import Std
import Lean
import SumoKif.ParseSexp
import SumoKif.Signature
import SumoKif.Check

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

structure BuildStep : Type where
  builder : SigBuilder
  forms : Nat := 0

structure CheckStep : Type where
  bag : IssueBag
  forms : Nat := 0

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

  let mut builder : SigBuilder := {}
  let mut totalForms : Nat := 0
  for file in files do
    let input ← IO.FS.readFile file
    let step : BuildStep := { builder := builder, forms := 0 }
    let step ←
      match SumoKif.Parse.parseFold input step (fun st s => { builder := SigBuilder.ingest st.builder s, forms := st.forms + 1 }) with
      | .ok st => pure st
      | .error err =>
          IO.eprintln s!"parse error in {file}: {err}"
          return 2
    builder := step.builder
    totalForms := totalForms + step.forms

  let sig := builder.finalize

  let mut bag : IssueBag := {}
  bag := bag.addMany (arityConflictIssues sig)

  for file in files do
    let input ← IO.FS.readFile file
    let step : CheckStep := { bag := bag, forms := 0 }
    let step ←
      match SumoKif.Parse.parseFold input step (fun st s =>
        let issues := (checkForm sig s).map (Issue.withFile file)
        { bag := st.bag.addMany issues, forms := st.forms + 1 }) with
      | .ok st => pure st
      | .error err =>
          let i : Issue := { file := some file, msg := s!"parse error: {err}" }
          bag := bag.add i
          continue
    bag := step.bag

  IO.println s!"files: {files.length}"
  IO.println s!"parsed {totalForms} top-level forms"
  IO.println s!"known symbol arities: {sig.symArity.size}"
  IO.println s!"arities inferred from domains: {sig.arityInferredFromDomains.size}"
  IO.println s!"arity conflicts: {sig.arityConflicts.size}"
  IO.println s!"domain declarations: {sig.domains.size}"
  if bag.count = 0 then
    IO.println "no issues found"
    return 0
  else
    IO.eprintln s!"issues: {bag.count}"
    for i in bag.issues do
      IO.eprintln (Issue.render i)
    if bag.count > bag.limit then
      IO.eprintln s!"(showing first {bag.limit} of {bag.count})"
    return 1
