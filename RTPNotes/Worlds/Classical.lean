import RTPNotes.Common
open Classical

/-!
Classical World
-/

namespace RTPNotes.Worlds.Classical

/--
### Level 1
In classical logic, for any proposition `P`, `¬ ¬ P` implies `P`.
-/
theorem level1 {P : Prop} : ¬ ¬ P → P := by
  exact byContradiction

/--
### Level 2
In classical logic, `¬ Q → ¬ P` implies `P → Q`.
-/
theorem level2 {P Q : Prop} : (¬ Q → ¬ P) → (P → Q) := by
  intro h
  intro p
  apply byContradiction
  intro nq
  have np := h nq
  exact np p

/--
### Level 3
In classical logic, for any propositions `P` and `Q`, `P ∧ Q` is true or `P ∧ ¬ Q` is true or `¬ P ∧ Q` is true or `¬ P ∧ ¬ Q` is true.
-/
theorem level3 {P Q : Prop} : (P ∧ Q) ∨ (P ∧ ¬ Q) ∨ (¬ P ∧ Q) ∨ (¬ P ∧ ¬ Q) := by
  have ponp : P ∨ ¬P := em P
  have qonq : Q ∨ ¬Q := em Q
  rcases ponp with p | np


  rcases qonq with q | nq

  left
  exact ⟨p,q⟩

  right
  left
  exact ⟨p,nq⟩


  rcases qonq with q | nq

  right
  right
  left
  exact ⟨np,q⟩

  right
  right
  right
  exact ⟨np,nq⟩





/--
### Level 4
In classical logic, `¬ (P ∧ Q)` implies `¬ P ∨ ¬ Q`.
-/
theorem level4 {P Q : Prop} : ¬ (P ∧ Q) → ¬ P ∨ ¬ Q := by
  have ponp := em P
  have qonq := em Q
  intro h
  rcases ponp with p | np


  rcases qonq with q | nq

  left
  intro p'
  exact h ⟨p,q⟩

  right
  exact nq


  rcases qonq with q | nq

  left
  exact np

  right
  exact nq

/--
### Level 5
In classical logic, for any propositions `P` and `Q`, `¬ (P → Q)` implies `P ∧ ¬ Q`.
-/
theorem level5 {P Q : Prop} : ¬ (P → Q) → P ∧ ¬ Q := by
  have ponp := em P
  intro h

  rcases ponp with p | np

  constructor
  exact p
  intro q
  apply h
  intro p
  exact q

  apply False.elim
  apply h
  intro p
  exact False.elim (np p)


/--
### Level 6
In classical logic, for any proposition `P`, `P` is true or `¬ P` is true.
-/
theorem level6 {P : Prop} : P ∨ ¬ P := by
  apply byContradiction
  intro h
  have t1 : ¬(P ∨ ¬P) → ¬P ∧ ¬¬P := by
    intro h'
    constructor

    intro p
    apply h
    exact Or.inl p

    intro np
    apply h
    exact Or.inr np
  have h1 := t1 h
  have p := byContradiction h1.2
  exact h1.1 p

end RTPNotes.Worlds.Classical
