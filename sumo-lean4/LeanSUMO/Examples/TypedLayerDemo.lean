import LeanSUMO.Generated.SUMOHol.Typed

/-!
# LeanSUMO Typed Layer Demo

This file demonstrates the key features of LeanSUMO's typed layer:

1. **Nested Subtype Hierarchy**: Classes form a proper IS-A hierarchy
   - `Human ⊆ CognitiveAgent ⊆ SentientAgent ⊆ AutonomousAgent ⊆ Object ⊆ Physical ⊆ Entity`
   - Each step is a Lean subtype with automatic coercions

2. **Type-Safe Relations**: Domain constraints are enforced by Lean's type system
   - `agent : Process → AutonomousAgent → Prop` (not `Obj → Obj → Prop`)
   - Wrong domains = compile-time errors

3. **Proof Explorer Usability**: Hover over types shows meaningful structure
   - `Human := { x : CognitiveAgent // Prelude.Human x.val... }`
-/

set_option autoImplicit false

-- Fix universe level to avoid polymorphism issues with axioms
universe u

namespace LeanSUMO.Examples.TypedLayerDemo

-- Only open Typed; use Prelude qualified to avoid ambiguity
open LeanSUMO.Generated.SUMOHol.Typed

-- Alias for the base Obj type from Prelude (untyped layer)
-- Fix at universe u to match axiom universe levels
abbrev BaseObj := LeanSUMO.Generated.SUMOHol.Prelude.Obj.{u}

/-!
## Example 1: Nested Subtype Hierarchy

The class definitions form a proper nested hierarchy:
```
Entity
├── Abstract
│   ├── Attribute
│   │   └── InternalAttribute → BiologicalAttribute → ...
│   ├── Proposition
│   └── Quantity → Number → ...
└── Physical
    ├── Object
    │   ├── AutonomousAgent
    │   │   ├── SentientAgent
    │   │   │   └── CognitiveAgent → Human
    │   │   └── Organism → Animal → ...
    │   └── Artifact → Device → ...
    └── Process → IntentionalProcess → ...
```
-/

-- Check the structure in proof explorer:
#check Human
-- Shows: Human := { x : CognitiveAgent // Prelude.Human x.val.val.val.val.val }

#check CognitiveAgent
-- Shows: CognitiveAgent := { x : SentientAgent // Prelude.CognitiveAgent x.val.val.val.val }

#check Animal
-- Shows: Animal := { x : Organism // Prelude.Animal x.val.val.val.val }

#check Process
-- Shows: Process := { x : Physical // Prelude.Process x.val.val }

/-!
## Example 2: Automatic Coercions

Lean automatically coerces along the subtype chain.
-/

-- Given a Human, we can use it anywhere an AutonomousAgent is expected
example (h : Human) : AutonomousAgent := h  -- Coercion chain: Human → CognitiveAgent → SentientAgent → AutonomousAgent

-- Given an Animal, we can use it as an Organism
example (a : Animal) : Organism := a

-- Everything can be coerced to BaseObj (for interop with the faithful layer)
example (h : Human) : BaseObj := h
example (p : Process) : BaseObj := p

/-!
## Example 3: Type-Safe Relations

The typed layer enforces domain constraints at compile time.
-/

-- `agent` takes Process and AutonomousAgent (not arbitrary Obj)
#check agent
-- Shows: agent : Process → AutonomousAgent → Prop

-- `mother` takes Organisms
#check mother
-- Shows: mother : Organism → Organism → Prop

-- `part` takes Objects
#check part
-- Shows: part : Object → Object → Prop

-- We can form propositions with proper types:
example (p : IntentionalProcess) (a : Human) : Prop := agent p a
-- Human coerces to AutonomousAgent automatically!

example (animal1 animal2 : Animal) : Prop := mother animal1 animal2
-- Animal coerces to Organism automatically!

/-!
## Example 4: Type Errors Catch Ontology Bugs

Trying to use wrong types gives compile-time errors.
-/

-- UNCOMMENT TO SEE TYPE ERROR:
-- example (p : Process) (rock : Artifact) : Prop := agent p rock
-- Error! Artifact doesn't coerce to AutonomousAgent

-- UNCOMMENT TO SEE TYPE ERROR:
-- example (table : Artifact) (chair : Artifact) : Prop := mother table chair
-- Error! Artifact doesn't coerce to Organism

/-!
## Example 5: Named Individuals

We can work with hypothetical individuals at specific types:
-/

-- Given a human Lincoln, they can participate in various roles:
example (Lincoln : Human) (p : IntentionalProcess) : Prop := agent p Lincoln

-- Lincoln can be used wherever a supertype is expected:
example (Lincoln : Human) : CognitiveAgent := Lincoln
example (Lincoln : Human) : AutonomousAgent := Lincoln
example (Lincoln : Human) : Object := Lincoln
example (Lincoln : Human) : Entity := Lincoln

-- A Ship (Artifact) cannot be an agent:
-- UNCOMMENT TO SEE TYPE ERROR:
-- example (Titanic : Artifact) (p : IntentionalProcess) : Prop := agent p Titanic
-- Error! Artifact doesn't coerce to AutonomousAgent

/-!
## Example 6: Working with Proofs

Because the hierarchy is structural, proofs can use the `.val` accessor:
-/

-- If h : Human, then h.val : CognitiveAgent
-- And h.val.val : SentientAgent, etc.

-- Proof that every Human is an AutonomousAgent (via the type structure):
theorem human_is_autonomous (h : Human) :
    LeanSUMO.Generated.SUMOHol.Prelude.AutonomousAgent (h : BaseObj) := by
  -- h : Human = { x : CognitiveAgent // Prelude.Human x... }
  -- h.val : CognitiveAgent
  -- h.val.val : SentientAgent
  -- h.val.val.val : AutonomousAgent = { x : Object // Prelude.AutonomousAgent x... }
  -- h.val.val.val.property : Prelude.AutonomousAgent h.val.val.val.val...
  exact h.val.val.val.property

/-!
## Example 7: Interop with Faithful Layer

The typed layer uses `Of` for function results, which is compatible with `Obj`:
-/

-- Functions return Of (Prelude.X) for simplicity:
#check BeginFn
-- Shows: BeginFn : TimeInterval → Of Prelude.TimePoint

-- Results can be coerced to BaseObj:
noncomputable example (interval : TimeInterval) : BaseObj := BeginFn interval

/-!
## Example 8: Using SUMO Axioms with Typed Arguments

The typed layer provides domain-safe access to SUMO's axioms.
Arguments use proper typed classes (Organism, not Obj).
-/

/-- mother implies parent - using typed Organism arguments -/
theorem mother_implies_parent' (child mom : Organism) (h : mother child mom) :
    parent child mom :=
  LeanSUMO.Generated.SUMOHol.Axioms.parent_23356 child mom h

/-- father implies parent - using typed Organism arguments -/
theorem father_implies_parent' (child dad : Organism) (h : father child dad) :
    parent child dad :=
  LeanSUMO.Generated.SUMOHol.Axioms.parent_23358 child dad h

/-- daughter implies parent - using typed Organism arguments -/
theorem daughter_implies_parent (child prnt : Organism) (h : daughter child prnt) :
    parent child prnt :=
  LeanSUMO.Generated.SUMOHol.Axioms.daughter_subrelation_parent child prnt h

/-- son implies parent - using typed Organism arguments -/
theorem son_implies_parent (child prnt : Organism) (h : son child prnt) :
    parent child prnt :=
  LeanSUMO.Generated.SUMOHol.Axioms.son_subrelation_parent child prnt h

/-!
### Note on Attribute Proofs

The "no male mothers" proof requires typed `Male : Attribute` and `Female : Attribute`
constants, which aren't yet generated. The Typed layer needs to emit typed individuals
(not just classes and relations) to support attribute-based proofs.

TODO: Generate typed individuals like `Male : Attribute`, `Female : Attribute` in Typed.lean
-/

/-!
## Summary

| Feature | Faithful Layer | Typed Layer |
|---------|---------------|-------------|
| Classes | `Class := Obj → Prop` | Nested subtypes `{ x : Parent // C x... }` |
| Relations | `rel : Obj → Obj → Prop` | `rel : Process → AutonomousAgent → Prop` |
| Type errors | Runtime (axiom violations) | Compile-time |
| Proof explorer | Shows `Class` | Shows hierarchy structure |
| Interop | Native | Via `Coe X Obj` |

The typed layer provides:
- Domain errors caught at compile time
- Meaningful proof explorer output
- Automatic coercions along subclass chains
- Full interop with the faithful layer via Obj coercions
- Access to 60,000+ SUMO axioms for proofs
-/

end LeanSUMO.Examples.TypedLayerDemo
