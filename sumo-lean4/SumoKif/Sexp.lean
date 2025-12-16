import Lean

set_option autoImplicit false

namespace SumoKif

inductive Atom : Type
  | sym (name : String)
  | str (value : String)
  deriving Inhabited, Repr

inductive Sexp : Type
  | atom (a : Atom)
  | list (xs : List Sexp)
  deriving Inhabited, Repr

def Atom.render : Atom → String
  | .sym s => s
  | .str s => "\"" ++ s ++ "\""

partial def Sexp.render : Sexp → String
  | .atom a => Atom.render a
  | .list xs => "(" ++ String.intercalate " " (xs.map Sexp.render) ++ ")"

def Sexp.asSym? : Sexp → Option String
  | .atom (.sym s) => some s
  | _ => none

def Sexp.asStr? : Sexp → Option String
  | .atom (.str s) => some s
  | _ => none

def Sexp.asAtom? : Sexp → Option Atom
  | .atom a => some a
  | _ => none

end SumoKif
