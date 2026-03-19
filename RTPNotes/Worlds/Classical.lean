import RTPNotes.Common

/-!
Classical World
-/

namespace RTPNotes.Worlds.Classical

/--
### Level 1
In classical logic, for any proposition `P`, `¬ ¬ P` implies `P`.
-/
theorem level1 {P : Prop} : ¬ ¬ P → P := by
  sorry

/--
### Level 2
In classical logic, `¬ Q → ¬ P` implies `P → Q`.
-/
theorem level2 {P Q : Prop} : (¬ Q → ¬ P) → (P → Q) := by
  sorry

/--
### Level 3
In classical logic, for any propositions `P` and `Q`, `P ∧ Q` is true or `P ∧ ¬ Q` is true or `¬ P ∧ Q` is true or `¬ P ∧ ¬ Q` is true.
-/
theorem level3 {P Q : Prop} : (P ∧ Q) ∨ (P ∧ ¬ Q) ∨ (¬ P ∧ Q) ∨ (¬ P ∧ ¬ Q) := by
  sorry

/--
### Level 4
In classical logic, `¬ (P ∧ Q)` implies `¬ P ∨ ¬ Q`.
-/
theorem level4 {P Q : Prop} : ¬ (P ∧ Q) → ¬ P ∨ ¬ Q := by
  sorry

/--
### Level 5
In classical logic, for any propositions `P` and `Q`, `¬ (P → Q)` implies `P ∧ ¬ Q`.
-/
theorem level5 {P Q : Prop} : ¬ (P → Q) → P ∧ ¬ Q := by
  sorry

/--
### Level 6
In classical logic, for any proposition `P`, `P` is true or `¬ P` is true.
-/
theorem level6 {P : Prop} : P ∨ ¬ P := by
  sorry

end RTPNotes.Worlds.Classical
