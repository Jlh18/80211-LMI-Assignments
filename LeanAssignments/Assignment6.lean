import Mathlib.Data.Nat.Defs

open Nat

--1.a.
example : ∀ m n k : Nat, m * (n + k) = m * n + m * k := sorry

--1.b.
example : ∀ n : Nat, 0 * n = 0 := sorry

--1.c.
example : ∀ n : Nat, 1 * n = n := sorry

--1.d.
example : ∀ m n k : Nat, (m * n) * k = m * (n * k) := sorry

--1.e.
example : ∀ m n : Nat, m * n = n * m := sorry

--2.a.
example : ∀ m n k : Nat, n ≤ m → n + k ≤ m + k := sorry

--2.b.
example : ∀ m n k : Nat, n + k ≤ m + k → n ≤ m := sorry

--2.c.
example : ∀ m n k : Nat, n ≤ m → n * k ≤ m * k := sorry

--2.d.
example : ∀ m n : Nat, m ≥ n → m = n ∨ m ≥ n+1 := sorry

--2.e.
example : ∀ n : Nat, 0 ≤ n := sorry
