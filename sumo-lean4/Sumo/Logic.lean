import Sumo.Core

set_option autoImplicit false

namespace Sumo

/-!
Minimal semantics for the SUO-KIF object-level logical constructors.

This is intentionally interpretation-agnostic about *non-logical* symbols (predicates/functions),
and makes no commitments about `equal` beyond whatever SUMO axioms state about it.
-/

axiom holds_mkAnd (xs : List Obj) :
    Holds (mkAnd xs) ↔ ∀ φ, φ ∈ xs → Holds φ

axiom holds_mkOr (xs : List Obj) :
    Holds (mkOr xs) ↔ ∃ φ, φ ∈ xs ∧ Holds φ

axiom holds_mkNot (φ : Obj) :
    Holds (mkNot φ) ↔ ¬ Holds φ

axiom holds_mkImp (φ ψ : Obj) :
    Holds (mkImp φ ψ) ↔ (Holds φ → Holds ψ)

axiom holds_mkIff (φ ψ : Obj) :
    Holds (mkIff φ ψ) ↔ (Holds φ ↔ Holds ψ)

axiom holds_mkForall (f : Obj → Obj) :
    Holds (mkForall f) ↔ ∀ x : Obj, Holds (f x)

axiom holds_mkExists (f : Obj → Obj) :
    Holds (mkExists f) ↔ ∃ x : Obj, Holds (f x)

axiom holds_mkForallRow (f : List Obj → Obj) :
    Holds (mkForallRow f) ↔ ∀ xs : List Obj, Holds (f xs)

axiom holds_mkExistsRow (f : List Obj → Obj) :
    Holds (mkExistsRow f) ↔ ∃ xs : List Obj, Holds (f xs)

attribute [simp]
  holds_mkAnd
  holds_mkOr
  holds_mkNot
  holds_mkImp
  holds_mkIff
  holds_mkForall
  holds_mkExists
  holds_mkForallRow
  holds_mkExistsRow

end Sumo

