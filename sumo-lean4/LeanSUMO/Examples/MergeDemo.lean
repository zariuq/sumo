import LeanSUMO.Generated.MergeSUMO

/-!
# LeanSUMO Merge.kif Demo

This demonstrates the purely typed emitter working on the FULL Merge.kif (core SUMO).

## Stats
- 3,257 lines of Lean
- 1,290 axioms/definitions
- 1,268 CoeHead instances for automatic coercion
- Hierarchy depth up to ~10 levels (Human → Hominid → Primate → Mammal → ...)
-/

set_option autoImplicit false

namespace LeanSUMO.Examples.MergeDemo

open LeanSUMO

/-! ## Exploring the Type Hierarchy -/

-- Human is properly nested: Human → Hominid → Primate → Mammal → WarmBloodedVertebrate → ...
#check @isHuman  -- isHuman : Hominid → Prop
#check @isHominid -- isHominid : Primate → Prop
#check @isPrimate -- isPrimate : Mammal → Prop
#check @isMammal -- isMammal : WarmBloodedVertebrate → Prop

-- See the full chain with #print
#print Human     -- { x : Hominid // isHuman x }
#print Hominid   -- { x : Primate // isHominid x }

/-! ## Coercion Examples -/

-- Human automatically coerces up the hierarchy
example (h : Human) : Hominid := h
example (h : Human) : Primate := h
example (h : Human) : Mammal := h
example (h : Human) : Organism := h
example (h : Human) : Entity := h

-- Man and Woman are subtypes of Human
example (m : Man) : Human := m
example (w : Woman) : Human := w

/-! ## Relation Types -/

-- Relations use the proper domain types from SUMO
#check mother  -- mother : Organism → Organism → Prop
#check father  -- father : Organism → Organism → Prop
#check agent   -- agent : Process_ → AutonomousAgent → Prop
#check hasAttribute -- hasAttribute : Object_ → Attribute → Prop

/-! ## Proofs with Merge.kif Types -/

/-- A mother cannot be Male -/
theorem mother_not_male (child mom : Organism) (h : mother child mom) :
    ¬hasAttribute mom Male := by
  intro hMale
  have hFemale : hasAttribute mom Female := mother_implies_female child mom h
  exact male_female_contrary mom hMale hFemale

/-- A father cannot be Female -/
theorem father_not_female (child dad : Organism) (h : father child dad) :
    ¬hasAttribute dad Female := by
  intro hFemale
  have hMale : hasAttribute dad Male := father_implies_male child dad h
  exact male_female_contrary dad hMale hFemale

/-- Part transitivity -/
theorem part_chain (a b c : Object_) (hab : part a b) (hbc : part b c) : part a c :=
  part_transitive a b c hab hbc

/-! ## Biological Hierarchy Examples -/

-- Birds and Mammals are both WarmBloodedVertebrates
example (b : Bird) : WarmBloodedVertebrate := b
example (m : Mammal) : WarmBloodedVertebrate := m

-- But they're different branches - no coercion between them
-- example (b : Bird) : Mammal := b  -- Would fail!

-- Fish and Reptiles are ColdBloodedVertebrates
example (f : Fish) : ColdBloodedVertebrate := f
example (r : Reptile) : ColdBloodedVertebrate := r

/-! ## Days and Months (Time Hierarchy) -/

-- Days of the week
example (m : Monday) : Day := m
example (t : Tuesday) : Day := t

-- Months
example (jan : January) : Month := jan
example (dec : December) : Month := dec

-- LeapYear is a Year
example (ly : LeapYear) : Year := ly

/-! ## Summary

The Merge.kif core ontology compiles to 3,257 lines of typed Lean:

1. **634 classes** in proper hierarchy (Entity → Physical → Object → Organism → ...)
2. **Automatic coercions** via CoeHead instances
3. **Typed relations** (`mother : Organism → Organism → Prop`)
4. **No `.val` noise** in types - predicates at correct level
5. **Proof-ready** - axioms work out of the box
-/

end LeanSUMO.Examples.MergeDemo
