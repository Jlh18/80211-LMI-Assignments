import Mathlib.Data.Nat.Defs

open Nat

def isEven (n : Nat) : Prop :=
match n with
| 0   => True
| n+1 => ¬ isEven n

-- This is just a proof of True
example : isEven 0 := by
  show True
  trivial

-- This is just a proof of ¬ ¬ True
example : ¬ isEven 1 := by
  show ¬ ¬ True
  rw [not_not]
  show True
  trivial

def minimum (n : Nat) (m : Nat) : Nat :=
match n with
| 0 => 0
| n+1 => match m with
  | 0 => 0
  | m+1 => (minimum n m) + 1

example : minimum 1 3 = 1 := by
  show (minimum 0 2) + 1 = 1
  show 0 + 1 = 1
  show 1 = 1
  rfl

example : minimum 3 1 = 1 := by
  show (minimum 2 0) + 1 = 1
  show 0 + 1 = 1
  show 1 = 1
  rfl

def minimumIsEven (n : Nat) (m : Nat) : Prop :=
match n with
| 0 => True
| n+1 => match m with
  | 0 => True
  | m+1 => ¬ minimumIsEven n m

-- This is just a proof of True
example : minimumIsEven 0 0 := by
  show True
  trivial

-- This is just a proof of ¬ ¬ True
example : ¬ minimumIsEven 1 1 := by
  show ¬ ¬ True
  rw [not_not]
  show True
  trivial

example : ∃ n m, minimumIsEven n m ∧ minimumIsEven n (m + 1) := by
  sorry

example : ∃ n m, minimumIsEven n m ∧ ¬ minimumIsEven n (m + 1) := by
  sorry

theorem final (n m : Nat) : minimumIsEven n m ↔ isEven (minimum n m) :=
match n with
| 0 => by
  sorry
| n+1 => match m with
  | 0 => by
    sorry
  -- note that the induction hypothesis is called `final n m`
  | m+1 => by
    sorry
