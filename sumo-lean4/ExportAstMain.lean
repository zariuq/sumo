import Std
import Lean
import SumoKif.ParseSexp
import SumoKif.ExportAst

set_option autoImplicit false

open Lean
open SumoKif

structure CliConfig : Type where
  moduleName : String := "MergeAst"
  out : Option System.FilePath := none
  files : List String := []

def parseArgs (args : List String) : Except String CliConfig :=
  go args {}
where
  go : List String → CliConfig → Except String CliConfig
    | [], cfg => .ok cfg
    | "--module" :: m :: rest, cfg => go rest { cfg with moduleName := m }
    | "--module" :: [], _ => .error "missing argument for --module"
    | "--out" :: f :: rest, cfg => go rest { cfg with out := some (System.FilePath.mk f) }
    | "--out" :: [], _ => .error "missing argument for --out"
    | f :: rest, cfg => go rest { cfg with files := cfg.files ++ [f] }

def main (args : List String) : IO UInt32 := do
  let cfg ←
    match parseArgs args with
    | .ok cfg => pure cfg
    | .error err =>
        IO.eprintln s!"arg error: {err}"
        return 2

  let files :=
    if cfg.files.isEmpty then
      ["../Merge.kif"]
    else
      cfg.files

  let mut forms : List Sexp := []
  for file in files do
    let input ← IO.FS.readFile file
    match SumoKif.Parse.parseAll input with
    | .error err =>
        IO.eprintln s!"parse error in {file}: {err}"
        return 2
    | .ok xs =>
        forms := forms ++ xs

  let outText := renderAstTheoryFile cfg.moduleName forms

  match cfg.out with
  | none =>
      IO.println outText
      return 0
  | some path =>
      IO.FS.writeFile path outText
      IO.eprintln s!"wrote: {path}"
      IO.eprintln s!"module: {cfg.moduleName}"
      IO.eprintln s!"files: {files.length}, forms: {forms.length}"
      return 0

