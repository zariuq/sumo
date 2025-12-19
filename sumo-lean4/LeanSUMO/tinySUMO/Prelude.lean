import LeanSUMO.tinySUMO.Core

/-!
# tinySUMO Prelude - Concrete Classes and Predicates

Fixed Entity type with concrete constants.
After importing, you can use `Human`, `agent`, etc. directly!
-/

set_option autoImplicit false

namespace LeanSUMO.TinySUMO

open LeanSUMO

/-! ## The Entity Type -/

-- Entity is a fixed opaque type (not a parameter)
opaque Entity : Type

-- Axiom: The universe has at least one entity
axiom entity_nonempty : Nonempty Entity

-- Derive Inhabited from Nonempty (needed for other opaques)
noncomputable instance : Inhabited Entity := Classical.inhabited_of_nonempty entity_nonempty

-- Abbreviations for readability (Entity is now implicit in the core defs)
abbrev Class := LeanSUMO.Class Entity
abbrev instanceOf := @LeanSUMO.instanceOf Entity
abbrev subclass := @LeanSUMO.subclass Entity
abbrev disjoint := @LeanSUMO.disjoint Entity

/-! ## Top-Level Classes -/

def Entity_top : Class := fun _ => True

opaque Physical : Class
opaque Abstract : Class
opaque Relation : Class

-- Physical hierarchy
opaque Process : Class
opaque Object : Class
opaque Region : Class

-- Object hierarchy
opaque SelfConnectedObject : Class
opaque AutonomousAgent : Class
opaque Substance : Class

-- AutonomousAgent hierarchy
opaque Organism : Class
opaque Human : Class
opaque Animal : Class
opaque Plant : Class
opaque Fungus : Class
opaque Microorganism : Class

-- Process hierarchy
opaque ChemicalProcess : Class

-- Abstract hierarchy
opaque Attribute : Class
opaque Quantity : Class
opaque RealNumber : Class
opaque Integer : Class
opaque PositiveInteger : Class
opaque NonnegativeInteger : Class
opaque NonnegativeRealNumber : Class

/-! ## Named Individuals -/

-- These require noncomputable because Entity's Inhabited is noncomputable
noncomputable section

opaque AbrahamLincoln : Entity
opaque ChemicalEquilibrium : Entity
opaque Right : Entity
opaque Left : Entity
opaque Male : Entity
opaque Female : Entity
opaque n0 : Entity
opaque n1 : Entity
opaque neg1 : Entity

/-! ## Functions -/

opaque AdditionFn : Entity → Entity → Entity
opaque AbsoluteValueFn : Entity → Entity
opaque ListOrderFn : Entity → Entity → Entity
opaque ListLengthFn : Entity → Entity
opaque FirstFn : Entity → Entity
opaque LastFn : Entity → Entity

end -- noncomputable section

/-! ## Binary Predicates -/

opaque agent : Entity → Entity → Prop
opaque patient : Entity → Entity → Prop
opaque experiencer : Entity → Entity → Prop
opaque instrument : Entity → Entity → Prop
opaque origin : Entity → Entity → Prop
opaque destination : Entity → Entity → Prop
opaque part : Entity → Entity → Prop
opaque piece : Entity → Entity → Prop
opaque located : Entity → Entity → Prop
opaque earlier : Entity → Entity → Prop
opaque hasAttribute : Entity → Entity → Prop
opaque property : Entity → Entity → Prop
opaque mother : Entity → Entity → Prop
opaque greaterThan : Entity → Entity → Prop
opaque inList : Entity → Entity → Prop
opaque orientation : Entity → Entity → Entity → Prop

/-! ## Variable-Arity -/

opaque contraryAttribute : List Entity → Prop

end LeanSUMO.TinySUMO
