# SUMO Lean-ify arity pass: review notes

Run the checker:

`cd sumo-lean4 && lake exe sumo_kif_check -- --all`

## Status

`sumo-lean4` checker now reports `no issues found` across all `.kif` files.

Note: an experimental “domain satisfiability” / “disjoint type constraints” heuristic was removed because it is not sound for general first-order logic (it can misfire under `or`, `=>`, etc.). The checker now focuses on plumbing: arity + domain-declaration sanity.

## Nuanced fixes already applied (for awareness)

- `Mid-level-ontology.kif`: `classmate`/`colleague` are explicitly ternary (`(?A1 ?A2 ?COURSE/?ORG)`), but were also declared as `IrreflexiveRelation` (a binary-only relation class in `Merge.kif`). The `IrreflexiveRelation` instances were removed, and explicit 1st/2nd-argument irreflexivity axioms were added:
  - `(forall (?A ?COURSE) (not (classmate ?A ?A ?COURSE)))`
  - `(forall (?A ?ORG) (not (colleague ?A ?A ?ORG)))`
  If you also want symmetry in the first two arguments, add:
  - `(=> (classmate ?A1 ?A2 ?COURSE) (classmate ?A2 ?A1 ?COURSE))`
  - `(=> (colleague ?A1 ?A2 ?ORG) (colleague ?A2 ?A1 ?ORG))`

- `mondial.kif`: the 2-arg `depth` facts were normalized to the 3-arg `depth` signature using `SeaLevel` and meters:
  - `(depth Seas_X 1234)` → `(depth Seas_X SeaLevel (MeasureFn 1234 Meter))`
  This matches the intended “depth below sea level” reading, but it’s still a modeling choice worth sanity-checking.

- `mondial.kif`: four truncated Factbook-style demographics facts that were missing the region argument were restored with `Zimbabwe` as the region:
  - `beliefGroupPercentInRegion` for `Religions_Muslim` (1) and `Religions_Christian` (25)
  - `ethnicityPercentInRegion` for `EthnicGroups_Asian` (1) and `EthnicGroups_African` (98)
