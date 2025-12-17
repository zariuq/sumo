import Sumo.Logic

set_option autoImplicit false

namespace Sumo

noncomputable section

def trueObj : Obj := mkAnd []
def falseObj : Obj := mkNot trueObj

def HoldsAll (T : List Obj) : Prop :=
  ∀ φ, φ ∈ T → Holds φ

def Entails (T : List Obj) (φ : Obj) : Prop :=
  HoldsAll T → Holds φ

def Inconsistent (T : List Obj) : Prop :=
  Entails T falseObj

theorem holds_trueObj : Holds trueObj := by
  simp [trueObj]

theorem not_holds_falseObj : ¬ Holds falseObj := by
  simp [falseObj, trueObj]

end

end Sumo
