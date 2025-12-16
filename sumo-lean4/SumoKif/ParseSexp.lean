import SumoKif.Sexp

set_option autoImplicit false

namespace SumoKif

namespace Parse

structure State : Type where
  input : String
  pos : String.Pos.Raw := 0

def State.eof (st : State) : Bool :=
  st.pos.byteIdx >= st.input.length

def State.peek? (st : State) : Option Char :=
  String.Pos.Raw.get? st.input st.pos

def State.next? (st : State) : Option (Char × State) :=
  match st.peek? with
  | none => none
  | some c => some (c, { st with pos := String.Pos.Raw.next st.input st.pos })

def isWhitespace (c : Char) : Bool :=
  c = ' ' || c = '\n' || c = '\t' || c = '\r'

partial def skipLineComment (st : State) : State :=
  match st.next? with
  | none => st
  | some (c, st') =>
      if c = '\n' then st' else skipLineComment st'

partial def skipWsAndComments (st : State) : State :=
  match st.peek? with
  | none => st
  | some c =>
      if isWhitespace c then
        skipWsAndComments { st with pos := String.Pos.Raw.next st.input st.pos }
      else if c = ';' then
        skipWsAndComments (skipLineComment { st with pos := String.Pos.Raw.next st.input st.pos })
      else
        st

def isAtomChar (c : Char) : Bool :=
  !(isWhitespace c || c = '(' || c = ')' || c = ';' || c = '"')

partial def parseString (st : State) : Except String (String × State) := Id.run do
  match st.next? with
  | none => .error "unexpected EOF (expected opening quote)"
  | some (c, st') =>
      if c != '"' then
        .error "expected opening quote"
      else
        let mut acc : List Char := []
        let mut s := st'
        let mut done := false
        while !done do
          match s.next? with
          | none => return .error "unterminated string"
          | some (d, s') =>
              if d = '"' then
                s := s'
                done := true
              else if d = '\\' then
                match s'.next? with
                | none => return .error "unterminated escape"
                | some (e, s'') =>
                    acc := e :: acc
                    s := s''
              else
                acc := d :: acc
                s := s'
        return .ok (String.mk acc.reverse, s)

partial def parseSymbol (st : State) : Except String (String × State) := Id.run do
  let mut acc : List Char := []
  let mut s := st
  while true do
    match s.peek? with
    | none => break
    | some c =>
        if isAtomChar c then
          acc := c :: acc
          s := { s with pos := String.Pos.Raw.next s.input s.pos }
        else
          break
  if acc.isEmpty then
    return .error "expected symbol"
  return .ok (String.mk acc.reverse, s)

partial def parseSexp (st0 : State) : Except String (Sexp × State) := Id.run do
  let st := skipWsAndComments st0
  match st.peek? with
  | none => .error "unexpected EOF"
  | some '(' =>
      let st' := { st with pos := String.Pos.Raw.next st.input st.pos }
      let mut items : List Sexp := []
      let mut s := st'
      let mut done := false
      while !done do
        s := skipWsAndComments s
        match s.peek? with
        | none => return .error "unterminated list"
        | some ')' =>
            s := { s with pos := String.Pos.Raw.next s.input s.pos }
            done := true
        | _ =>
            match parseSexp s with
            | .error e => return .error e
            | .ok (x, s') =>
                items := x :: items
                s := s'
      return .ok (.list items.reverse, s)
  | some ')' => .error "unexpected ')'"
  | some '"' =>
      match parseString st with
      | .error e => .error e
      | .ok (s, st') => .ok (.atom (.str s), st')
  | some _ =>
      match parseSymbol st with
      | .error e => .error e
      | .ok (sym, st') => .ok (.atom (.sym sym), st')

partial def parseAll (input : String) : Except String (List Sexp) := Id.run do
  let mut st : State := { input := input, pos := 0 }
  let mut acc : List Sexp := []
  while true do
    st := skipWsAndComments st
    if st.eof then
      break
    match parseSexp st with
    | .error e => return .error e
    | .ok (x, st') =>
        acc := x :: acc
        st := st'
  return .ok acc.reverse

partial def parseFold {α : Type} (input : String) (init : α) (f : α → Sexp → α) : Except String α := Id.run do
  let mut st : State := { input := input, pos := 0 }
  let mut acc := init
  while true do
    st := skipWsAndComments st
    if st.eof then
      break
    match parseSexp st with
    | .error e => return .error e
    | .ok (x, st') =>
        acc := f acc x
        st := st'
  return .ok acc

end Parse

end SumoKif
