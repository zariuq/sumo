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

## Building

```bash
lake build
```

## Implementation

- **SumoKif/Sexp.lean**: S-expression data types
- **SumoKif/ParseSexp.lean**: Lightweight S-expression parser
- **SumoKif/Signature.lean**: Arity signature extraction
- **SumoKif/Check.lean**: Arity and domain-declaration checking logic
- **Main.lean**: Command-line interface

The checker is intentionally minimal (no mathlib dependency) and focuses on syntactic well-formedness and basic semantic consistency.
