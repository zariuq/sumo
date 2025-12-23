import LeanSUMO.Generated.PurelyTyped

/-!
# LeanSUMO Purely Typed Demo

This file demonstrates the purely typed LeanSUMO approach with example proofs.

## Architecture

```
Entity : Type                              -- Base type
  ├── Physical_ := { x : Entity // isPhysical_ x }
  │   ├── Object_ := { x : Physical_ // isObject_ x }
  │   │   └── AutonomousAgent := { x : Object_ // isAutonomousAgent x }
  │   │       ├── Human := { x : AutonomousAgent // isHuman x }
  │   │       └── Organism := { x : AutonomousAgent // isOrganism x }
  │   │           └── Animal := { x : Organism // isAnimal x }
  │   └── Process_ := { x : Physical_ // isProcess_ x }
  └── Abstract_ := { x : Entity // isAbstract_ x }
      └── Attribute := { x : Abstract_ // isAttribute x }
```
-/

set_option autoImplicit false

namespace LeanSUMO.Examples.PurelyTypedDemo

open LeanSUMO

/-! ## Section 1: Sex Attribute Proofs -/

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

/-- No one can be both a mother and father of the same child -/
theorem not_both_mother_and_father (child p : Organism)
    (hMother : mother child p) (hFather : father child p) : False := by
  have hFemale : hasAttribute p Female := mother_implies_female child p hMother
  have hMale : hasAttribute p Male := father_implies_male child p hFather
  exact male_female_contrary p hMale hFemale

/-- Term-mode: No one can be both mother and father -/
theorem not_both_mother_and_father' (child p : Organism)
    (hMother : mother child p) (hFather : father child p) : False :=
  male_female_contrary p
    (father_implies_male child p hFather)
    (mother_implies_female child p hMother)

/-! ## Section 2: Mereology (Part-Whole) Proofs -/

/-- Part relation forms a chain: if A is part of B and B is part of C, then A is part of C -/
theorem part_chain (a b c : Object_)
    (hab : part a b) (hbc : part b c) : part a c :=
  part_transitive a b c hab hbc

/-- Every object is part of itself -/
theorem part_self (x : Object_) : part x x :=
  part_reflexive x

/-- If A is part of B and B is part of C and C is part of D, then A is part of D -/
theorem part_chain_4 (a b c d : Object_)
    (hab : part a b) (hbc : part b c) (hcd : part c d) : part a d := by
  have hac : part a c := part_transitive a b c hab hbc
  exact part_transitive a c d hac hcd

/-! ## Section 3: Type Hierarchy and Coercions -/

-- #print shows the subtype structure:
#print Animal    -- { x // isAnimal x } where x : Organism
#print Organism  -- { x // isOrganism x } where x : AutonomousAgent

-- To see the FULL definition, check the predicate's type:
#check @isAnimal    -- isAnimal : Organism → Prop
--                    ^^^^^^^^
--                    Animal is a subtype of Organism!

#check @isOrganism  -- isOrganism : AutonomousAgent → Prop
#check @isHuman     -- isHuman : AutonomousAgent → Prop

-- The subtype relationship is clear from the predicate domain:
-- isAnimal : Organism → Prop  means  Animal ⊂ Organism
-- isOrganism : AutonomousAgent → Prop  means  Organism ⊂ AutonomousAgent

/-- An Animal can participate as the agent of a process (via coercion chain) -/
example (p : Process_) (a : Animal) : Prop := agent p a
-- Animal → Organism → AutonomousAgent (coercion)

/-- A Human can participate as the agent of a process -/
example (p : Process_) (h : Human) : Prop := agent p h
-- Human → AutonomousAgent (coercion)

/-- An Animal can have attributes (via coercion to Entity) -/
example (a : Animal) (attr : Attribute) : Prop := hasAttribute a attr
-- Animal → Organism → AutonomousAgent → Object_ → Physical_ → Entity (coercion chain)

/-- Coercions are automatic - Animal used where Organism expected -/
example (a : Animal) : Organism := a

/-- Deep coercion chain works: Animal → ... → Entity (5 steps) -/
example (a : Animal) : Entity := a

/-! ## Section 4: Process and Agent Proofs -/

/-- Every process has some agent -/
theorem exists_agent (p : Process_) : ∃ a : AutonomousAgent, agent p a :=
  process_has_agent p

/-- If a Human does a process, that process has an agent -/
theorem human_agent_exists (p : Process_) (h : Human) (hp : agent p h) :
    ∃ a : AutonomousAgent, agent p a :=
  ⟨h, hp⟩

/-! ## Section 5: Combined Reasoning -/

/-- An animal that is a mother cannot also be a father of the same child -/
theorem mother_animal_not_father (child mom : Animal)
    (hMother : mother child mom) :
    ¬father child mom := by
  intro hFather
  -- mom is Female (from being a mother)
  have hFemale : hasAttribute mom Female := mother_implies_female child mom hMother
  -- mom would be Male (from being a father)
  have hMale : hasAttribute mom Male := father_implies_male child mom hFather
  -- Contradiction!
  exact male_female_contrary mom hMale hFemale

/-! ## Section 5b: Using Polymorphic Wrappers (Clean Proof States!) -/

/-- Same proof using mother' - proof state shows Animal, not .val! -/
theorem mother_animal_not_father' (child mom : Animal)
    (hMother : mother' child mom) :  -- Uses polymorphic mother'
    ¬father' child mom := by
  intro hFather
  -- Unfold the polymorphic wrappers to access the base axioms
  unfold mother' at hMother
  unfold father' at hFather
  have hFemale : hasAttribute mom Female := mother_implies_female ↑child ↑mom hMother
  have hMale : hasAttribute mom Male := father_implies_male ↑child ↑mom hFather
  exact male_female_contrary mom hMale hFemale

/-- A HeartAttack is a kind of Process (via type structure) -/
example (ha : HeartAttack) : Process_ := ha

/-- A HeartAttack can have an agent -/
example (ha : HeartAttack) (victim : Human) : Prop := agent ha victim

/-! ## Section 6: Type Signatures -/

-- Relations show their domain types:
#check mother      -- mother : Organism → Organism → Prop
#check father      -- father : Organism → Organism → Prop
#check agent       -- agent : Process_ → AutonomousAgent → Prop
#check patient     -- patient : Process_ → Object_ → Prop
#check part        -- part : Object_ → Object_ → Prop
#check hasAttribute -- hasAttribute : Entity → Attribute → Prop

-- Individuals are typed:
#check Male        -- Male : Attribute
#check Female      -- Female : Attribute

/-! ## Note on `.val` in Proof States

When you write a proof with `Animal` arguments but the relation takes `Organism`,
the proof state shows `.val` because that's how coercion works internally:

```
child mom : Animal
hMother : mother child.val mom.val   -- .val coerces Animal → Organism
⊢ ¬father child.val mom.val
```

This is a Lean limitation - coercions are elaborated before display. Options:
1. Use `↑` notation explicitly: `mother ↑child ↑mom`
2. Define relations at multiple type levels (more complex)
3. Accept it as "the coercion is working"

The key point: Animal IS a subtype of Organism (see `#print Animal`),
and the type system enforces this relationship.
-/

/-! ## Summary

1. **Animal IS a subtype**: `#print Animal` shows `{ x : Organism // isAnimal x }`
2. **Type Safety**: `mother : Organism → Organism → Prop` - only organisms can be parents
3. **Coercions Work**: `Animal` auto-coerces to `Organism`, `Entity`, etc.
4. **Domain Errors**: Wrong types = compile-time errors
5. **Proof states**: Show `.val` for coercions (Lean limitation), but types are meaningful
-/

end LeanSUMO.Examples.PurelyTypedDemo
