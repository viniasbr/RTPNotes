import RTPNotes.Common

/-!
Conjunction World
-/

namespace RTPNotes.Worlds.Conjunction

/--
### Level 1
If `P` is true and `Q` is true, then `P ∧ Q` is true.
-/
theorem level1 {P Q : Prop} (p : P) (q : Q) : P ∧ Q := by
  constructor
  exact p
  exact q

/--
### Level 2
If `P ∧ Q` is true then `P ∧ Q` is true.
-/
theorem level2 {P Q : Prop} (h : P ∧ Q) : P ∧ Q := by
  exact h

/--
### Level 3
`P ∧ Q` implies `Q ∧ P`.
-/
theorem level3 {P Q : Prop} : P ∧ Q → Q ∧ P := by
  intro h
  exact ⟨h.2,h.1⟩

/--
### Level 4
`P ∧ Q` is true if and only if `Q ∧ P` is true.
-/
theorem level4 {P Q : Prop} : P ∧ Q ↔ Q ∧ P := by
  constructor
  intro h
  exact And.symm h
  intro h
  exact And.symm h

/--
### Level 5
Conjunction is associative: `(P ∧ Q) ∧ R` is true if and only if `P ∧ (Q ∧ R)` is true.
-/
theorem level5 {P Q R : Prop} : (P ∧ Q) ∧ R ↔ P ∧ (Q ∧ R) := by
  constructor
  intro h
  exact ⟨h.1.1,⟨h.1.2,h.2⟩⟩
  intro h
  exact ⟨⟨h.1,h.2.1⟩,h.2.2⟩

/--
### Level 6
`P ∧ Q → R` implies `P → Q → R`.
-/
theorem level6 {P Q R : Prop} (h : P ∧ Q → R) : P → Q → R := by
  intro p q
  exact h ⟨p,q⟩

/--
### Level 7
`P → Q → R` implies `P ∧ Q → R`.
-/
theorem level7 {P Q R : Prop} (h : P → Q → R) : P ∧ Q → R := by
  intro h1
  exact h h1.1 h1.2

/--
### Level 8
`P ∧ Q → R` is true if and only if `P → Q → R` is true.
-/
theorem level8 {P Q R : Prop} : (P ∧ Q → R) ↔ (P → Q → R) := by
  constructor
  exact And.curry
  exact And.uncurry

/--
### Level 9
`(P → Q) ∧ (P → R)` is true if and only if `P → (Q ∧ R)` is true.
-/
theorem level9 {P Q R : Prop} : (P → Q) ∧ (P → R) ↔ P → Q ∧ R := by
  constructor
  intro h
  intro p
  exact ⟨h.1 p, h.2 p⟩
  intro h
  constructor
  intro p
  exact (h p).1
  intro p
  exact (h p).2

/--
### Level 10
If `P`, `R → S ∧ T`, `U → P → R`, `(U → Y) → Z`, `W ∧ T ∧ V → X ∧ Y`, and `S → V ∧ W` are true, then `Z` is true.
-/
theorem level10 {P Q R S T U V W X Y Z : Prop} : P → (R → S ∧ T) → (U → P → R) → ((U → Y) → Z) → (W ∧ T ∧ V → X ∧ Y) → (S → V ∧ W) → Z := by
  intro p
  intro h1
  intro h2
  intro h3
  intro h4
  intro h5
  apply h3
  intro u
  have r := h2 u p
  have snt := h1 r
  have vnw := h5 snt.1
  have xny := h4 ⟨vnw.2,⟨snt.2,vnw.1⟩⟩
  exact xny.2

end RTPNotes.Worlds.Conjunction
