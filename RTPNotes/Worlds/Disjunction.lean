import RTPNotes.Common

/-!
Disjunction World
-/

namespace RTPNotes.Worlds.Disjunction

/--
### Level 1
There are two ways to prove `P ∨ Q` from the given hypotheses. Can you find them both?
-/
theorem level1 {P Q : Prop} (p : P) (q : Q) : P ∨ Q := by
  sorry

/--
### Level 2
`P ∧ Q` implies `P ∨ Q`.
-/
theorem level2 {P Q : Prop} : P ∧ Q → P ∨ Q := by
  sorry

/--
### Level 3
For propositions `P` and `Q`, `Or.symm` is a proof that `P ∨ Q → Q ∨ P`.
-/
theorem level3 {P Q : Prop} : P ∨ Q → Q ∨ P := by
  sorry

/--
### Level 4
`P ∨ Q` is true if and only if `Q ∨ P` is true.
-/
theorem level4 {P Q : Prop} : P ∨ Q ↔ Q ∨ P := by
  sorry

/--
### Level 5
`P ∨ Q → R` is true if and only if `(P → R) ∧ (Q → R)` is true.
-/
theorem level5 {P Q R : Prop} : (P ∨ Q → R) ↔ (P → R) ∧ (Q → R) := by
  sorry

/--
### Level 6
Or is associative: `(P ∨ Q) ∨ R` is true if and only if `P ∨ (Q ∨ R)` is true.
-/
theorem level6 {P Q R : Prop} : (P ∨ Q) ∨ R ↔ P ∨ Q ∨ R := by
  sorry

/--
### Level 7
Conjunction distributes over disjunction: `P ∧ (Q ∨ R)` and `(P ∧ Q) ∨ (P ∧ R)` are logically equivalent.
-/
theorem level7 {P Q R : Prop} : P ∧ (Q ∨ R) ↔ (P ∧ Q) ∨ (P ∧ R) := by
  sorry

/--
### Level 8
`(P ∨ Q) ∧ (R ∨ S)` holds if and only if `(P ∧ R) ∨ (P ∧ S) ∨ (Q ∧ R) ∨ (Q ∧ S)` holds.
-/
theorem level8 {P Q R S : Prop} : (P ∨ Q) ∧ (R ∨ S) ↔ (P ∧ R) ∨ (P ∧ S) ∨ (Q ∧ R) ∨ (Q ∧ S) := by
  sorry

/--
### Level 9
If `T ∨ U → V ∧ Y` and `Q → P → T` and `Y → Q → W` and `(V ∧ W) ∨ (X ∧ Y) → Z` and `(R → S → U) ∧ (V → R → X)` then `P ∧ (Q ∨ R) ∧ S` implies `Z`.
-/
theorem level9 {P Q R S T U V W X Y Z : Prop} : (T ∨ U → V ∧ Y) → (Q → P → T) → (Y → Q → W) → ((V ∧ W) ∨ (X ∧ Y) → Z) → (R → S → U) ∧ (V → R → X) → P ∧ (Q ∨ R) ∧ S → Z := by
  sorry

end RTPNotes.Worlds.Disjunction
