import LeanSUMO.tinySUMO.Axioms

/-!
# tinySUMO Examples - Direct Use of Axioms

No bundling required! After importing Axioms, you can directly use:
- Classes: `Human`, `Physical`, `AutonomousAgent`, etc.
- Axioms: `human_subclass_autonomousAgent`, `lincoln_is_human`, etc.
- Core theorems: `subclass_trans`, `instance_subclass`, etc.
-/

set_option autoImplicit false

namespace LeanSUMO.TinySUMO.Examples

open LeanSUMO
open LeanSUMO.TinySUMO

/-! ## Subclass Chain Proofs - Using Axioms Directly -/

/-- Human is a subclass of Object (via AutonomousAgent) -/
theorem human_subclass_object : subclass Human Object :=
  subclass_trans Human AutonomousAgent Object
    human_subclass_autonomousAgent autonomousAgent_subclass_object

/-- Human is a subclass of Physical (via Object) -/
theorem human_subclass_physical : subclass Human Physical :=
  subclass_trans Human Object Physical
    human_subclass_object object_subclass_physical

/-! ## Instance Propagation -/

/-- Abraham Lincoln is Physical! -/
theorem lincoln_is_physical : instanceOf AbrahamLincoln Physical :=
  instance_subclass AbrahamLincoln Human Physical
    lincoln_is_human human_subclass_physical

/-- Abraham Lincoln is an Object -/
theorem lincoln_is_object : instanceOf AbrahamLincoln Object :=
  instance_subclass AbrahamLincoln Human Object
    lincoln_is_human human_subclass_object

/-- Abraham Lincoln is an AutonomousAgent -/
theorem lincoln_is_autonomous : instanceOf AbrahamLincoln AutonomousAgent :=
  instance_subclass AbrahamLincoln Human AutonomousAgent
    lincoln_is_human human_subclass_autonomousAgent

/-! ## Animal Hierarchy -/

/-- Animal is a subclass of AutonomousAgent (via Organism) -/
theorem animal_subclass_autonomous : subclass Animal AutonomousAgent :=
  subclass_trans Animal Organism AutonomousAgent
    animal_subclass_organism organism_subclass_autonomousAgent

/-- Animal is a subclass of Object -/
theorem animal_subclass_object : subclass Animal Object :=
  subclass_trans Animal AutonomousAgent Object
    animal_subclass_autonomous autonomousAgent_subclass_object

/-- Animal is a subclass of Physical -/
theorem animal_subclass_physical : subclass Animal Physical :=
  subclass_trans Animal Object Physical
    animal_subclass_object object_subclass_physical

/-! ## Relation Axioms - Beyond Subclass! -/

/-- If x is a piece of y, then x is part of y -/
theorem piece_is_part (x y : Entity) (h : piece x y) : part x y :=
  piece_subrelation_part x y h

/-- Mothers have the Female attribute -/
theorem mothers_are_female (child mom : Entity) (h : mother child mom) : hasAttribute mom Female :=
  mother_implies_female child mom h

/-! ## Domain Constraints -/

/-- Any agent of a process must be an AutonomousAgent -/
theorem agent_must_be_autonomous (p a : Entity) (h : agent p a) : instanceOf a AutonomousAgent :=
  agent_domain2 p a h

/-- If something is an agent of something, that something is a Process -/
theorem agent_action_is_process (p a : Entity) (h : agent p a) : instanceOf p Process :=
  agent_domain1 p a h

/-! ## Disjointness Proofs -/

/-- Human is disjoint from Abstract (Human ⊆ Physical, Physical ∩ Abstract = ∅) -/
theorem human_disjoint_abstract : disjoint Human Abstract := by
  intro x ⟨hHuman, hAbstract⟩
  have hPhysical : Physical x := human_subclass_physical x hHuman
  exact physical_abstract_disjoint x ⟨hPhysical, hAbstract⟩

/-- No entity can be both Human and Abstract -/
theorem no_abstract_humans (x : Entity) : ¬(instanceOf x Human ∧ instanceOf x Abstract) :=
  human_disjoint_abstract x

/-- Object and Process are disjoint -/
theorem object_process_disjoint_example (x : Entity) : ¬(instanceOf x Object ∧ instanceOf x Process) :=
  object_process_disjoint x

/-! ## Transitive Relations -/

/-- Part is transitive -/
example (x y z : Entity) (h1 : part x y) (h2 : part y z) : part x z :=
  part_transitive x y z h1 h2

/-- Earlier is transitive -/
example (x y z : Entity) (h1 : earlier x y) (h2 : earlier y z) : earlier x z :=
  earlier_transitive x y z h1 h2

/-! ## Orientation Symmetry -/

/-- Right and Left are symmetric orientations -/
example (obj1 obj2 : Entity) : orientation obj1 obj2 Right ↔ orientation obj2 obj1 Left :=
  orientation_right_left obj1 obj2

/-! ## Complex Inference: Combining Multiple Axioms -/

/-- Any agent (of any process) is Physical.
    Proof chain: agent → AutonomousAgent → Object → Physical -/
theorem agent_is_physical (p a : Entity) (h : agent p a) : instanceOf a Physical := by
  have h1 : instanceOf a AutonomousAgent := agent_domain2 p a h
  have h2 : subclass AutonomousAgent Object := autonomousAgent_subclass_object
  have h3 : instanceOf a Object := instance_subclass a AutonomousAgent Object h1 h2
  have h4 : subclass Object Physical := object_subclass_physical
  exact instance_subclass a Object Physical h3 h4

/-- Organisms partition proof: If x is an Animal, x is an Organism -/
theorem animal_is_organism (x : Entity) (h : instanceOf x Animal) : instanceOf x Organism :=
  instance_subclass x Animal Organism h animal_subclass_organism

/-! ## Higher-Order / Variable-Arity Examples (@ROW) -/

/-! ### Partition Examples

The partition axiom uses a List of classes - this is the HO/Row pattern!
`partition Organism [Animal, Plant, Fungus, Microorganism]` means:
1. Every Organism is exactly one of: Animal, Plant, Fungus, or Microorganism
2. These four classes are pairwise disjoint
3. Each is a subclass of Organism
-/

/-- From partition: Animal is a subclass of Organism -/
theorem partition_animal_sub_organism : subclass Animal Organism :=
  organism_partition.2.1 Animal (List.Mem.head _)

/-- From partition: Plant is a subclass of Organism -/
theorem partition_plant_sub_organism : subclass Plant Organism :=
  organism_partition.2.1 Plant (List.Mem.tail _ (List.Mem.head _))

/-- From partition: Fungus is a subclass of Organism -/
theorem partition_fungus_sub_organism : subclass Fungus Organism :=
  organism_partition.2.1 Fungus (List.Mem.tail _ (List.Mem.tail _ (List.Mem.head _)))

/-- From partition: Animal and Plant are disjoint -/
theorem animal_plant_disjoint : disjoint Animal Plant := by
  have h := organism_partition.2.2 Animal (List.Mem.head _)
              Plant (List.Mem.tail _ (List.Mem.head _))
  exact h animal_ne_plant

/-- From partition: Every Organism is one of the four kinds -/
theorem organism_exhaustive (x : Entity) (h : Organism x) :
    Animal x ∨ Plant x ∨ Fungus x ∨ Microorganism x := by
  obtain ⟨C, hMem, hCx⟩ := organism_partition.1 x h
  -- C is one of [Animal, Plant, Fungus, Microorganism]
  simp only [List.mem_cons] at hMem
  rcases hMem with rfl | rfl | rfl | rfl | hEmpty
  · left; exact hCx
  · right; left; exact hCx
  · right; right; left; exact hCx
  · right; right; right; exact hCx
  · exact absurd hEmpty List.not_mem_nil

/-! ### ContraryAttribute Examples

`contraryAttribute [Male, Female]` is the HO pattern for mutually exclusive attributes.
Combined with the semantic axiom, we can prove no entity is both Male and Female.

Note: In SUMO, Male and Female refer to biological sex categories. Gender identity
and social aspects of gender are modeled separately in the ontology and involve
additional concepts beyond this simple biological distinction.
-/

/-- Male and Female are contrary biological sex attributes - no entity can have both -/
theorem male_female_exclusive (x : Entity) :
    ¬(hasAttribute x Male ∧ hasAttribute x Female) := by
  have hContrary := male_female_contrary
  have hExcl := contraryAttribute_pairwise_exclusive [Male, Female] hContrary
  have hMaleIn : Male ∈ [Male, Female] := List.Mem.head _
  have hFemaleIn : Female ∈ [Male, Female] := List.Mem.tail _ (List.Mem.head _)
  exact hExcl Male hMaleIn Female hFemaleIn male_ne_female x

/-- A mother cannot have the Male attribute (combining mother_implies_female with contrary) -/
theorem mother_not_male (child mom : Entity) (h : mother child mom) :
    ¬(hasAttribute mom Male) := by
  intro hMale
  have hFemale := mother_implies_female child mom h
  have hContra := male_female_exclusive mom
  exact hContra ⟨hMale, hFemale⟩

/-! ### Variable-Arity Subrelation (VarPred)

The Core module provides `VarPred Entity := List Entity → Prop` and
`subrelationVA` for relations that take variable-length argument lists.
-/

-- Example: Define a variable-arity predicate that holds for any list of Organisms
def allOrganisms : LeanSUMO.VarPred Entity := fun row =>
  ∀ x ∈ row, Organism x

-- Example: Define a more specific predicate for lists of Animals
def allAnimals : LeanSUMO.VarPred Entity := fun row =>
  ∀ x ∈ row, Animal x

/-- allAnimals is a subrelation of allOrganisms (HO reasoning over VarPreds!) -/
theorem allAnimals_sub_allOrganisms : LeanSUMO.subrelationVA allAnimals allOrganisms := by
  intro row hAnimals x hMem
  have hAnimal : Animal x := hAnimals x hMem
  exact animal_subclass_organism x hAnimal

end LeanSUMO.TinySUMO.Examples
