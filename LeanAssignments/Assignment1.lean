section

variable (A B C D : Prop)

example : A ∧ (A → B) → B :=
sorry

example : (A ∧ ¬ B) → ¬(A → B) :=
sorry

example : A → ¬ (¬ A ∧ B) :=
sorry

example : ¬ (A ∧ B) → (A → ¬ B) :=
sorry

example : ¬ (A ∧ ¬ B) → (A → (¬ B→ C)) :=
sorry

example (h₁ : A ∨ B) (h₂ : A → C) (h₃ : B → D) : C ∨ D :=
sorry

example (h : ¬ A ∧ ¬ B) : ¬ (A ∨ B) :=
sorry

-- for a hint, see top of Assignment 2
example : ¬ (A ↔ ¬ A) :=
sorry

end
