import LeanSUMO.Generated.FullSUMO.FullSUMO

/-!
# Full SUMO Demo

This demonstrates reasoning with the complete SUMO ontology (9,500+ classes, 1,797 relations).

## Stats
- 69,546 lines of typed Lean
- 9,500 classes in hierarchy
- 9,480 coercions + CoeHead instances
- 1,797 relations with typed domains
- 19,928 individuals
-/

set_option autoImplicit false

namespace LeanSUMO.Examples.FullSUMODemo

open LeanSUMO

/-! ## Exploring the Type Hierarchy -/

-- The biological hierarchy is deeply nested:
#check @isHuman                  -- isHuman : Hominid → Prop
#check @isHominid                -- isHominid : Primate → Prop
#check @isPrimate                -- isPrimate : Mammal → Prop
#check @isMammal                 -- isMammal : WarmBloodedVertebrate → Prop
#check @isWarmBloodedVertebrate  -- isWarmBloodedVertebrate : Vertebrate → Prop
#check @isVertebrate             -- isVertebrate : Animal → Prop
#check @isAnimal                 -- isAnimal : Organism → Prop
#check @isOrganism               -- isOrganism : OrganicObject → Prop
#check @isOrganicObject          -- isOrganicObject : CorpuscularObject → Prop
#check @isCorpuscularObject      -- isCorpuscularObject : SelfConnectedObject → Prop
#check @isSelfConnectedObject    -- isSelfConnectedObject : Object_ → Prop
#check @isObject_                -- isObject_ : Physical_ → Prop
#check @isPhysical_              -- isPhysical_ : Entity → Prop

-- Human is 12 levels deep from Entity!

/-! ## Direct Coercions Work (One Level at a Time) -/

-- Each subtype coerces to its immediate parent
example (h : Human) : Hominid := h
example (h : Hominid) : Primate := h
example (p : Primate) : Mammal := p
example (m : Mammal) : WarmBloodedVertebrate := m
example (v : Vertebrate) : Animal := v
example (a : Animal) : Organism := a
example (o : Organism) : OrganicObject := o

/-! ## Relations Use Proper Domain Types -/

-- Family relations are typed to Organism
#check mother   -- mother : Organism → Organism → Prop
#check father   -- father : Organism → Organism → Prop
#check parent   -- parent : Organism → Organism → Prop
#check sibling  -- sibling : Organism → Organism → Prop

-- Process relations
#check agent    -- agent : Process_ → AutonomousAgent → Prop
#check patient  -- patient : Process_ → Object_ → Prop

-- Mereology uses Object
#check part     -- part : Object_ → Object_ → Prop

-- Attributes
#check hasAttribute  -- hasAttribute : Object_ → Attribute → Prop

/-! ## Individuals Are Typed -/

#check Male     -- Male : SexAttribute
#check Female   -- Female : SexAttribute
#check True_    -- True_ : TruthValue
#check False_   -- False_ : TruthValue

/-! ## Type-Safe Examples with Organisms -/

-- For multi-level coercion, we can define helper functions or use the types directly
-- Using Organism directly in examples:

-- Organisms can have parents
example (child mom : Organism) : Prop := mother child mom

-- Organisms can be siblings
example (a b : Organism) : Prop := sibling a b

-- Parts of objects
example (a b : Object_) : Prop := part a b

-- Citizenship is typed: Human → Nation
#check citizen  -- citizen : Human → Nation → Prop
example (person : Human) (country : Nation) : Prop := citizen person country

/-! ## Geographic Hierarchy -/

-- Cities, Nations, GeographicAreas form a hierarchy
example (c : City) : GeopoliticalArea := c
example (n : Nation) : GeopoliticalArea := n
example (s : StateOrProvince) : GeopoliticalArea := s

#check internationalDispute  -- GeopoliticalArea → GeopoliticalArea → Prop

-- International relations work with nations
example (a b : Nation) : Prop := internationalDispute a b

/-! ## Organization Hierarchy -/

#check organizationRepresentative  -- AutonomousAgent → Organization → Prop
#check parentcompany               -- Organization → Organization → Prop

-- Organizations can have parent companies
example (subsidiary parent : Organization) : Prop := parentcompany subsidiary parent

/-! ## Axiom-Based Reasoning -/

-- We can define and prove theorems using the typed SUMO structure:

/-- If A is mother of B and B is mother of C, then A is grandmother of C -/
axiom grandmother : Organism → Organism → Prop
axiom grandmother_def : ∀ (a b c : Organism),
    mother b a → mother c b → grandmother c a

/-- Proof: given the chain, we derive grandmother -/
theorem grandmother_from_chain (a b c : Organism)
    (h1 : mother b a) (h2 : mother c b) : grandmother c a :=
  grandmother_def a b c h1 h2

/-- Siblings share a parent -/
axiom sibling_share_parent : ∀ (a b : Organism),
    sibling a b → ∃ p : Organism, parent a p ∧ parent b p

/-- Part relation is transitive -/
axiom part_transitive : ∀ (a b c : Object_),
    part a b → part b c → part a c

/-- Proof: transitivity of part -/
theorem part_chain (a b c : Object_)
    (hab : part a b) (hbc : part b c) : part a c :=
  part_transitive a b c hab hbc

/-! ## Compound Parent Expressions -/

-- SUMO has compound parent expressions like:
--   (subclass LeftArm (BodySideFn Left Arm))
--   (subclass Apple (FoodForFn Animal))
--
-- These are handled using rangeSubclass to infer the parent type:
--   (rangeSubclass BodySideFn BodyPart) → LeftArm : BodyPart
--   (rangeSubclass FoodForFn SelfConnectedObject) → uses FoodForFn's range

-- Body part laterality is typed correctly via rangeSubclass
#check @isLeftArm   -- isLeftArm : BodyPart → Prop
#check @isRightArm  -- isRightArm : BodyPart → Prop

-- Coercion to parent works
example (arm : LeftArm) : BodyPart := arm

/-! ## Summary

The full SUMO ontology provides:

1. **Deep Type Hierarchy**: 9,500+ classes organized in a 12+ level hierarchy
   - Human → Hominid → Primate → Mammal → ... → Entity

2. **Single-Step Coercions**: Each subtype coerces to its parent
   - `Human → Hominid`, `Hominid → Primate`, etc.

3. **Typed Relations**: 1,797 relations with proper domain types
   - `mother : Organism → Organism → Prop`
   - `citizen : Human → Nation → Prop`

4. **Typed Individuals**: 19,928 named constants
   - `Male : SexAttribute`
   - Geographic entities, organizations, etc.

5. **Type Safety**: Wrong types = compile-time errors
   - Can't make a `Building` the mother of a `Human`
   - Can't make a `Process` a citizen of a `Nation`

6. **Compound Parent Expressions**: Classes with function-application parents
   - `(subclass LeftArm (BodySideFn Left Arm))` uses `rangeSubclass`
   - Properly types LeftArm as a subtype of BodyPart

Note: For deep hierarchy traversal, use types directly at the correct level
or define transitive coercion helpers.
-/

end LeanSUMO.Examples.FullSUMODemo
