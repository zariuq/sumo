import LeanSUMO.tinySUMO.Prelude

/-!
# tinySUMO Axioms - Directly Usable!

After importing: `human_subclass_autonomousAgent` is ready to use.
No bundling required!
-/

set_option autoImplicit false

namespace LeanSUMO.TinySUMO

open LeanSUMO

/-! ## Class Hierarchy Axioms -/

axiom physical_subclass_entity : subclass Physical Entity_top
axiom abstract_subclass_entity : subclass Abstract Entity_top
axiom process_subclass_physical : subclass Process Physical
axiom object_subclass_physical : subclass Object Physical
axiom autonomousAgent_subclass_object : subclass AutonomousAgent Object
axiom organism_subclass_autonomousAgent : subclass Organism AutonomousAgent
axiom human_subclass_autonomousAgent : subclass Human AutonomousAgent
axiom animal_subclass_organism : subclass Animal Organism
axiom plant_subclass_organism : subclass Plant Organism
axiom fungus_subclass_organism : subclass Fungus Organism
axiom microorganism_subclass_organism : subclass Microorganism Organism
axiom chemicalProcess_subclass_process : subclass ChemicalProcess Process
axiom attribute_subclass_abstract : subclass Attribute Abstract
axiom quantity_subclass_abstract : subclass Quantity Abstract
axiom realNumber_subclass_quantity : subclass RealNumber Quantity

axiom physical_abstract_disjoint : disjoint Physical Abstract
axiom object_process_disjoint : disjoint Object Process

/-! ## Organism Partition -/

axiom organism_partition : LeanSUMO.partition Organism [Animal, Plant, Fungus, Microorganism]

-- Distinctness axioms for partition members (needed for disjointness proofs)
axiom animal_ne_plant : Animal ≠ Plant
axiom animal_ne_fungus : Animal ≠ Fungus
axiom animal_ne_microorganism : Animal ≠ Microorganism
axiom plant_ne_fungus : Plant ≠ Fungus
axiom plant_ne_microorganism : Plant ≠ Microorganism
axiom fungus_ne_microorganism : Fungus ≠ Microorganism

-- Distinctness for contrary attributes
axiom male_ne_female : Male ≠ Female

/-! ## Instance Axioms -/

axiom lincoln_is_human : instanceOf AbrahamLincoln Human
axiom male_is_attribute : instanceOf Male Attribute
axiom female_is_attribute : instanceOf Female Attribute

/-! ## Domain Constraint Axioms -/

axiom agent_domain1 : ∀ p a, agent p a → instanceOf p Process
axiom agent_domain2 : ∀ p a, agent p a → instanceOf a AutonomousAgent

axiom patient_domain1 : ∀ p o, patient p o → instanceOf p Process
axiom patient_domain2 : ∀ p o, patient p o → instanceOf o Object

axiom part_domain1 : ∀ x y, part x y → instanceOf x Object
axiom part_domain2 : ∀ x y, part x y → instanceOf y Object

axiom located_domain1 : ∀ x y, located x y → instanceOf x Physical
axiom located_domain2 : ∀ x y, located x y → instanceOf y Physical

axiom hasAttribute_domain2 : ∀ x a, hasAttribute x a → instanceOf a Attribute

/-! ## Relation Axioms -/

axiom piece_subrelation_part : ∀ x y, piece x y → part x y
axiom part_transitive : ∀ x y z, part x y → part y z → part x z
axiom earlier_transitive : ∀ x y z, earlier x y → earlier y z → earlier x z

axiom chemicalEquilibrium_implies_chemicalProcess :
  ∀ p, property p ChemicalEquilibrium → instanceOf p ChemicalProcess

axiom mother_implies_female :
  ∀ child mom, mother child mom → hasAttribute mom Female

axiom male_female_contrary : contraryAttribute [Male, Female]

-- Semantics of contraryAttribute: no entity can have two contrary attributes
-- This is the HO axiom schema that makes contraryAttribute useful
axiom contraryAttribute_pairwise_exclusive :
  ∀ attrs : List Entity, contraryAttribute attrs →
    ∀ a₁ ∈ attrs, ∀ a₂ ∈ attrs, a₁ ≠ a₂ →
      ∀ x, ¬(hasAttribute x a₁ ∧ hasAttribute x a₂)

axiom orientation_right_left : ∀ obj1 obj2,
  orientation obj1 obj2 Right ↔ orientation obj2 obj1 Left

/-! ## Numeric Axioms -/

axiom positiveInteger_greater_zero :
  ∀ x, instanceOf x PositiveInteger → greaterThan x n0

axiom absoluteValue_nonnegative :
  ∀ x, instanceOf x RealNumber → instanceOf (AbsoluteValueFn x) NonnegativeRealNumber

/-! ## List Axioms -/

axiom inList_exists_index :
  ∀ item list, inList item list → ∃ n, (ListOrderFn list n) = item

axiom singleton_list :
  ∀ l, FirstFn l = LastFn l → (ListLengthFn l) = n1

end LeanSUMO.TinySUMO
