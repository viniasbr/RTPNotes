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
  intro f
  cases f

/--
### Level 2
For any proposition `P`, if `¬ P` and `P` are both true, then we obtain a proof of `False`.
-/
theorem level2 {P : Prop} : ¬ P → P → False := by
  exact id

/--
### Level 3
For any proposition `P`, `P → ¬ ¬ P`.
-/
theorem level3 {P : Prop} : P → ¬ ¬ P := by
  intro p
  intro np
  exact np p

/--
### Level 4
For any proposition `P`, `¬ (P ∧ ¬ P)`.
-/
theorem level4 {P : Prop} : ¬ (P ∧ ¬ P) := by
  intro h1
  exact h1.2 h1.1

/--
### Level 5
It is possible to prove any proposition `Q` from the hypothesis that both `P` and `¬ P` are true.
-/
theorem level5 {P Q : Prop} : P → ¬ P → Q := by
  intro p
  intro np
  have f := np p
  exact False.elim f

/--
### Level 6
For any propositions `P` and `Q`, if `P → Q` holds then `¬ Q → ¬ P` also holds.
-/
theorem level6 {P Q : Prop} : (P → Q) → ¬ Q → ¬ P := by
  intro h
  intro nq
  intro p
  exact nq (h p)

/--
### Level 7
For any propositions `P` and `Q`, if `P` is true and `Q` is false, then `P → Q` is not true.
-/
theorem level7 {P Q : Prop} : P ∧ ¬ Q → ¬ (P → Q) := by
  intro h1
  intro h2
  exact h1.2 (h2 h1.1)

/--
### Level 8
For any propositions `P` and `Q`, the propositions `¬ (P ∨ Q)` and `¬ P ∧ ¬ Q` are logically equivalent.
-/
theorem level8 {P Q : Prop} : ¬ (P ∨ Q) ↔ ¬ P ∧ ¬ Q := by
  constructor


  intro h1
  constructor

  intro p
  exact h1 (Or.inl p)

  intro q
  exact h1 (Or.inr q)


  intro h2
  intro poq
  rcases poq with p | q
  exact h2.1 p
  exact h2.2 q
/--
### Level 9
For any propositions `P` and `Q`, if `P` is false or `Q` is false then `P ∧ Q` is false.
-/
theorem level9 {P Q : Prop} : ¬ P ∨ ¬ Q → ¬ (P ∧ Q) := by
  intro h
  intro pnq
  rcases h with np | nq
  exact np pnq.1
  exact nq pnq.2

/--
### Level 10
For any proposition `P`, `¬ P` is logically equivalent to `¬ ¬ ¬ P`.
-/
theorem level10 {P : Prop} : ¬ P ↔ ¬ ¬ ¬ P := by
  constructor
  intro np
  intro nnp
  exact nnp np

  intro nnnp
  intro p
  apply nnnp
  intro np
  exact np p


/--
### Level 11
The law of excluded middle implies double negation elimination: for any proposition `P`, `P ∨ ¬ P` implies `¬ ¬ P → P`.
-/
theorem level11 {P : Prop} : P ∨ ¬ P → (¬ ¬ P → P) := by
  intro ponp
  intro nnp
  rcases ponp with p | np
  exact p

  have f := nnp np
  exact False.elim f

end RTPNotes.Worlds.Negation
