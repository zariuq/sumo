import Std
import Sumo.Ast
import SumoKif.ParseSexp
import SumoKif.ExportAxioms
import SumoKif.Signature
import SumoKif.ToAst

set_option autoImplicit false

namespace SumoKif.TypedEmit

open Sumo
open Sumo.Ast
open SumoKif

/-!
# Purely Typed LeanSUMO Emitter

This emitter produces a purely typed representation of SUMO:
- NO `Obj` type anywhere
- Classes are Lean types with subtype relationships
- Predicates defined at the correct type level (no `.val` chains)
- Relations use domain types directly
- Individuals are typed constants
- Axioms have typed quantifiers

## Architecture

```
Entity : Type                              -- Base type
  ├── Physical := { x : Entity // isPhysical x }
  │   ├── Object := { x : Physical // isObject x }
  │   │   └── Organism := { x : Object // isOrganism x }  -- Note: isOrganism takes Object!
  │   └── Process := { x : Physical // isProcess x }
  └── Abstract := { x : Entity // isAbstract x }
      └── Attribute := { x : Abstract // isAttribute x }
```
-/

/-! ## Identifiers -/

def aliasSym (s : String) : String :=
  match s with
  | "attribute" => "hasAttribute"
  | "instance" => "instanceOf"
  | other => other

def sanitizeIdent (s : String) : String :=
  let s :=
    if s.startsWith "?" then "v_" ++ s.drop 1
    else if s.startsWith "@" then "row_" ++ s.drop 1
    else s
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
          "structure", "abbrev", "set_option", "True", "False", "Type", "Prop",
          "Entity", "Physical", "Abstract", "Object", "Process"]
  then s ++ "_"
  else s

/-! ## Type Hierarchy Builder -/

/-- Information about a class in the hierarchy -/
structure ClassInfo where
  name : String
  parent : Option String  -- None for Entity (root)
  depth : Nat             -- Distance from Entity
  deriving Repr, BEq

/-- Build the class hierarchy from subclass relationships -/
structure HierarchyBuilder where
  /-- Map from class name to its direct parent (most specific) -/
  directParent : Std.HashMap String String := {}
  /-- Map from class name to all its superclasses -/
  allSupers : Std.HashMap String (List String) := {}
  /-- Set of all known classes -/
  knownClasses : Std.HashSet String := {}

def HierarchyBuilder.empty : HierarchyBuilder := {}

/-- Add a subclass relationship -/
def HierarchyBuilder.addSubclass (h : HierarchyBuilder) (sub sup : String) : HierarchyBuilder :=
  let h := { h with knownClasses := h.knownClasses.insert sub |>.insert sup }
  let supers := h.allSupers.getD sub []
  let h := { h with allSupers := h.allSupers.insert sub (sup :: supers) }
  -- Update direct parent: prefer more specific (if current parent is already a superclass of sup)
  match h.directParent.get? sub with
  | none => { h with directParent := h.directParent.insert sub sup }
  | some existing =>
      -- Keep the more specific parent (one that's closer in the hierarchy)
      -- For now, just keep the existing one
      h

/-- Compute depth from Entity for a class -/
partial def HierarchyBuilder.computeDepth (h : HierarchyBuilder) (cls : String) : Nat :=
  if cls == "Entity" then 0
  else match h.directParent.get? cls with
       | none => 0  -- Unknown class, treat as root-level
       | some parent => 1 + h.computeDepth parent

/-- Get the direct parent of a class -/
def HierarchyBuilder.getParent (h : HierarchyBuilder) (cls : String) : Option String :=
  if cls == "Entity" then none
  else h.directParent.get? cls

/-- Build ClassInfo for all known classes -/
def HierarchyBuilder.buildClassInfos (h : HierarchyBuilder) : List ClassInfo :=
  let classes := h.knownClasses.toList
  classes.map fun cls =>
    { name := cls
      parent := h.getParent cls
      depth := h.computeDepth cls }

/-- Sort classes by depth (Entity first, leaves last) -/
def sortByDepth (infos : List ClassInfo) : List ClassInfo :=
  infos.toArray.qsort (fun a b => a.depth < b.depth || (a.depth == b.depth && a.name < b.name))
    |>.toList

/-! ## Emission Context -/

structure EmitCtx where
  hierarchy : HierarchyBuilder
  /-- Signature with arities and domains -/
  sig : Signature
  /-- Classes that appear in domain declarations (these need to be typed) -/
  domainClasses : Std.HashSet String := {}
  /-- Relations with their domain types -/
  relDomains : Std.HashMap String (List (Nat × String)) := {}
  /-- Instance declarations: individual → class -/
  instances : Std.HashMap String (List String) := {}
  /-- rangeSubclass: function → class (for compound parent expressions) -/
  rangeSubclasses : Std.HashMap String String := {}

def EmitCtx.empty : EmitCtx :=
  { hierarchy := .empty, sig := .empty }

/-! ## Pass 1: Collect Metadata -/

/-- Extract the function name from a compound expression like (FoodForFn Animal) -/
def extractFunctionName : Sexp → Option String
  | .list (.atom (.sym fn) :: _) => some fn
  | _ => none

/-- Process S-expressions to build the context -/
def collectMetadata (sexps : List Sexp) : EmitCtx := Id.run do
  let mut ctx : EmitCtx := .empty
  let mut hierarchy : HierarchyBuilder := .empty
  let mut rangeSubclasses : Std.HashMap String String := {}

  -- First pass: collect rangeSubclass declarations
  for sexp in sexps do
    match sexp with
    | .list [.atom (.sym "rangeSubclass"), .atom (.sym fn), .atom (.sym cls)] =>
        rangeSubclasses := rangeSubclasses.insert fn cls
    | _ => pure ()

  -- Second pass: collect all other metadata
  for sexp in sexps do
    match sexp with
    | .list [.atom (.sym "subclass"), .atom (.sym sub), .atom (.sym sup)] =>
        -- Simple parent: (subclass Apple Fruit)
        hierarchy := hierarchy.addSubclass sub sup
    | .list [.atom (.sym "subclass"), .atom (.sym sub), parent] =>
        -- Compound parent: (subclass Apple (FoodForFn Animal))
        -- Use rangeSubclass of the function if available, otherwise skip
        if let some fnName := extractFunctionName parent then
          if let some rangeClass := rangeSubclasses.get? fnName then
            hierarchy := hierarchy.addSubclass sub rangeClass
          -- else: skip - we don't know the parent type
    | .list [.atom (.sym "domain"), .atom (.sym rel), .atom (.sym idxStr), .atom (.sym cls)] =>
        if let some idx := idxStr.toNat? then
          -- Record that this class appears in a domain declaration
          ctx := { ctx with domainClasses := ctx.domainClasses.insert cls }
          -- Record the domain for this relation
          let existing := ctx.relDomains.getD rel []
          ctx := { ctx with relDomains := ctx.relDomains.insert rel ((idx, cls) :: existing) }
    | .list [.atom (.sym "instance"), .atom (.sym ind), .atom (.sym cls)] =>
        -- Don't record meta-level instances like (instance mother BinaryPredicate)
        if !isMetaClass cls then
          let existing := ctx.instances.getD ind []
          ctx := { ctx with instances := ctx.instances.insert ind (cls :: existing) }
    | _ => pure ()

  -- Build signature for arities
  let sigBuilder := SigBuilder.empty.ingestAll sexps
  let sig := sigBuilder.finalize

  return { ctx with hierarchy := hierarchy, sig := sig, rangeSubclasses := rangeSubclasses }
where
  isMetaClass (cls : String) : Bool :=
    cls.endsWith "Predicate" || cls.endsWith "Relation" || cls.endsWith "Function" ||
    cls == "Class" || cls == "Relation" || cls == "Predicate" || cls == "Function"

/-! ## Code Generation -/

/-- Generate the Entity base type -/
def emitEntityType : String :=
  "axiom Entity : Type"

/-- Sanitize a class name for Lean, but don't add underscore to Entity -/
def sanitizeClassName (s : String) : String :=
  if s == "Entity" then "Entity"
  else sanitizeIdent (aliasSym s)

/-- Generate a class type as a subtype of its parent -/
def emitClassType (info : ClassInfo) : String :=
  let name := sanitizeClassName info.name
  let predName := s!"is{name}"
  match info.parent with
  | none =>
      -- This is Entity or a root class
      if info.name == "Entity" then ""
      else
        -- Root-level class (subtype of Entity)
        s!"axiom {predName} : Entity → Prop\n" ++
        s!"def {name} := \{ x : Entity // {predName} x }"
  | some parent =>
      let parentName := sanitizeClassName parent
      s!"axiom {predName} : {parentName} → Prop\n" ++
      s!"def {name} := \{ x : {parentName} // {predName} x }"

/-- Generate coercion from subtype to parent -/
def emitCoercion (info : ClassInfo) : String :=
  let name := sanitizeClassName info.name
  match info.parent with
  | none => ""
  | some parent =>
      let parentName := sanitizeClassName parent
      s!"instance : Coe {name} {parentName} where coe x := x.val"

/-- Generate a typed relation from domain declarations -/
def emitRelation (ctx : EmitCtx) (rel : String) : String :=
  let name := sanitizeIdent (aliasSym rel)
  let domains := ctx.relDomains.getD rel []
  -- Sort by argument index
  let sortedDomains := domains.toArray.qsort (fun a b => a.1 < b.1) |>.toList

  -- Helper: check if a class is known in the hierarchy
  let isKnownClass := fun (cls : String) =>
    cls == "Entity" || ctx.hierarchy.knownClasses.contains cls

  if sortedDomains.isEmpty then
    -- No domain info, skip or emit as Entity → Entity → ... → Prop
    match ctx.sig.symArity.get? rel with
    | some (.fixed n) =>
        let args := (List.range n).map (fun _ => "Entity")
        s!"axiom {name} : {String.intercalate " → " args} → Prop"
    | _ => ""
  else
    let maxIdx := sortedDomains.foldl (fun acc (idx, _) => max acc idx) 0
    let argTypes := (List.range maxIdx).map fun i =>
      match sortedDomains.find? (fun (idx, _) => idx == i + 1) with
      | some (_, cls) =>
          -- Fall back to Entity if the class is not defined in our hierarchy
          if isKnownClass cls then sanitizeClassName cls else "Entity"
      | none => "Entity"  -- Default to Entity if domain not specified
    s!"axiom {name} : {String.intercalate " → " argTypes} → Prop"

/-- Generate a typed individual constant -/
def emitIndividual (ctx : EmitCtx) (ind : String) : String :=
  let name := sanitizeIdent ind
  let classes := ctx.instances.getD ind []
  -- Filter to only known classes
  let knownClasses := classes.filter fun cls =>
    ctx.hierarchy.knownClasses.contains cls
  -- Find the most specific class (one with greatest depth)
  let classInfos := knownClasses.filterMap fun cls =>
    let depth := ctx.hierarchy.computeDepth cls
    some (cls, depth)
  match classInfos.toArray.qsort (fun a b => a.2 > b.2) |>.toList with
  | [] => ""  -- No known class, skip this individual
  | (cls, _) :: _ =>
      let typeName := sanitizeClassName cls
      s!"axiom {name} : {typeName}"

/-! ## Main Emission -/

def emitTypedSumo (sexps : List Sexp) : String := Id.run do
  let ctx := collectMetadata sexps

  let mut output : List String := []

  -- Header
  output := output ++ [
    "/-!",
    "# LeanSUMO - Purely Typed SUMO Ontology",
    "",
    "Generated by TypedEmit.lean",
    "No `Obj` type - everything is typed from the start.",
    "-/",
    "",
    "set_option autoImplicit false",
    "",
    "namespace LeanSUMO",
    "",
    "/-! ## Base Type -/",
    "",
    emitEntityType,
    ""
  ]

  -- Build and sort class infos
  let classInfos := ctx.hierarchy.buildClassInfos
  let sortedClasses := sortByDepth classInfos

  -- SUMO uses classes like BinaryRelation, IntentionalRelation etc. as actual types
  -- So we don't filter anything - all classes from the hierarchy are included
  let allClasses := sortedClasses

  output := output ++ ["/-! ## Class Types -/", ""]

  for info in allClasses do
    let typeDecl := emitClassType info
    if !typeDecl.isEmpty then
      output := output ++ [typeDecl, ""]

  output := output ++ ["/-! ## Coercions -/", ""]

  for info in allClasses do
    let coe := emitCoercion info
    if !coe.isEmpty then
      output := output ++ [coe]

  output := output ++ ["", "/-! ## Relations -/", ""]

  -- Emit important relations (skip subclass/instanceOf as they use Class)
  -- Note: SUMO uses "attribute" which we alias to "hasAttribute"
  let importantRels := ["mother", "father", "parent", "agent", "patient",
                        "part", "attribute"]
  for rel in importantRels do
    if ctx.relDomains.contains rel then
      output := output ++ [emitRelation ctx rel]

  output := output ++ ["", "/-! ## Individuals -/", ""]

  -- Emit important individuals
  let importantInds := ["Male", "Female"]
  for ind in importantInds do
    if ctx.instances.contains ind then
      let decl := emitIndividual ctx ind
      if !decl.isEmpty then
        output := output ++ [decl]

  -- Emit key axioms for reasoning
  output := output ++ ["", "/-! ## Axioms -/", ""]

  -- Check if we have the relations/types needed for family axioms
  -- Note: SUMO uses "attribute" which we alias to "hasAttribute"
  let hasMother := ctx.relDomains.contains "mother"
  let hasFather := ctx.relDomains.contains "father"
  let hasAttr := ctx.relDomains.contains "attribute"
  let hasParent := ctx.relDomains.contains "parent"

  if hasMother && hasAttr then
    output := output ++ [
      "/-- A mother has the Female attribute -/",
      "axiom mother_implies_female : ∀ (child mom : Organism),",
      "    mother child mom → hasAttribute mom Female"
    ]

  if hasFather && hasAttr then
    output := output ++ [
      "",
      "/-- A father has the Male attribute -/",
      "axiom father_implies_male : ∀ (child dad : Organism),",
      "    father child dad → hasAttribute dad Male"
    ]

  -- Male/Female contrary attribute (they can't both be true)
  -- Use the actual domain type from SUMO (usually Object, not Entity)
  if ctx.instances.contains "Male" && ctx.instances.contains "Female" && hasAttr then
    let attrDomains := ctx.relDomains.getD "attribute" []
    let attrDomain := match attrDomains.find? (fun p => p.1 == 1) with
      | some (_, cls) => sanitizeClassName cls
      | none => "Entity"
    output := output ++ [
      "",
      "/-- Male and Female are contrary attributes -/",
      s!"axiom male_female_contrary : ∀ (x : {attrDomain}),",
      "    hasAttribute x Male → hasAttribute x Female → False"
    ]

  -- Parent relations (only emit if parent relation exists)
  if hasMother && hasParent then
    output := output ++ [
      "",
      "/-- Mother implies parent -/",
      "axiom mother_implies_parent : ∀ (child mom : Organism),",
      "    mother child mom → parent child mom"
    ]

  if hasFather && hasParent then
    output := output ++ [
      "",
      "/-- Father implies parent -/",
      "axiom father_implies_parent : ∀ (child dad : Organism),",
      "    father child dad → parent child dad"
    ]

  -- Part relation axioms
  let hasPart := ctx.relDomains.contains "part"
  if hasPart then
    output := output ++ [
      "",
      "/-- Part relation is transitive -/",
      "axiom part_transitive : ∀ (x y z : Object_),",
      "    part x y → part y z → part x z",
      "",
      "/-- Part relation is reflexive -/",
      "axiom part_reflexive : ∀ (x : Object_), part x x"
    ]

  -- Agent axioms
  let hasAgent := ctx.relDomains.contains "agent"
  if hasAgent then
    output := output ++ [
      "",
      "/-- Every process has at least one agent (existence, not constructive) -/",
      "axiom process_has_agent : ∀ (p : Process_), ∃ (a : AutonomousAgent), agent p a"
    ]

  -- Add CoeHead instances for all emitted classes (for cleaner ↑ display)
  output := output ++ [
    "",
    "/-! ## Coercion Display (↑ instead of .val) -/"
  ]

  for info in allClasses do
    match info.parent with
    | none => pure ()
    | some parent =>
        let childName := sanitizeClassName info.name
        let parentName := sanitizeClassName parent
        output := output ++ [
          s!"instance : CoeHead {childName} {parentName} where coe := Subtype.val"
        ]

  -- Add polymorphic relation wrappers for clean proof states
  if hasMother then
    output := output ++ [
      "",
      "/-! ## Polymorphic Relation Wrappers (for clean proof states) -/",
      "",
      "/-- Polymorphic mother - works on any Organism subtypes -/",
      "def mother' {α β} [Coe α Organism] [Coe β Organism] (c : α) (m : β) : Prop :=",
      "    mother ↑c ↑m"
    ]

  if hasFather then
    output := output ++ [
      "",
      "/-- Polymorphic father - works on any Organism subtypes -/",
      "def father' {α β} [Coe α Organism] [Coe β Organism] (c : α) (m : β) : Prop :=",
      "    father ↑c ↑m"
    ]

  if hasAgent then
    output := output ++ [
      "",
      "/-- Polymorphic agent - works on any Process/AutonomousAgent subtypes -/",
      "def agent' {α β} [Coe α Process_] [Coe β AutonomousAgent] (p : α) (a : β) : Prop :=",
      "    agent ↑p ↑a"
    ]

  if hasAttr then
    let attrDomains := ctx.relDomains.getD "attribute" []
    let attrDomain := match attrDomains.find? (fun p => p.1 == 1) with
      | some (_, cls) => sanitizeClassName cls
      | none => "Entity"
    output := output ++ [
      "",
      "/-- Polymorphic hasAttribute - works on any subtypes of the domain -/",
      s!"def hasAttribute' \{α} [Coe α {attrDomain}] (x : α) (attr : Attribute) : Prop :=",
      "    hasAttribute ↑x attr"
    ]

  output := output ++ ["", "end LeanSUMO"]

  return String.intercalate "\n" output

/-! ## Chunked Emission for Large Files -/

/-- Output for a single chunk file -/
structure ChunkOutput where
  filename : String
  content : String
  deriving Repr

/-- Split classes into groups by depth -/
def groupByDepth (classes : List ClassInfo) (levelsPerChunk : Nat := 3) : List (List ClassInfo) := Id.run do
  if classes.isEmpty then return []
  let maxDepth := classes.foldl (fun acc c => max acc c.depth) 0
  let mut groups : List (List ClassInfo) := []
  let mut currentGroup : List ClassInfo := []
  let mut currentMaxDepth : Nat := levelsPerChunk - 1

  for cls in classes do
    if cls.depth > currentMaxDepth then
      if !currentGroup.isEmpty then
        groups := groups ++ [currentGroup]
      currentGroup := [cls]
      currentMaxDepth := cls.depth + levelsPerChunk - 1
    else
      currentGroup := currentGroup ++ [cls]

  if !currentGroup.isEmpty then
    groups := groups ++ [currentGroup]

  return groups

/-- Emit chunked files for full SUMO -/
def emitTypedSumoChunked (sexps : List Sexp) (namespace_ : String := "LeanSUMO") : List ChunkOutput := Id.run do
  let ctx := collectMetadata sexps

  let mut outputs : List ChunkOutput := []

  -- Build and sort class infos
  let classInfos := ctx.hierarchy.buildClassInfos
  let sortedClasses := sortByDepth classInfos

  -- SUMO uses classes like BinaryRelation, IntentionalRelation etc. as actual types
  -- So we don't filter anything - all classes from the hierarchy are included
  let allClasses := sortedClasses

  -- Group classes by depth
  let classGroups := groupByDepth allClasses 4

  -- Chunk 1: Core.lean - Entity and imports
  let coreContent := String.intercalate "\n" [
    "/-!",
    s!"# {namespace_} - Core Types",
    "",
    "Generated by TypedEmit.lean (chunked mode)",
    "-/",
    "",
    "set_option autoImplicit false",
    "",
    s!"namespace {namespace_}",
    "",
    "/-! ## Base Type -/",
    "",
    emitEntityType,
    "",
    s!"end {namespace_}"
  ]
  outputs := outputs ++ [{ filename := "Core", content := coreContent }]

  -- Chunks 2-N: Types by depth level
  let mut chunkIdx : Nat := 0
  for group in classGroups do
    let idx := chunkIdx
    chunkIdx := chunkIdx + 1
    let chunkNum := String.mk (List.replicate (2 - (idx + 1).repr.length) '0' ++ (idx + 1).repr.toList)
    let minDepth := group.foldl (fun acc c => min acc c.depth) 100
    let maxDepth := group.foldl (fun acc c => max acc c.depth) 0

    let mut lines : List String := []
    -- Imports must come first in Lean 4
    lines := lines ++ [s!"import {namespace_}.Generated.FullSUMO.Core"]
    for i in List.range idx do
      let prevNum := String.mk (List.replicate (2 - (i + 1).repr.length) '0' ++ (i + 1).repr.toList)
      lines := lines ++ [s!"import {namespace_}.Generated.FullSUMO.Types{prevNum}"]

    lines := lines ++ [
      "",
      "/-!",
      s!"# {namespace_} - Types (depth {minDepth}-{maxDepth})",
      "",
      "Generated by TypedEmit.lean (chunked mode)",
      "-/",
      "",
      "set_option autoImplicit false",
      "",
      s!"namespace {namespace_}",
      ""
    ]

    for info in group do
      let typeDecl := emitClassType info
      if !typeDecl.isEmpty then
        lines := lines ++ [typeDecl, ""]

    lines := lines ++ [s!"end {namespace_}"]
    outputs := outputs ++ [{ filename := s!"Types{chunkNum}", content := String.intercalate "\n" lines }]

  -- Get max types chunk number for imports
  let numTypeChunks := classGroups.length
  let typeImports := (List.range numTypeChunks).map fun i =>
    let num := String.mk (List.replicate (2 - (i + 1).repr.length) '0' ++ (i + 1).repr.toList)
    s!"import {namespace_}.Generated.FullSUMO.Types{num}"

  -- Coercions.lean
  let mut coeLines : List String := []
  -- Imports must come first
  coeLines := coeLines ++ [s!"import {namespace_}.Generated.FullSUMO.Core"]
  coeLines := coeLines ++ typeImports
  coeLines := coeLines ++ [
    "",
    "/-!",
    s!"# {namespace_} - Coercions",
    "",
    "Generated by TypedEmit.lean (chunked mode)",
    "-/",
    "",
    "set_option autoImplicit false",
    "",
    s!"namespace {namespace_}",
    "",
    "/-! ## Coercions -/",
    ""
  ]

  for info in allClasses do
    let coe := emitCoercion info
    if !coe.isEmpty then
      coeLines := coeLines ++ [coe]

  coeLines := coeLines ++ ["", s!"end {namespace_}"]
  outputs := outputs ++ [{ filename := "Coercions", content := String.intercalate "\n" coeLines }]

  -- Relations.lean
  let mut relLines : List String := []
  -- Imports must come first
  relLines := relLines ++ [s!"import {namespace_}.Generated.FullSUMO.Core"]
  relLines := relLines ++ typeImports
  relLines := relLines ++ [s!"import {namespace_}.Generated.FullSUMO.Coercions"]
  relLines := relLines ++ [
    "",
    "/-!",
    s!"# {namespace_} - Relations",
    "",
    "Generated by TypedEmit.lean (chunked mode)",
    "-/",
    "",
    "set_option autoImplicit false",
    "",
    s!"namespace {namespace_}",
    "",
    "/-! ## Relations -/",
    ""
  ]

  -- Emit all relations with domain info (avoid duplicates and collisions with classes)
  let mut emittedRels : Std.HashSet String := {}
  for (rel, _) in ctx.relDomains.toList do
    -- Skip if already emitted or if it's also a class (would cause name collision)
    if !emittedRels.contains rel && !ctx.hierarchy.knownClasses.contains rel then
      emittedRels := emittedRels.insert rel
      let decl := emitRelation ctx rel
      if !decl.isEmpty then
        relLines := relLines ++ [decl]

  relLines := relLines ++ ["", s!"end {namespace_}"]
  outputs := outputs ++ [{ filename := "Relations", content := String.intercalate "\n" relLines }]

  -- Collect all valid individuals first (avoid collisions with classes and relations)
  let mut allIndividuals : List String := []
  let mut emittedInds : Std.HashSet String := {}
  for (ind, _) in ctx.instances.toList do
    -- Skip if this is also a relation or class (would cause name collision)
    if !ctx.relDomains.contains ind && !ctx.hierarchy.knownClasses.contains ind && !emittedInds.contains ind then
      emittedInds := emittedInds.insert ind
      let decl := emitIndividual ctx ind
      if !decl.isEmpty then
        allIndividuals := allIndividuals ++ [decl]

  -- Chunk individuals into groups of 2000 to avoid stack overflow
  let individualsPerChunk := 2000
  let numIndChunks := (allIndividuals.length + individualsPerChunk - 1) / individualsPerChunk

  if numIndChunks <= 1 then
    -- Single file
    let mut indLines : List String := []
    indLines := indLines ++ [s!"import {namespace_}.Generated.FullSUMO.Core"]
    indLines := indLines ++ typeImports
    indLines := indLines ++ [s!"import {namespace_}.Generated.FullSUMO.Coercions"]
    indLines := indLines ++ [
      "",
      "/-!",
      s!"# {namespace_} - Individuals",
      "",
      "Generated by TypedEmit.lean (chunked mode)",
      "-/",
      "",
      "set_option autoImplicit false",
      "",
      s!"namespace {namespace_}",
      "",
      "/-! ## Individuals -/",
      ""
    ]
    indLines := indLines ++ allIndividuals
    indLines := indLines ++ ["", s!"end {namespace_}"]
    outputs := outputs ++ [{ filename := "Individuals", content := String.intercalate "\n" indLines }]
  else
    -- Multiple chunks
    for indChunkIdx in List.range numIndChunks do
      let startIdx := indChunkIdx * individualsPerChunk
      let endIdx := min ((indChunkIdx + 1) * individualsPerChunk) allIndividuals.length
      let chunkInds := allIndividuals.drop startIdx |>.take (endIdx - startIdx)

      let indChunkNum := String.mk (List.replicate (2 - (indChunkIdx + 1).repr.length) '0' ++ (indChunkIdx + 1).repr.toList)

      let mut indLines : List String := []
      indLines := indLines ++ [s!"import {namespace_}.Generated.FullSUMO.Core"]
      indLines := indLines ++ typeImports
      indLines := indLines ++ [s!"import {namespace_}.Generated.FullSUMO.Coercions"]
      indLines := indLines ++ [
        "",
        "/-!",
        s!"# {namespace_} - Individuals (chunk {indChunkIdx + 1}/{numIndChunks})",
        "",
        "Generated by TypedEmit.lean (chunked mode)",
        "-/",
        "",
        "set_option autoImplicit false",
        "",
        s!"namespace {namespace_}",
        ""
      ]
      indLines := indLines ++ chunkInds
      indLines := indLines ++ ["", s!"end {namespace_}"]
      outputs := outputs ++ [{ filename := s!"Individuals{indChunkNum}", content := String.intercalate "\n" indLines }]

  -- CoeHead.lean
  let mut coeHeadLines : List String := []
  -- Imports must come first
  coeHeadLines := coeHeadLines ++ [s!"import {namespace_}.Generated.FullSUMO.Core"]
  coeHeadLines := coeHeadLines ++ typeImports
  coeHeadLines := coeHeadLines ++ [s!"import {namespace_}.Generated.FullSUMO.Coercions"]
  coeHeadLines := coeHeadLines ++ [
    "",
    "/-!",
    s!"# {namespace_} - CoeHead Instances",
    "",
    "Generated by TypedEmit.lean (chunked mode)",
    "-/",
    "",
    "set_option autoImplicit false",
    "",
    s!"namespace {namespace_}",
    "",
    "/-! ## CoeHead (for ↑ display) -/",
    ""
  ]

  for info in allClasses do
    match info.parent with
    | none => pure ()
    | some parent =>
        let childName := sanitizeClassName info.name
        let parentName := sanitizeClassName parent
        coeHeadLines := coeHeadLines ++ [
          s!"instance : CoeHead {childName} {parentName} where coe := Subtype.val"
        ]

  coeHeadLines := coeHeadLines ++ ["", s!"end {namespace_}"]
  outputs := outputs ++ [{ filename := "CoeHead", content := String.intercalate "\n" coeHeadLines }]

  -- Barrel file: FullSUMO.lean
  let mut barrelLines : List String := []
  -- Imports must come first in Lean 4
  barrelLines := barrelLines ++ [s!"import {namespace_}.Generated.FullSUMO.Core"]
  barrelLines := barrelLines ++ typeImports
  barrelLines := barrelLines ++ [
    s!"import {namespace_}.Generated.FullSUMO.Coercions",
    s!"import {namespace_}.Generated.FullSUMO.Relations"
  ]
  -- Import individuals (may be chunked)
  if numIndChunks <= 1 then
    barrelLines := barrelLines ++ [s!"import {namespace_}.Generated.FullSUMO.Individuals"]
  else
    for barrelIndIdx in List.range numIndChunks do
      let barrelIndNum := String.mk (List.replicate (2 - (barrelIndIdx + 1).repr.length) '0' ++ (barrelIndIdx + 1).repr.toList)
      barrelLines := barrelLines ++ [s!"import {namespace_}.Generated.FullSUMO.Individuals{barrelIndNum}"]
  barrelLines := barrelLines ++ [
    s!"import {namespace_}.Generated.FullSUMO.CoeHead",
    "",
    "/-!",
    s!"# {namespace_} - Full SUMO Ontology",
    "",
    "Generated by TypedEmit.lean (chunked mode)",
    "This barrel file imports all chunks.",
    "-/"
  ]
  outputs := outputs ++ [{ filename := "FullSUMO", content := String.intercalate "\n" barrelLines }]

  return outputs

end SumoKif.TypedEmit
