import RTPNotes.Common

/-!
Implication World
-/

namespace RTPNotes.Worlds.Implication

/--
### Level 1
If the proposition `P` is true, then `P` is true.-/
theorem level1 {P : Prop} (p : P) : P := by
  exact p

/--
### Level 2
If `P` is true and `P → Q `is true, then `Q` is true.
-/
theorem level2 {P Q : Prop} (p : P) (h : P → Q) : Q := by
  apply h
  exact p

/--
### Level 3
If `P` is true and `P → Q` is true, then `Q` is true.
-/
theorem level3 {P Q : Prop} (p : P) (h : P → Q) : Q := by
  exact h p

/--
### Level 4
If `P` is true, `P → Q` is true, and `Q → R` is true, then `R` is true.
-/
theorem level4 {P Q R : Prop} (p : P) (h1 : P → Q) (h2 : Q → R) : R := by
  have q := h1 p
  have r := h2 q
  exact r

/--
### Level 5
For any proposition `P`, `P` implies `P` is true.
-/
theorem level5 {P : Prop} : P → P := by
  intro p
  exact p

/--
### Level 6
If `P` is true, then for any proposition `Q`, `Q → P` is always true.
-/
theorem level6 {P Q : Prop} (p : P) : Q → P := by
  exact fun _ ↦ p

/--
### Level 7
If `P → Q` is true, then `P → Q` is true.
-/
theorem level7 {P Q : Prop} (h : P → Q) : P → Q := by
  exact h

/--
### Level 8
If `P → Q`, then if `Q → R`, then `P → R`.
-/
theorem level8 {P Q R : Prop} : (P → Q) → (Q → R) → (P → R) := by
  intro h1
  intro h2
  intro p
  have q := h1 p
  have r := h2 q
  exact r

/--
### Level 9
If `P` is true, then if `P → Q` is true, then `Q` is true.
-/
theorem level9 {P Q : Prop} : P → (P → Q) → Q := by
  intro p
  intro h
  exact h p

/--
### Level 10
If `S → X`, `T → W`, `R → Y`, `W → Q`, `U → S`, `Y → T`, `X → V`, `Q → U`, `V → Z` and `P → R` are true then `P` implies `Z`.
-/
theorem level10 {P Q R S T U V W X Y Z : Prop} : (S → X) → (T → W) → (R → Y) → (W → Q) → (U → S) → (Y → T) → (X → V) → (Q → U) → (V → Z) → (P → R) → P → Z := by
  intro stx ttw rty wtq uts ytt xtv qtu vtz ptr p
  apply vtz
  apply xtv
  apply stx
  apply uts
  apply qtu
  apply wtq
  apply ttw
  apply ytt
  apply rty
  apply ptr
  exact p

end RTPNotes.Worlds.Implication
