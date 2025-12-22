/-!
# LeanSUMO Core - HOL-Native Shallow Embedding

Benzmüller-style minimal semantic core.
No RelObj/Spine encoding machinery — just Lean HOL.
-/

set_option autoImplicit false

namespace LeanSUMO

universe u

/-! ## Semantic Core -/

-- Classes are predicates (sets of entities).
abbrev Class (Entity : Type u) : Type u := Entity → Prop

def instanceOf {Entity : Type u} (x : Entity) (C : Class Entity) : Prop := C x

def subclass {Entity : Type u} (C D : Class Entity) : Prop := ∀ x, C x → D x

def disjoint {Entity : Type u} (C D : Class Entity) : Prop := ∀ x, ¬(C x ∧ D x)

/-!
## Bridging Class ↔ Obj (for SUMO's untyped mix)

SUMO-KIF regularly uses *class-valued* expressions in term positions and
*term-valued* expressions in class positions (because the object language is
single-sorted). In a HOL-native Lean embedding where `Class` is `Entity → Prop`,
we make these coercions explicit.

These are intentionally left uninterpreted: they are a minimal “glue layer” to
keep the translation total without silently dropping content.
-/

axiom classObj {Entity : Type u} : Class Entity → Entity
axiom objClass {Entity : Type u} : Entity → Class Entity

/-! ## Variable Arity Support (@ROW) -/

abbrev Row (α : Type u) : Type u := List α

abbrev VarPred (Entity : Type u) : Type u := Row Entity → Prop

/-- Function symbols in the single-sorted object language, represented as row-application. -/
abbrev VarFn (Entity : Type u) : Type u := Row Entity → Entity

/-- Class-valued function symbols (e.g. `PowerSetFn`), represented as row-application. -/
abbrev ClassFn (Entity : Type u) : Type u := Row Entity → Class Entity

def subrelationVA {Entity : Type u} (R S : VarPred Entity) : Prop := ∀ row, R row → S row

/-!
### Bridging predicate/function symbols ↔ Obj

SUMO-KIF is single-sorted, so relation and function symbols are also legitimate *terms*
that can be classified by `instance`/`subclass` and passed as arguments (e.g. `capability … agent …`).

We keep predicates/functions as real HOL objects (`VarPred`/`VarFn`/`ClassFn`) for readability and
automation, but provide an explicit bridge when they must appear as ordinary `Entity` terms.
-/

axiom predObj {Entity : Type u} : VarPred Entity → Entity
axiom objPred {Entity : Type u} : Entity → VarPred Entity

axiom fnObj {Entity : Type u} : VarFn Entity → Entity
axiom objFn {Entity : Type u} : Entity → VarFn Entity

axiom classFnObj {Entity : Type u} : ClassFn Entity → Entity
axiom objClassFn {Entity : Type u} : Entity → ClassFn Entity

/-! ### Curried → row (VarPred) adapters -/

def va0 {α : Type u} (p : Prop) : VarPred α
  | [] => p
  | _ => False

def va1 {α : Type u} (R : α → Prop) : VarPred α
  | [x1] => R x1
  | _ => False

def va2 {α : Type u} (R : α → α → Prop) : VarPred α
  | [x1, x2] => R x1 x2
  | _ => False

def va3 {α : Type u} (R : α → α → α → Prop) : VarPred α
  | [x1, x2, x3] => R x1 x2 x3
  | _ => False

def va4 {α : Type u} (R : α → α → α → α → Prop) : VarPred α
  | [x1, x2, x3, x4] => R x1 x2 x3 x4
  | _ => False

def va5 {α : Type u} (R : α → α → α → α → α → Prop) : VarPred α
  | [x1, x2, x3, x4, x5] => R x1 x2 x3 x4 x5
  | _ => False

def va6 {α : Type u} (R : α → α → α → α → α → α → Prop) : VarPred α
  | [x1, x2, x3, x4, x5, x6] => R x1 x2 x3 x4 x5 x6
  | _ => False

/-! ## Class Comprehension (KappaFn) -/

-- In a shallow embedding, κ-binders are just set comprehension.
def kappa {Entity : Type u} (φ : Entity → Prop) : Class Entity := φ

/-! ## Class-level Decomposition Predicates -/

-- Partition: parent is exactly the union of pairwise-disjoint children.
def partition {Entity : Type u} (parent : Class Entity) (children : List (Class Entity)) : Prop :=
  (∀ x, parent x → ∃ C ∈ children, C x) ∧
  (∀ C ∈ children, subclass C parent) ∧
  (∀ C₁ ∈ children, ∀ C₂ ∈ children, C₁ ≠ C₂ → disjoint C₁ C₂)

def exhaustiveDecomposition {Entity : Type u} (parent : Class Entity) (children : List (Class Entity)) : Prop :=
  (∀ x, parent x → ∃ C ∈ children, C x) ∧
  (∀ C ∈ children, subclass C parent)

def disjointDecomposition {Entity : Type u} (parent : Class Entity) (children : List (Class Entity)) : Prop :=
  (∀ C ∈ children, subclass C parent) ∧
  (∀ C₁ ∈ children, ∀ C₂ ∈ children, C₁ ≠ C₂ → disjoint C₁ C₂)

/-! ### Var-arity views of the decomposition predicates -/

-- In SUMO-KIF, variable-arity decomposition predicates take *terms denoting classes*
-- (single-sorted). We therefore model their `@ROW` spines as `Row Entity` and interpret
-- each element via `objClass`.
def partitionVA {Entity : Type u} (row : Row Entity) : Prop :=
  match row with
  | [] => False
  | parent :: children => partition (objClass parent) (children.map objClass)

def exhaustiveDecompositionVA {Entity : Type u} (row : Row Entity) : Prop :=
  match row with
  | [] => False
  | parent :: children => exhaustiveDecomposition (objClass parent) (children.map objClass)

def disjointDecompositionVA {Entity : Type u} (row : Row Entity) : Prop :=
  match row with
  | [] => False
  | parent :: children => disjointDecomposition (objClass parent) (children.map objClass)

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
