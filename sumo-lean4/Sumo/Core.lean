namespace Sumo

axiom Obj : Type

axiom ap : Obj → List Obj → Obj

axiom Holds : Obj → Prop

axiom numLit : String → Obj
axiom strLit : String → Obj

axiom mkAnd : List Obj → Obj
axiom mkOr : List Obj → Obj
axiom mkNot : Obj → Obj
axiom mkImp : Obj → Obj → Obj
axiom mkIff : Obj → Obj → Obj

axiom mkForall : (Obj → Obj) → Obj
axiom mkExists : (Obj → Obj) → Obj
axiom mkForallRow : (List Obj → Obj) → Obj
axiom mkExistsRow : (List Obj → Obj) → Obj

end Sumo

