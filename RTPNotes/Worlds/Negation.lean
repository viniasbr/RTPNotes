import RTPNotes.Common

/-!
Negation World
-/

namespace RTPNotes.Worlds.Negation

/--
### Level 1
For any proposition `P`, the implication `False → P` is true.
-/
theorem level1 {P : Prop} : False → P := by
  sorry

/--
### Level 2
For any proposition `P`, if `¬ P` and `P` are both true, then we obtain a proof of `False`.
-/
theorem level2 {P : Prop} : ¬ P → P → False := by
  sorry

/--
### Level 3
For any proposition `P`, `P → ¬ ¬ P`.
-/
theorem level3 {P : Prop} : P → ¬ ¬ P := by
  sorry

/--
### Level 4
For any proposition `P`, `¬ (P ∧ ¬ P)`.
-/
theorem level4 {P : Prop} : ¬ (P ∧ ¬ P) := by
  sorry

/--
### Level 5
It is possible to prove any proposition `Q` from the hypothesis that both `P` and `¬ P` are true.
-/
theorem level5 {P Q : Prop} : P → ¬ P → Q := by
  sorry

/--
### Level 6
For any propositions `P` and `Q`, if `P → Q` holds then `¬ Q → ¬ P` also holds.
-/
theorem level6 {P Q : Prop} : (P → Q) → ¬ Q → ¬ P := by
  sorry

/--
### Level 7
For any propositions `P` and `Q`, if `P` is true and `Q` is false, then `P → Q` is not true.
-/
theorem level7 {P Q : Prop} : P ∧ ¬ Q → ¬ (P → Q) := by
  sorry

/--
### Level 8
For any propositions `P` and `Q`, the propositions `¬ (P ∨ Q)` and `¬ P ∧ ¬ Q` are logically equivalent.
-/
theorem level8 {P Q : Prop} : ¬ (P ∨ Q) ↔ ¬ P ∧ ¬ Q := by
  sorry

/--
### Level 9
For any propositions `P` and `Q`, if `P` is false or `Q` is false then `P ∧ Q` is false.
-/
theorem level9 {P Q : Prop} : ¬ P ∨ ¬ Q → ¬ (P ∧ Q) := by
  sorry

/--
### Level 10
For any proposition `P`, `¬ P` is logically equivalent to `¬ ¬ ¬ P`.
-/
theorem level10 {P : Prop} : ¬ P ↔ ¬ ¬ ¬ P := by
  sorry

/--
### Level 11
The law of excluded middle implies double negation elimination: for any proposition `P`, `P ∨ ¬ P` implies `¬ ¬ P → P`.
-/
theorem level11 {P : Prop} : P ∨ ¬ P → (¬ ¬ P → P) := by
  sorry

end RTPNotes.Worlds.Negation
