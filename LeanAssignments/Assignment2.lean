-- hint for Assignment1. Show ¬ A
import Mathlib.Tactic

section

open Classical
variable {A B C : Prop}

-- Prove ¬ (A ∧ B) → ¬ A ∨ ¬ B by replacing the sorry's below
-- by proofs.

lemma step1 (h₁ : ¬ (A ∧ B)) (h₂ : A) : ¬ A ∨ ¬ B :=
have : ¬ B := sorry
show ¬ A ∨ ¬ B from Or.inr this

lemma step2 (h₁ : ¬ (A ∧ B)) (h₂ : ¬ (¬ A ∨ ¬ B)) : False :=
have : ¬ A :=
  fun _ : A ↦
  have : ¬ A ∨ ¬ B := step1 h₁ ‹A›
  show False from h₂ this
show False from sorry

theorem step3 (h : ¬ (A ∧ B)) : ¬ A ∨ ¬ B :=
byContradiction
  (fun h' : ¬ (¬ A ∨ ¬ B) ↦
    show False from step2 h h')

end

section
open Classical
variable {A B C : Prop}

example (h : ¬ B → ¬ A) : A → B := by
  sorry

example (h : A → B) : ¬ A ∨ B := by
  sorry

example (h1 : A → C) (h2 : ¬ A → (B ∧ A)) : B ∨ C := by
  sorry

example (h1 : ¬ A → (B ∨ C)) (h2 : ¬ B) (h3 : ¬ C) : A := by
  sorry
end
