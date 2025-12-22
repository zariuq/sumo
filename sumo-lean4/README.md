# SUMO KIF Checker

A lightweight Lean 4 tool for checking arity and domain-declaration consistency in SUMO KIF files.

## What it does

This tool parses SUMO KIF files and verifies:
- **Predicate/function arity consistency**: Checks that every use of a predicate/function has the correct number of arguments based on its declared arity (from `instance` declarations like `BinaryPredicate`, `TernaryFunction`, etc.)
- **Domain index validity**: Ensures `domain` and `domainSubclass` declarations reference valid argument positions
- **Arity inference**: For symbols without explicit arity declarations, infers arity from domain declarations

## Usage

```bash
# Check a single file
lake exe sumo_kif_check ../Merge.kif

# Check all .kif files in parent directory
lake exe sumo_kif_check --all

# Check specific files
lake exe sumo_kif_check ../People.kif ../Merge.kif
```

## Exporting a Lean signature

```bash
lake exe sumo_kif_export_sig --out Sumo/Signature.lean
```

## Exporting Lean axioms (shallow embedding)

This emits one Lean `axiom` per non-metadata top-level KIF form, using the list/spine encoding
(`ap : Obj → List Obj → Obj`) and object-level logical constructors from `Sumo/Core.lean`.

```bash
lake exe sumo_kif_export_axioms --module MergeAxioms --out Sumo/MergeAxioms.lean
```

## Exporting a theory as data (recommended for consistency work)

This emits a `def axioms : List Obj` where all free variables are closed using `mkForall`/`mkForallRow`,
so the result is a *closed* list of object-formulas you can reason about without adding global axioms.

```bash
lake exe sumo_kif_export_theory --module MergeTheory --out Sumo/MergeTheory.lean
```

## Exporting a computable AST theory

This emits a `def axioms : List Sumo.Ast.Expr` (chunked to keep Lean happy) plus metadata declarations as plain strings.

```bash
lake exe sumo_kif_export_ast --module MergeAst --out Sumo/MergeAst.lean
```

## Basic contradiction scan (sound but incomplete)

This checks only for **ground atomic** contradictions of the form `P(t1,...,tn)` and `not P(t1,...,tn)` appearing as axioms.

```bash
lake exe sumo_kif_ast_check ../Merge.kif
```

## Exporting HOL-native LeanSUMO (recommended)

This emits a **Benzmüller-style shallow HOL embedding** as ordinary Lean code:
- `Obj : Type` and `Class := Obj → Prop`
- curried predicates/functions
- `@ROW` spines as `List Obj`
- `KappaFn` as set comprehension (`LeanSUMO.kappa`)
- **Typed view layer** (`Typed.lean`) generated from `(domain …)` / `(range …)` metadata

```bash
cd sumo-lean4

# Generate Lean modules under `LeanSUMO/Generated/<NAME>/` (ignored by git)
lake exe sumo_kif_hol_emit --all --root .. --name SUMOHol

# Optional: include tiny/test KIFs too
lake exe sumo_kif_hol_emit --all --root .. --include-tests --include-tiny --name SUMOHolAll

# Compile the generated theory
lake build LeanSUMO.Generated.SUMOHol
```

## Building

```bash
lake build
```

## Implementation

- **SumoKif/Sexp.lean**: S-expression data types
- **SumoKif/ParseSexp.lean**: Lightweight S-expression parser
- **SumoKif/Signature.lean**: Arity signature extraction
- **SumoKif/Check.lean**: Arity and domain-declaration checking logic
- **SumoKif/ExportAxioms.lean**: KIF → Lean axiom translation (shallow embedding)
- **SumoKif/ExportAst.lean**: KIF → Lean computable AST theory export
- **SumoKif/ToAst.lean**: S-expression → AST conversion (for runtime checks)
- **Main.lean**: Command-line interface
- **SumoKif/HolEmit.lean**: KIF → HOL-native LeanSUMO emitter
- **HolEmitMain.lean**: CLI for the HOL emitter

The checker is intentionally minimal (no mathlib dependency) and focuses on syntactic well-formedness and basic semantic consistency.
