# SUMO KIF Type Checker

A lightweight Lean 4 tool for checking arity consistency and domain satisfiability in SUMO KIF files.

## What it does

This tool parses SUMO KIF files and verifies:
- **Predicate/function arity consistency**: Checks that every use of a predicate/function has the correct number of arguments based on its declared arity (from `instance` declarations like `BinaryPredicate`, `TernaryFunction`, etc.)
- **Domain index validity**: Ensures `domain` and `domainSubclass` declarations reference valid argument positions
- **Arity inference**: For symbols without explicit arity declarations, infers arity from domain declarations
- **Domain satisfiability**: Detects when variables have disjoint domain constraints (e.g., a variable asserted to be both `Object` and `Process`), which makes formulas unsatisfiable

## Usage

```bash
# Check a single file
lake exe sumo_kif_check -- ../Merge.kif

# Check all .kif files in parent directory
lake exe sumo_kif_check -- --all

# Check specific files
lake exe sumo_kif_check -- ../People.kif ../Merge.kif
```

## Building

```bash
lake build
```

## Implementation

- **SumoKif/Sexp.lean**: S-expression data types
- **SumoKif/ParseSexp.lean**: Lightweight S-expression parser
- **SumoKif/Signature.lean**: Arity signature extraction, class hierarchy tracking, and disjointness closure computation
- **SumoKif/Check.lean**: Arity and domain satisfiability checking logic
- **Main.lean**: Command-line interface

The checker is intentionally minimal (no mathlib dependency) and focuses on syntactic well-formedness and basic semantic consistency.
