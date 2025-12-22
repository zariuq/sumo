import LeanSUMO.tinySUMO.Axioms

/-!
# Proof Explorer Demo - Open in VS Code!

Hover over the #check lines to see what the proof explorer shows.
This demonstrates the current LeanSUMO architecture.
-/

open LeanSUMO.TinySUMO

/-! ## Core Type Signatures - Hover to see! -/

-- Classes show as predicates (Entity → Prop)
#check Human           -- Hover: Human : Class  (which is Entity → Prop)
#check Animal
#check Physical

-- instanceOf distinguishes Entity from Class
#check instanceOf      -- Hover: Entity → Class → Prop  (useful!)
#check subclass        -- Hover: Class → Class → Prop   (useful!)
#check disjoint        -- Hover: Class → Class → Prop

-- Relations show Entity → Entity → Prop
#check agent           -- Hover: Entity → Entity → Prop
#check part

/-! ## Axiom Signatures - Hover to see the full statement! -/

-- Subclass axioms show the actual classes involved
#check human_subclass_autonomousAgent
-- Hover shows: subclass Human AutonomousAgent
-- Expands to: ∀ x, Human x → AutonomousAgent x

#check object_subclass_physical
-- Hover shows: subclass Object Physical

-- Domain axioms show meaningful structure
#check agent_domain2
-- Hover shows: ∀ p a, agent p a → instanceOf a AutonomousAgent

-- Partition axioms (variable arity!)
#check organism_partition
-- Hover shows: partition Organism [Animal, Plant, Fungus, Microorganism]

/-! ## Proofs - Hover over terms to see types! -/

-- Simple proof - hover over each step
example (x : Entity) (h : instanceOf x Human) : instanceOf x AutonomousAgent := by
  -- Hover over 'human_subclass_autonomousAgent' to see its type
  exact LeanSUMO.instance_subclass x Human AutonomousAgent h human_subclass_autonomousAgent

-- Chain of subclass reasoning
theorem human_is_physical (x : Entity) (h : instanceOf x Human) : instanceOf x Physical := by
  have h1 : instanceOf x AutonomousAgent :=
    LeanSUMO.instance_subclass x Human AutonomousAgent h human_subclass_autonomousAgent
  have h2 : instanceOf x Object :=
    LeanSUMO.instance_subclass x AutonomousAgent Object h1 autonomousAgent_subclass_object
  exact LeanSUMO.instance_subclass x Object Physical h2 object_subclass_physical

/-! ## The Meta-SUMO Edge Case

SUMO allows statements like:
  (instance Human Class)     -- Human is itself a class!
  (subclass Class Abstract)  -- Class is a subclass of Abstract

This is "untyped mixing" - a class used as an object.

Current approach in tinySUMO: We just don't model this yet.
But LeanSUMO.Core has classObj/objClass for this:
-/

-- In LeanSUMO.Core (not tinySUMO), we have:
-- axiom classObj : Class Entity → Entity
-- axiom objClass : Entity → Class Entity

-- This would let us write:
-- axiom Class_ : Class Entity              -- The meta-class
-- axiom Human_is_class : instanceOf (classObj Human) Class_

-- But this makes types messier. Alternative approaches:
-- 1. Keep meta-level separate (tinySUMO style)
-- 2. Use universe polymorphism
-- 3. Accept the classObj wrapper for rare meta-cases

/-! ## What the Proof Explorer Shows

GOOD (current approach):
  instanceOf : Entity → Class → Prop     -- Clear distinction!
  subclass : Class → Class → Prop        -- Operating on classes!
  Human : Class                          -- Human is a class!

BAD (if we made everything Obj):
  instanceOf : Obj → Obj → Prop          -- What's the difference?
  subclass : Obj → Obj → Prop            -- All just Obj...
  Human : Obj                            -- Is this a class? An entity? Who knows!
-/
