import Sumo.Theory
import Sumo.MergeTheory

set_option autoImplicit false

namespace Sumo

namespace MergeKB

noncomputable section

def axioms : List Obj := MergeTheory.axioms

def HoldsAxioms : Prop := HoldsAll axioms

end

end MergeKB

end Sumo

