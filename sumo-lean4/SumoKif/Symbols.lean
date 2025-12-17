import Std.Data.HashSet
import SumoKif.Sexp

set_option autoImplicit false

namespace SumoKif

def isVarLike (s : String) : Bool :=
  s.startsWith "?" || s.startsWith "@"

def isKifLogicalKeyword (s : String) : Bool :=
  s = "and" || s = "or" || s = "not" || s = "forall" || s = "exists" || s = "=>" || s = "<=>"

def isNumericToken (s : String) : Bool :=
  match s.toInt? with
  | some _ => true
  | none =>
      if s.contains '.' then
        -- very small heuristic: accept +/- plus digits and at most one dot (rejects e.g. CO2)
        let isNumChar (c : Char) : Bool :=
          c.isDigit || c = '+' || c = '-' || c = '.'
        s.all isNumChar && s.any (fun c => c.isDigit)
      else
        false

def isConstSymbol (s : String) : Bool :=
  !isVarLike s && !isKifLogicalKeyword s && !isNumericToken s

partial def collectConstSymbols (sexp : Sexp) (acc : Std.HashSet String := {}) : Std.HashSet String :=
  match sexp with
  | .atom (.sym s) =>
      if isConstSymbol s then acc.insert s else acc
  | .atom (.str _) => acc
  | .list xs => xs.foldl (fun a x => collectConstSymbols x a) acc

end SumoKif

