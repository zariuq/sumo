import Std
import Lean
import SumoKif.ParseSexp
import SumoKif.TypedEmit

set_option autoImplicit false

open SumoKif
open SumoKif.TypedEmit

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
  input : System.FilePath := "../tinySUMO.kif"
  root : System.FilePath := ".."
  all : Bool := false
  chunked : Bool := false  -- For large files, emit multiple chunks
  outputFile : System.FilePath := "LeanSUMO/Generated/PurelyTyped.lean"
  outputDir : System.FilePath := "LeanSUMO/Generated/FullSUMO"  -- For chunked mode

def parseArgs (args : List String) : Except String CliConfig :=
  go args {}
where
  go : List String → CliConfig → Except String CliConfig
    | [], cfg => .ok cfg
    | "--all" :: rest, cfg => go rest { cfg with all := true }
    | "--chunked" :: rest, cfg => go rest { cfg with chunked := true }
    | "--root" :: dir :: rest, cfg => go rest { cfg with root := System.FilePath.mk dir }
    | "--root" :: [], _ => .error "missing argument for --root"
    | "--input" :: p :: rest, cfg => go rest { cfg with input := System.FilePath.mk p }
    | "--input" :: [], _ => .error "missing argument for --input"
    | "--output" :: p :: rest, cfg => go rest { cfg with outputFile := System.FilePath.mk p }
    | "--output" :: [], _ => .error "missing argument for --output"
    | "--output-dir" :: p :: rest, cfg => go rest { cfg with outputDir := System.FilePath.mk p }
    | "--output-dir" :: [], _ => .error "missing argument for --output-dir"
    | other :: _, _ => .error s!"unknown arg: {other}"

def main (args : List String) : IO UInt32 := do
  let cfg ←
    match parseArgs args with
    | .ok cfg => pure cfg
    | .error err =>
        IO.eprintln s!"arg error: {err}"
        IO.eprintln "usage: lake exe typed_emit [--input FILE] [--all --root DIR] [--output FILE] [--chunked --output-dir DIR]"
        return 2

  let files : List System.FilePath ←
    if cfg.all then
      let ps ← collectKifFiles cfg.root
      pure ps.toList
    else
      pure [cfg.input]

  let mut allForms : List SumoKif.Sexp := []

  for file in files do
    let input ← IO.FS.readFile file
    match SumoKif.Parse.parseAll input with
    | .error err =>
        IO.eprintln s!"parse error in {file}: {err}"
        return 2
    | .ok xs =>
        allForms := allForms ++ xs

  IO.println s!"Parsed {allForms.length} S-expressions from {files.length} file(s)"

  if cfg.chunked then
    -- Chunked mode: emit multiple files
    let chunks := emitTypedSumoChunked allForms
    IO.FS.createDirAll cfg.outputDir

    for chunk in chunks do
      let filePath := cfg.outputDir / (chunk.filename ++ ".lean")
      IO.FS.writeFile filePath chunk.content
      IO.println s!"Wrote: {filePath}"

    IO.println s!"Generated {chunks.length} files in {cfg.outputDir}"
  else
    -- Single file mode
    let output := emitTypedSumo allForms

    -- Create parent directories if needed
    if let some parent := cfg.outputFile.parent then
      IO.FS.createDirAll parent
    IO.FS.writeFile cfg.outputFile output

    IO.println s!"Wrote: {cfg.outputFile}"

  return 0
