import Std
import SumoKif.Signature

set_option autoImplicit false

namespace SumoKif

def asQuotedIdent (s : String) : String :=
  if s.contains '»' then
    -- extremely defensive; SUMO symbols should not contain this
    "«" ++ (s.replace "»" "_") ++ "»"
  else
    "«" ++ s ++ "»"

def renderConstDecl (sym : String) : String :=
  "axiom " ++ asQuotedIdent sym ++ " : Obj"

def renderAppDefFixed (sym : String) (n : Nat) : String :=
  if n = 0 then
    ""
  else
    let args := (List.range n).map (fun i => s!"x{i+1}")
    let binder := String.intercalate " " (args.map (fun a => s!"({a} : Obj)"))
    let list := "[" ++ String.intercalate ", " args ++ "]"
    s!"def {asQuotedIdent sym} {binder} : Obj := ap Const.{asQuotedIdent sym} {list}"

def renderAppDefVariadic (sym : String) : String :=
  s!"def {asQuotedIdent sym} (xs : List Obj) : Obj := ap Const.{asQuotedIdent sym} xs"

def renderSignatureLean (syms : Array String) (sig : Signature) : String :=
  let symsSorted := syms.qsort (fun a b => a < b)
  let decls := String.intercalate "\n" (symsSorted.toList.map renderConstDecl)
  let appLines : Array String :=
    (sig.symArity.toList.map (fun (s, a) =>
      match a with
      | .fixed n => renderAppDefFixed s n
      | .variadic => renderAppDefVariadic s)).toArray
  let appLines := appLines.filter (fun line => line != "")
  let appLines := appLines.qsort (fun a b => a < b)
  let apps := String.intercalate "\n" appLines.toList
  String.intercalate "\n\n"
    [ "import Sumo.Core"
    , "namespace Sumo"
    , "namespace Const"
    , decls
    , "end Const"
    , "noncomputable section"
    , apps
    , "end"
    , "end Sumo"
    ]

end SumoKif
