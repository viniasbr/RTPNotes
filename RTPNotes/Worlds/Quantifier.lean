import RTPNotes.Common

/-!
Quantifier World
-/

namespace RTPNotes.Worlds.Quantifier

/--
### Level 1
For all `a : A`, `a = a` holds.
-/
theorem level1 {A : Type} : ∀ a : A, a = a := by
  sorry

/--
### Level 2
For all `w x y z : A` if `w = x ` and `x = y` and `y = z` then `w = z`.
-/
theorem level2 {A : Type} : ∀ w x y z : A, w = x → x = y → y = z → w = z := by
  sorry

/--
### Level 3
Suppose the predicate `P : A → Prop` holds for all `x : A`. Then for any particular element `a : A`, `P a` is true.
-/
theorem level3 {A : Type} {P : A → Prop} (a : A) (h : ∀ x : A, P x) : P a := by
  sorry

/--
### Level 4
There is some boolean `b` so that `b && b = b || b`
-/
theorem level4 : ∃ b : Bool, (b && b) = (b || b) := by
  sorry

/--
### Level 5
For any type `A`, for all elements `x : A`, there exists an element `y : A`, so that `x = y`.
-/
theorem level5 {A : Type} : ∀ x : A, ∃ y : A, x = y := by
  sorry

/--
### Level 6
Given a family of propositions `P : A → B → Prop`, `∃ z : B, ∀ w : A, P w z`implies `∀ x : A, ∃ y : B, P x y`
-/
theorem level6 {A B : Type} (P : A → B → Prop) : (∃ z : B, ∀ w : A, P w z) → ∀ x : A, ∃ y : B, P x y := by
  sorry

/--
### Level 7
Given a family of propositions `P : A → Prop`, `∀ x : A, ¬ (P x)` is logically equivalent to `¬ (∃ x : A, P x)`
-/
theorem level7 {A : Type} (P : A → Prop) : (∀ x : A, ¬ (P x)) ↔ ¬ (∃ x : A, P x) := by
  sorry

/--
### Level 8
Given a family of propositions `P : A → Prop`, `∃ x : A, ¬ (P x)` implies `¬ (∀ x : A, P x)`
-/
theorem level8 {A : Type} (P : A → Prop) : (∃ x : A, ¬ (P x)) → ¬ (∀ x : A, P x) := by
  sorry

/--
### Level 9
Given a family of propositions `P : A → Prop`, using classical logic, `¬ (∀ x : A, P x)` implies `∃ x : A, ¬ (P x)`.
-/
theorem level9 {A : Type} (P : A → Prop) : ¬ (∀ x : A, P x) → (∃ x : A, ¬ (P x)) := by
  sorry

end RTPNotes.Worlds.Quantifier
