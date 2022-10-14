import Lean
open Lean Elab Term

def hello := "world"
def sss := "∀a b, a → b → a ∧ b"
elab "myt[" s:str "]" : term => do
  logInfo s!"{s}"
  pure $ mkStrLit "a"
#eval myt["nakami"]

elab "myterm[" s:str "]" : term => do
  let env ← getEnv
  let _a ← (pure:_ → IO _) "a"
  let aa := s.getString
  logInfo s!"ho:{aa}"
  let parsedSyntax ← match Lean.Parser.runParserCategory env `term s.getString with
                      | Except.ok stx => pure stx
                      | Except.error errmsg => throwError errmsg
  logInfo s!"{parsedSyntax}"
  let prop ← elabTerm parsedSyntax none-- (mkConst `Lean.Prop)
  logInfo s!"hi:{prop}"
  pure prop

theorem propStr : myterm["∀a b, a → b → a ∧ b"] :=
  fun {a b : Prop} (ha : a) (hb : b) => ⟨ha,hb⟩

def p := myterm["∀a b, a → b → a ∧ b"]
#print p
