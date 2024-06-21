section
  variable (A : Type)
  variable (f : A → A)
  variable (P : A → Prop)
  variable (h : ∀ x, P x → P (f x))

  -- Show the following:
  example : ∀ y, P y → P (f (f y)) :=
  sorry
end

section
  variable (U : Type)
  variable (A B : U → Prop)

  example : (∀ x, A x ∧ B x) → ∀ x, A x := by
  sorry
end

section
  variable (U : Type)
  variable (A B C : U → Prop)

  variable (h1 : ∀ x, A x ∨ B x)
  variable (h2 : ∀ x, A x → C x)
  variable (h3 : ∀ x, B x → C x)

  example : ∀ x, C x :=
  sorry
end

section

open Classical   -- not needed, but you can use it

-- This is an exercise from Chapter 4. Use it as an axiom here.
axiom not_iff_not_self (P : Prop) : ¬ (P ↔ ¬ P)

example (Q : Prop) : ¬ (Q ↔ ¬ Q) :=
not_iff_not_self Q

section
  variable (Person : Type)
  variable (shaves : Person → Person → Prop)
  variable (barber : Person)
  variable (h : ∀ x, shaves barber x ↔ ¬ shaves x x)

  -- Show the following:
  example : False :=
  sorry

end
end

section
  variable (U : Type)
  variable (A B : U → Prop)

  example : (∃ x, A x) → ∃ x, A x ∨ B x :=
  sorry
end

section
  variable (U : Type)
  variable (A B : U → Prop)

  variable (h1 : ∀ x, A x → B x)
  variable (h2 : ∃ x, A x)

  example : ∃ x, B x :=
  sorry
end

variable (U : Type)
variable (A B C : U → Prop)

example (h1 : ∃ x, A x ∧ B x) (h2 : ∀ x, B x → C x) :
    ∃ x, A x ∧ C x :=
sorry

variable (U : Type)
variable (A B C : U → Prop)

example : (¬ ∃ x, A x) → ∀ x, ¬ A x :=
sorry

example : (∀ x, ¬ A x) → ¬ ∃ x, A x :=
sorry

theorem foo {A : Type} {a b c : A} : a = b → c = b → a = c :=
sorry

-- notice that you can now use foo as a rule. The curly braces mean that
-- you do not have to give A, a, b, or c

section
  variable (A : Type)
  variable (a b c : A)

  example (h1 : a = b) (h2 : c = b) : a = c :=
  foo h1 h2
end

section
  variable {A : Type}
  variable {a b c : A}

  -- replace the sorry with a proof, using foo and rfl, without using eq.symm.
  theorem my_symm (h : b = a) : a = b :=
  sorry

  -- now use foo and my_symm to prove transitivity
  theorem my_trans (h1 : a = b) (h2 : b = c) : a = c :=
  sorry
end
