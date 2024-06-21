import Mathlib.Data.Set.Basic
import Mathlib.Order.SetNotation

section
open Set

variable  {U : Type}
variable (A B C : Set U)

example : ∀ x, x ∈ A ∩ C → x ∈ A ∪ B :=
sorry

example : ∀ x, x ∈ (A ∪ B)ᶜ → x ∈ Aᶜ :=
sorry

end

section
variable {U : Type}

/- defining "disjoint" -/

def disj (A B : Set U) : Prop := ∀ ⦃x⦄, x ∈ A → x ∈ B → False

example (A B : Set U) (h : ∀ x, ¬ (x ∈ A ∧ x ∈ B)) :
  disj A B :=
fun x ↦
fun h1 : x ∈ A ↦
fun h2 : x ∈ B ↦
have h3 : x ∈ A ∧ x ∈ B := And.intro h1 h2
show False from h x h3

-- notice that we do not have to mention x when applying
--   h : disj A B
example (A B : Set U) (h1 : disj A B) (x : U)
    (h2 : x ∈ A) (h3 : x ∈ B) :
  False :=
h1 h2 h3

-- the same is true of ⊆
example (A B : Set U) (x : U) (h : A ⊆ B) (h1 : x ∈ A) :
  x ∈ B :=
h h1

example (A B C D : Set U) (h1 : disj A B) (h2 : C ⊆ A)
    (h3 : D ⊆ B) :
  disj C D :=
sorry
end

open Set

section
variable {U : Type}
variable {A B : I → Set U}

theorem Inter.intro {x : U} (h : ∀ i, x ∈ A i) : x ∈ ⋂ i, A i := by
rw [mem_iInter]
show ∀ i, x ∈ A i
assumption

theorem Inter.elim {x : U} (h : x ∈ ⋂ i, A i) (i : I) : x ∈ A i := by
rw [mem_iInter] at h
apply h

theorem Union.intro {x : U} (i : I) (h : x ∈ A i) : x ∈ ⋃ i, A i := by
rw [mem_iUnion]
show ∃ i, x ∈ A i
exact ⟨i, h⟩

theorem Union.elim {b : Prop} {x : U}
(h₁ : x ∈ ⋃ i, A i) (h₂ : ∀ (i : I), x ∈ A i → b) : b := by
rw [mem_iUnion] at h₁
cases h₁ with
| intro i hi => exact h₂ i hi

end

section
variable {I U : Type}
variable (A : I → Set U) (B : I → Set U) (C : Set U)

example : (⋂ i, A i) ∩ (⋂ i, B i) ⊆ (⋂ i, A i ∩ B i) :=
sorry

example : C ∩ (⋃i, A i) ⊆ ⋃i, C ∩ A i :=
sorry

end

section
variable {U : Type}
variable (A B C : Set U)

-- For this exercise these two facts are useful
example (h1 : A ⊆ B) (h2 : B ⊆ C) : A ⊆ C :=
Subset.trans h1 h2

example : A ⊆ A :=
Subset.refl A

example (h : A ⊆ B) : powerset A ⊆ powerset B :=
sorry

example (h : powerset A ⊆ powerset B) : A ⊆ B :=
sorry

end

