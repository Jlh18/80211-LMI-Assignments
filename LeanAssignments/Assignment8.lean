def Bool.flip (b : Bool) : Bool :=
match b with
| Bool.false => Bool.true
| Bool.true => Bool.false

theorem Bool.flip_flip (b : Bool) : b.flip.flip = b :=
match b with
| Bool.false => rfl
| Bool.true => rfl

def mod_two (n : Nat) : Bool :=
match n with
| Nat.zero   => Bool.false
| Nat.succ n => Bool.flip (mod_two n)

def times_two (n : Nat) : Nat :=
match n with
| Nat.zero   => Nat.zero
| Nat.succ n => (times_two n).succ.succ

theorem mod_two_times_two_eq_ff :
  ∀ x : Nat, mod_two (times_two x) = Bool.false := sorry

theorem times_two_not_one :
  ∀ x : Nat, ¬ times_two x = 1 := sorry

-- true or false?
example : ∀ x : Nat, ∃ y : Nat, times_two x = y := sorry

-- true or false?
example : ∀ x : Nat, ∀ y : Nat, times_two x = y := sorry

-- true or false?
example : ∃ x : Nat, ∀ y : Nat, times_two x = y := sorry

-- true or false?
example : ∃ x : Nat, ∃ y : Nat, times_two x = y := sorry
