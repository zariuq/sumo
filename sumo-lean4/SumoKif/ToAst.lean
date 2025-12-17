import Sumo.Ast
import SumoKif.Sexp
import SumoKif.Symbols
import SumoKif.ExportAxioms

set_option autoImplicit false

namespace SumoKif

open Sumo.Ast

def toVar (s : String) : Var :=
  if s.startsWith "@" then
    rowVar s
  else
    termVar s

mutual

  partial def toAstExpr : Sexp → Expr
    | .atom (.str v) => .str v
    | .atom (.sym s) =>
        if isNumericToken s then
          .num s
        else if s.startsWith "?" || s.startsWith "@" then
          .var (toVar s)
        else
          .sym s
    | .list xs =>
        match xs with
        | [] => .and_ []
        | head :: args =>
            match head.asSym? with
            | some "and" => .and_ (args.map toAstExpr)
            | some "or" => .or_ (args.map toAstExpr)
            | some "not" =>
                match args with
                | [φ] => .not_ (toAstExpr φ)
                | _ => toAstApp head args
            | some "=>" =>
                match args with
                | [φ, ψ] => .imp (toAstExpr φ) (toAstExpr ψ)
                | _ => toAstApp head args
            | some "<=>" =>
                match args with
                | [φ, ψ] => .iff (toAstExpr φ) (toAstExpr ψ)
                | _ => toAstApp head args
            | some "forall" =>
                match args with
                | binder :: body :: _ => toAstQuant .forall_ binder body
                | _ => toAstApp head args
            | some "exists" =>
                match args with
                | binder :: body :: _ => toAstQuant .exists_ binder body
                | _ => toAstApp head args
            | _ => toAstApp head args
  where
    toAstApp (head : Sexp) (args : List Sexp) : Expr :=
      .app (toAstExpr head) (args.map toAstArg)

  partial def toAstArg : Sexp → Expr
    | .atom (.sym s) =>
        if s.startsWith "@" then
          .splice s
        else
          toAstExpr (.atom (.sym s))
    | other => toAstExpr other

  partial def toAstQuant (ctor : List Var → Expr → Expr) (binder body : Sexp) : Expr :=
    let vs :=
      match binder with
      | .list xs => xs
      | x => [x]
    let vars :=
      vs.filterMap (fun v =>
        match v.asSym? with
        | some s =>
            if s.startsWith "?" || s.startsWith "@" then
              some (toVar s)
            else
              none
        | none => none)
    ctor vars (toAstExpr body)

end

def closeForall (s : Sexp) : Expr :=
  let body := toAstExpr s
  let (fts, frs) := freeVars s
  let termVars := sortStrings fts.toList |>.map (fun v => termVar v)
  let rowVars := sortStrings frs.toList |>.map (fun v => rowVar v)
  let binders := termVars ++ rowVars
  if binders.isEmpty then
    body
  else
    .forall_ binders body

end SumoKif

