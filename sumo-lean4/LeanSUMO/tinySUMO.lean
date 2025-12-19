import LeanSUMO.tinySUMO.Core
import LeanSUMO.tinySUMO.Prelude
import LeanSUMO.tinySUMO.Axioms
import LeanSUMO.tinySUMO.Examples

/-!
# tinySUMO - HOL-Native LeanSUMO

A minimal, readable SUMO ontology in Lean.
No encoding machinery - just pure HOL.

## Usage

After `import LeanSUMO.tinySUMO`, you can directly use:
- Classes: `Human`, `Physical`, `AutonomousAgent`, etc.
- Axioms: `human_subclass_autonomousAgent`, `lincoln_is_human`, etc.
- Core theorems: `subclass_trans`, `instance_subclass`, etc.

No bundling into structures required!
-/
