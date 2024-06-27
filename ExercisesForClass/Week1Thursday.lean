/- Prove each of the following
1. using natural deduction
2. as an `example` or `theorem` in lean

-/
--------------------------------------------------------------

/-
A ∧ B
-----
B ∧ A
theorem
-/

/-
A ∧ (B ∨ C)
-----------
(A ∧ B) ∨ (A ∧ C)
theorem
-/

/-
(B ∨ C) ∧ A
-----------
(A ∧ B) ∨ (A ∧ C)

(use above two theorems)
-/

/-
A ∨ (B ∨ C)
-----------
(A ∨ B) ∨ C
-/

/-
A → (B → C)
-----------
(A ∧ B) → C
-/

/-
(A ∨ B) → C
------------
(A → C) ∧ (B → C)
theorem Or.elimHalf1
-/

/-
(A → C) ∧ (B → C)
------------
(A ∨ B) → C
theorem Or.ElimHalf2
-/

/-

---------------------------------------
((A ∨ B) → C) ↔ ((A → C) ∧ (B → C))
theorem hidden.or_imp
-/

#check or_imp

-- type \bot for ⊥
/-

---------------
¬ A ↔ (A → ⊥)
-/

/-
¬ (A ∨ B)
---------------
¬ A ∧ ¬ B
theorem deMorgan1
-/

/-
¬ A ∧ ¬ B
---------------
¬ (A ∨ B)
theorem deMorgan2
-/

/-

------------------------
¬ (A ∨ B) ↔ (¬ A ∧ ¬ B)
theorem not_or
-/

#check not_or
-- try proving using or_imp

/-
¬ A ∨ ¬ B
---------------
¬ (A ∧ B)
theorem deMorgan3
-/

-- #check Classical.byContradiction
-- what is deMorgan4 and use Classical.byContradiction to prove it
