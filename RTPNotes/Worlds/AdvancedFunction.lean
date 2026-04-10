import RTPNotes.Common
import Mathlib.Tactic

set_option linter.style.longLine false

/-!
Advanced Function World
-/

namespace RTPNotes.Worlds.AdvancedFunction

/--
### Level 1
A function `f : A → B` must be *total* meaning for each `a : A` there is some `b : B` so that `f a = b`.
-/
theorem level1 {A B : Type} (f : A → B) : ∀ a : A, ∃ b : B, f a = b := by
  intro a
  use f a

/--
### Level 2
The function `not : Bool → Bool` is surjective.
-/
theorem level2 : ∀ b : Bool, ∃ x : Bool, not x = b := by
  intro b
  cases b
  ·use true
   rfl
  ·use false
   rfl

/--
### Level 3
For functions `f : A → B` and `g : B → C` if `g ∘ f` is surjective, then so is `g`.
-/
theorem level3 {A B C : Type} (f : A → B) (g : B → C) (gf_is_surj : ∀ z : C, ∃ x : A, (g ∘ f) x = z) : ∀ c : C, ∃ y : B, g y = c := by
  intro c
  have h := gf_is_surj c
  let ⟨a, ha⟩ := h
  use f a
  rw [← ha]
  exact rfl

/--
### Level 4
If `f : A → B` and `g : B → C` are both surjective then `g ∘ f : A → C` is also surjective.
-/
theorem level4 {A B C : Type} (f : A → B) (g : B → C) (f_is_surj : ∀ b : B, ∃ a : A, f a = b) (g_is_surj : ∀ c : C, ∃ b : B, g b = c) : ∀ c : C, ∃ a : A, (g ∘ f) a = c := by
  intro c
  have h1 := g_is_surj c
  let ⟨b, hb⟩ := h1
  have h2 := f_is_surj b
  let ⟨a, ha⟩ := h2
  use a
  rw [← hb, ← ha]
  rfl

/--
### Level 5
The function `not : Bool → Bool` is injective.
-/
theorem level5 : ∀ x y : Bool, not x = not y → x = y := by
  let e1 : (!false) = true := by rfl
  let e2 : (!true) = false := by rfl
  intro x y e
  cases x
  ·cases y
   ·rfl
   ·rw[← e1, e]
    rfl
  ·cases y
   ·rw[← e1, ← e]
    rfl
   ·rfl


/--
### Level 6
If `f : A → B` and `g : B → C` are both injective functions, then `g ∘ f : A → C` is also injective.
-/
theorem level6 {A B C : Type} (f : A → B) (g : B → C) (f_is_inj : ∀ x y : A, f x = f y → x = y) (g_is_inj : ∀ x y : B, g x = g y → x = y) : ∀ x y : A, (g ∘ f) x = (g ∘ f) y → x = y := by
 intro x y e
 have hf := f_is_inj x y
 have hg := g_is_inj (f x) (f y)
 apply hf
 apply hg
 exact e

/--
### Level 7
For functions `f : A → B` and `g : B → C` if `g ∘ f` is injective, then so is `f`.
-/
theorem level7 {A B C : Type} (f : A → B) (g : B → C) (gf_is_inj : ∀ x y : A, (g ∘ f) x = (g ∘ f) y → x = y) : ∀ x y : A, f x = f y → x = y := by
  intro x y e
  have hgf := gf_is_inj x y
  apply hgf
  have comp: ∀x : A,(g∘f) x = g (f x) := by
    intro a
    rfl
  rw[comp x, comp y, e]

/--
### Level 8
The function `not : Bool → Bool` is bijective.
-/
theorem level8 : (∀ x y : Bool, not x = not y → x = y) ∧ (∀ x : Bool, ∃ y : Bool, not y = x) := by
  constructor
  ·exact level5
  ·exact level2


/--
### Level 9
The function `not : Bool → Bool` is invertible.
-/
theorem level9 : ∃ g : Bool → Bool, (∀ b : Bool, g (not b) = b) ∧ (∀ b : Bool, not (g b) = b) := by
  use not
  constructor
  ·intro b
   cases b <;> rfl
  ·intro b
   cases b <;> rfl

/--
### Level 10
The inverse of an invertible function is invertible.
-/
theorem level10 {A B : Type} (f : A → B) (g : B → A) (inv : (∀ a : A, g (f a) = a) ∧ (∀ b : B, f (g b) = b)) : ∃ h : A → B, (∀ b : B, h (g b) = b) ∧ (∀ a : A, g (h a) = a) := by
  use f
  constructor
  ·exact inv.2
  ·exact inv.1

/--
### Level 11
An invertible function is bijective.
-/
theorem level11 {A B : Type} (f : A → B) (inv : ∃ g : B → A, (∀ a : A, g (f a) = a) ∧ (∀ b : B, f (g b) = b)) : (∀ x y : A, f x = f y → x = y) ∧ (∀ b : B, ∃ x : A, f x = b) := by
  sorry

/--
### Level 12
A bijective function is invertible.
-/
theorem level12 {A B : Type} (f : A → B) (inj : ∀ x y : A, f x = f y → x = y) (surj : ∀ b : B, ∃ x : A, f x = b) : ∃ g : B → A, (∀ a : A, g (f a) = a) ∧ (∀ b : B, f (g b) = b) := by
  sorry

/--
### Level 13
For functions `f g : A → B` if `∀ x : A, f x = g x` then `f = g`.
-/
theorem level13 {A B : Type} {f g : A → B} (p : ∀ x : A, f x = g x) : f = g := by
  sorry

/--
### Level 14
The composite of the function `not : Bool → Bool` with itself equals the identity function
-/
theorem level14 : not ∘ not = id := by
  sorry

/--
### Level 15
The function `f : A → B` is an isomorphism if and only if `f` is invertible.
-/
theorem level15 {A B : Type} (f : A → B) : (∃ g : B → A, g ∘ f = id ∧ f ∘ g = id) ↔ (∃ g : B → A, (∀ a : A, g (f a) =a) ∧ (∀ b : B, f (g b) = b)) := by
  sorry

end RTPNotes.Worlds.AdvancedFunction
