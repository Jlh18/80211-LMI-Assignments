import Mathlib.Order.Basic
import Mathlib.Tactic.Basic
import Mathlib.Algebra.Ring.Divisibility.Lemmas

section

open Function Int

def f (x : ℤ) : ℤ := x + 3
def g (x : ℤ) : ℤ := -x
def h (x : ℤ) : ℤ := 2 * x + 3

example : Injective f :=
fun x1 x2 ↦
fun h1 : x1 + 3 = x2 + 3 ↦   -- Lean knows this is the same as f x1 = f x2
show x1 = x2 from add_right_cancel h1

example : Surjective f :=
  fun y ↦
  have h1 : f (y - 3) = y :=
    calc
      f (y - 3) = (y - 3) + 3 := by rfl
              _ = y           := by rw [sub_add_cancel]
show ∃ x, f x = y from Exists.intro (y - 3) h1

example (x y : ℤ) (h : 2 * x = 2 * y) : x = y :=
have h1 : 2 ≠ (0 : ℤ) := by decide  -- this tells Lean to figure it out itself
show x = y from mul_left_cancel₀ h1 h

example (x : ℤ) : -(-x) = x := neg_neg x

example (A B : Type) (u : A → B) (v : B → A) (h : LeftInverse u v) :
  ∀ x, u (v x) = x :=
h

example (A B : Type) (u : A → B) (v : B → A) (h : LeftInverse u v) :
  RightInverse v u :=
h

-- fill in the sorry's in the following proofs

example : Injective h :=
sorry

example : Surjective g :=
sorry

example (A B : Type) (u : A → B) (v1 : B → A) (v2 : B → A)
  (h1 : LeftInverse v1 u) (h2 : RightInverse v2 u) : v1 = v2 :=
funext
  (fun x ↦
    calc
      v1 x = v1 (u (v2 x)) := by sorry
         _ = v2 x          := by sorry)

variable {X Y : Type}
variable (A₁ A₂ : Set X)
variable (f : X → Y)

-- remember, x ∈ A ∩ B is the same as x ∈ A ∧ x ∈ B
example (x : X) (h1 : x ∈ A₁) (h2 : x ∈ A₂) : x ∈ A₁ ∩ A₂ :=
And.intro h1 h2

example (x : X) (h1 : x ∈ A₁ ∩ A₂) : x ∈ A₁ :=
And.left h1

-- Fill in the proof below.

example : f '' (A₁ ∩ A₂) ⊆ f '' A₁ ∩ f '' A₂ := by
intro y
intro (h1 : y ∈ f '' (A₁ ∩ A₂))
show y ∈ f '' A₁ ∩ f '' A₂
sorry

end

class StrictPartialOrder (A : Type u) where
  lt : A → A → Prop
  irrefl : Irreflexive lt
  trans : Transitive lt

local infix:50 " ≺ " => StrictPartialOrder.lt

section
variable {A : Type u} [StrictPartialOrder A]

def R' (a b : A) : Prop :=
(a ≺ b) ∨ a = b

local infix:50 " ≼ " => R'

theorem reflR' (a : A) : a ≼ a := sorry

theorem transR' {a b c : A} (h1 : a ≼ b) (h2 : b ≼ c) :
  a ≼ c :=
sorry

theorem antisymmR' {a b : A} (h1 : a ≼ b) (h2 : b ≼ a) :
  a = b :=
sorry

end

namespace hidden
class Preorder (A : Type u) where
    le : A → A → Prop
    refl : Reflexive le
    trans : Transitive le

namespace Preorder
def S (a b : A) [Preorder A] : Prop := le a b ∧ le b a

example (A : Type u) [Preorder A] {x y z : A} :
  S x y → S y z → S x z :=
sorry

end Preorder
end hidden

axiom A : Type
axiom a : A
axiom b : A
axiom c : A
axiom R : A → A → Prop
axiom Rab : R a b
axiom Rbc : R b c
axiom nRac : ¬ R a c

-- Prove only one of the following two theorems (the other is false!):

theorem R_is_strict_partial_order :
  Irreflexive R ∧ Transitive R :=
sorry

theorem R_is_not_strict_partial_order :
  ¬(Irreflexive R ∧ Transitive R) :=
sorry
