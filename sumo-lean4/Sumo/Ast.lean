set_option autoImplicit false

namespace Sumo

namespace Ast

inductive VarKind : Type
  | term
  | row
  deriving Repr, Inhabited

structure Var : Type where
  kind : VarKind
  name : String
  deriving Repr, Inhabited

def termVar (name : String) : Var := { kind := .term, name }
def rowVar (name : String) : Var := { kind := .row, name }

/-!
Computable syntax tree for SUO-KIF expressions.

Notes:
- We keep a single expression type (no term/formula split) because SUMO passes formulas as arguments.
- Row variables are represented by `VarKind.row` in binders and by `splice "@ROW"` in arg position.
- All symbols (including predicates/functions/classes) are represented as strings.
-/
inductive Expr : Type
  | sym : String → Expr
  | str : String → Expr
  | num : String → Expr
  | var : Var → Expr
  | splice : String → Expr
  | app : Expr → List Expr → Expr
  | and_ : List Expr → Expr
  | or_ : List Expr → Expr
  | not_ : Expr → Expr
  | imp : Expr → Expr → Expr
  | iff : Expr → Expr → Expr
  | forall_ : List Var → Expr → Expr
  | exists_ : List Var → Expr → Expr
  deriving Repr, Inhabited

end Ast

end Sumo
