import RTPNotes.Common
import Mathlib.Tactic

set_option linter.style.longLine false

/-!
Quantifier World
-/

namespace RTPNotes.Worlds.Quantifier

/--
### Level 1
For all `a : A`, `a = a` holds.
-/
theorem level1 {A : Type} : ∀ a : A, a = a := by
  intro x
  rfl

/--
### Level 2
For all `w x y z : A` if `w = x ` and `x = y` and `y = z` then `w = z`.
-/
theorem level2 {A : Type} : ∀ w x y z : A, w = x → x = y → y = z → w = z := by
  intro w x y z e1 e2 e3
  rw [e1, ← e3, ← e2]

/--
### Level 3
Suppose the predicate `P : A → Prop` holds for all `x : A`. Then for any particular element `a : A`, `P a` is true.
-/
theorem level3 {A : Type} {P : A → Prop} (a : A) (h : ∀ x : A, P x) : P a := by
  exact h a

/--
### Level 4
There is some boolean `b` so that `b && b = b || b`
-/
theorem level4 : ∃ b : Bool, (b && b) = (b || b) := by
  use true
  rfl

/--
### Level 5
For any type `A`, for all elements `x : A`, there exists an element `y : A`, so that `x = y`.
-/
theorem level5 {A : Type} : ∀ x : A, ∃ y : A, x = y := by
  intro x
  use x

/--
### Level 6
Given a family of propositions `P : A → B → Prop`, `∃ z : B, ∀ w : A, P w z`implies `∀ x : A, ∃ y : B, P x y`
-/
theorem level6 {A B : Type} (P : A → B → Prop) : (∃ z : B, ∀ w : A, P w z) → ∀ x : A, ∃ y : B, P x y := by
  intro h
  let ⟨b,hb⟩ := h
  intro x
  use b
  apply hb

/--
### Level 7
Given a family of propositions `P : A → Prop`, `∀ x : A, ¬ (P x)` is logically equivalent to `¬ (∃ x : A, P x)`
-/
theorem level7 {A : Type} (P : A → Prop) : (∀ x : A, ¬ (P x)) ↔ ¬ (∃ x : A, P x) := by
  constructor
  ·intro h1 h2
   let ⟨a,ha⟩ := h2
   exact h1 a ha
  ·intro h1 a ha
   apply h1
   exact ⟨a, ha⟩

/--
### Level 8
Given a family of propositions `P : A → Prop`, `∃ x : A, ¬ (P x)` implies `¬ (∀ x : A, P x)`
-/
theorem level8 {A : Type} (P : A → Prop) : (∃ x : A, ¬ (P x)) → ¬ (∀ x : A, P x) := by
  intro h1 h2
  let ⟨a, nha⟩ := h1
  apply nha
  exact h2 a

/--
### Level 9
Given a family of propositions `P : A → Prop`, using classical logic, `¬ (∀ x : A, P x)` implies `∃ x : A, ¬ (P x)`.
-/
theorem level9 {A : Type} (P : A → Prop) : ¬ (∀ x : A, P x) → (∃ x : A, ¬ (P x)) := by
  classical
  intro h1
  apply Classical.byContradiction
  intro h2
  apply h1
  intro a
  apply Classical.byContradiction
  intro npa
  let h3 : ∃x, ¬P x := ⟨a,npa⟩
  exact h2 h3




end RTPNotes.Worlds.Quantifier
