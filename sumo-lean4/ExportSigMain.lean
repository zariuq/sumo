import Std
import Lean
import SumoKif.ParseSexp
import SumoKif.Signature
import SumoKif.Symbols
import SumoKif.ExportLean

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
  out : Option System.FilePath := none
  files : List String := []

def parseArgs (args : List String) : Except String CliConfig :=
  go args {}
where
  go : List String → CliConfig → Except String CliConfig
    | [], cfg => .ok cfg
    | "--all" :: rest, cfg => go rest { cfg with all := true }
    | "--root" :: dir :: rest, cfg => go rest { cfg with root := System.FilePath.mk dir }
    | "--root" :: [], _ => .error "missing argument for --root"
    | "--out" :: f :: rest, cfg => go rest { cfg with out := some (System.FilePath.mk f) }
    | "--out" :: [], _ => .error "missing argument for --out"
    | f :: rest, cfg => go rest { cfg with files := cfg.files ++ [f] }

structure BuildStep : Type where
  builder : SigBuilder
  syms : Std.HashSet String
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
  let mut syms : Std.HashSet String := {}
  let mut totalForms : Nat := 0
  for file in files do
    let input ← IO.FS.readFile file
    let step : BuildStep := { builder := builder, syms := syms, forms := 0 }
    let step ←
      match SumoKif.Parse.parseFold input step (fun st s =>
        { builder := SigBuilder.ingest st.builder s
          syms := collectConstSymbols s st.syms
          forms := st.forms + 1 }) with
      | .ok st => pure st
      | .error err =>
          IO.eprintln s!"parse error in {file}: {err}"
          return 2
    builder := step.builder
    syms := step.syms
    totalForms := totalForms + step.forms

  let sig := builder.finalize
  let outText := renderSignatureLean syms.toArray sig

  match cfg.out with
  | none =>
      IO.println outText
      return 0
  | some path =>
      IO.FS.writeFile path outText
      IO.eprintln s!"wrote: {path}"
      IO.eprintln s!"files: {files.length}, parsed {totalForms} top-level forms"
      IO.eprintln s!"constants: {syms.size}, arities: {sig.symArity.size}"
      return 0

