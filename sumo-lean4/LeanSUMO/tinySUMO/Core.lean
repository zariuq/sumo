/-!
# LeanSUMO Core - HOL-Native Shallow Embedding

Benzmüller-style minimal semantic core.
No RelObj, no Spine, no encoding machinery.
Just pure Lean HOL.
-/

set_option autoImplicit false

namespace LeanSUMO

universe u

/-! ## Semantic Core -/

-- The universe of discourse (parameter, implicit where possible)
variable (Entity : Type u)

-- Classes are predicates (sets of entities)
abbrev Class := Entity → Prop

-- Core ontological relations with ACTUAL SEMANTICS
-- Entity is implicit in these definitions for cleaner proof explorer output
def instanceOf {Entity : Type u} (x : Entity) (C : Class Entity) : Prop := C x

def subclass {Entity : Type u} (C D : Class Entity) : Prop := ∀ x, C x → D x

def disjoint {Entity : Type u} (C D : Class Entity) : Prop := ∀ x, ¬(C x ∧ D x)

/-! ## Variable Arity Support (minimal, for @ROW axioms) -/

-- Row type for variable-arity predicates
abbrev Row := List Entity

-- Variable-arity predicate type (for HO axioms only)
abbrev VarPred := Row Entity → Prop

-- Subrelation for variable-arity predicates
def subrelationVA {Entity : Type u} (R S : VarPred Entity) : Prop := ∀ row, R row → S row

/-! ## Class-level operations -/

-- Partition: parent is exactly the union of disjoint children
def partition {Entity : Type u} (parent : Class Entity) (children : List (Class Entity)) : Prop :=
  -- Exhaustive: every parent instance is in some child
  (∀ x, parent x → ∃ C ∈ children, C x) ∧
  -- Covering: every child is subclass of parent
  (∀ C ∈ children, subclass C parent) ∧
  -- Pairwise disjoint
  (∀ C₁ ∈ children, ∀ C₂ ∈ children, C₁ ≠ C₂ → disjoint C₁ C₂)

def exhaustiveDecomposition {Entity : Type u} (parent : Class Entity) (children : List (Class Entity)) : Prop :=
  (∀ x, parent x → ∃ C ∈ children, C x) ∧
  (∀ C ∈ children, subclass C parent)

def disjointDecomposition {Entity : Type u} (parent : Class Entity) (children : List (Class Entity)) : Prop :=
  (∀ C ∈ children, subclass C parent) ∧
  (∀ C₁ ∈ children, ∀ C₂ ∈ children, C₁ ≠ C₂ → disjoint C₁ C₂)

/-! ## Key Theorems (automatic from definitions) -/

theorem subclass_refl {Entity : Type u} (C : Class Entity) : subclass C C :=
  fun _ h => h

theorem subclass_trans {Entity : Type u} (A B C : Class Entity)
    (h1 : subclass A B) (h2 : subclass B C) :
    subclass A C :=
  fun x hx => h2 x (h1 x hx)

theorem instance_subclass {Entity : Type u} (x : Entity) (C D : Class Entity)
    (hInst : instanceOf x C) (hSub : subclass C D) :
    instanceOf x D :=
  hSub x hInst

theorem disjoint_symm {Entity : Type u} (C D : Class Entity)
    (h : disjoint C D) : disjoint D C :=
  fun x ⟨hd, hc⟩ => h x ⟨hc, hd⟩

theorem partition_implies_exhaustive {Entity : Type u} (parent : Class Entity) (children : List (Class Entity))
    (h : partition parent children) :
    exhaustiveDecomposition parent children :=
  ⟨h.1, h.2.1⟩

theorem partition_implies_disjoint {Entity : Type u} (parent : Class Entity) (children : List (Class Entity))
    (h : partition parent children) :
    disjointDecomposition parent children :=
  ⟨h.2.1, h.2.2⟩

end LeanSUMO
