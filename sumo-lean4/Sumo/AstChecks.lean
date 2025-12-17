import Std
import Sumo.Ast

set_option autoImplicit false

namespace Sumo

namespace AstChecks

open Sumo.Ast

mutual

  def isGround : Expr → Bool
    | .sym _ => true
    | .str _ => true
    | .num _ => true
    | .var _ => false
    | .splice _ => false
    | .app f xs => isGround f && isGroundList xs
    | .and_ xs => isGroundList xs
    | .or_ xs => isGroundList xs
    | .not_ φ => isGround φ
    | .imp φ ψ => isGround φ && isGround ψ
    | .iff φ ψ => isGround φ && isGround ψ
    | .forall_ _ _ => false
    | .exists_ _ _ => false

  def isGroundList : List Expr → Bool
    | [] => true
    | x :: xs => isGround x && isGroundList xs

end

mutual

  def exprKey : Expr → String
    | .sym s => "sym:" ++ s
    | .str s => "str:" ++ s
    | .num s => "num:" ++ s
    | .var v =>
        match v.kind with
        | .term => "var?:" ++ v.name
        | .row => "var@:" ++ v.name
    | .splice s => "splice:" ++ s
    | .app f xs => "app(" ++ exprKey f ++ ")[" ++ String.intercalate "," (xs.map exprKey) ++ "]"
    | .and_ xs => "and[" ++ String.intercalate "," (xs.map exprKey) ++ "]"
    | .or_ xs => "or[" ++ String.intercalate "," (xs.map exprKey) ++ "]"
    | .not_ φ => "not(" ++ exprKey φ ++ ")"
    | .imp φ ψ => "imp(" ++ exprKey φ ++ ")(" ++ exprKey ψ ++ ")"
    | .iff φ ψ => "iff(" ++ exprKey φ ++ ")(" ++ exprKey ψ ++ ")"
    | .forall_ vs body =>
        let vs := vs.map (fun v => v.name)
        "forall[" ++ String.intercalate "," vs ++ "](" ++ exprKey body ++ ")"
    | .exists_ vs body =>
        let vs := vs.map (fun v => v.name)
        "exists[" ++ String.intercalate "," vs ++ "](" ++ exprKey body ++ ")"

end

def atomKey? : Expr → Option String
  | .app (.sym p) args =>
      if isGroundList args then
        let a := String.intercalate "," (args.map exprKey)
        some (p ++ "(" ++ a ++ ")")
      else
        none
  | _ => none

def negAtomKey? : Expr → Option String
  | .not_ φ => atomKey? φ
  | _ => none

structure ContradictionReport : Type where
  positives : Nat
  negatives : Nat
  contradictions : List String
  deriving Repr

def findGroundAtomicContradictions (axioms : List Expr) : ContradictionReport :=
  let (pos, neg) :=
    axioms.foldl
      (init := (Std.HashSet.emptyWithCapacity (α := String), Std.HashSet.emptyWithCapacity (α := String)))
      (fun (pos, neg) φ =>
        match atomKey? φ, negAtomKey? φ with
        | some k, _ => (pos.insert k, neg)
        | none, some k => (pos, neg.insert k)
        | none, none => (pos, neg))
  let contradictions :=
    pos.toList.filter (fun k => neg.contains k)
  let contradictions :=
    (contradictions.toArray.qsort (fun a b => a < b)).toList
  { positives := pos.size
    negatives := neg.size
    contradictions := contradictions }

end AstChecks

end Sumo
