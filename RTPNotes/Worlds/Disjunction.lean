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
  exact Or.inl p

/--
### Level 2
`P ∧ Q` implies `P ∨ Q`.
-/
theorem level2 {P Q : Prop} : P ∧ Q → P ∨ Q := by
  intro pnq
  exact Or.inl pnq.1

/--
### Level 3
For propositions `P` and `Q`, `Or.symm` is a proof that `P ∨ Q → Q ∨ P`.
-/
theorem level3 {P Q : Prop} : P ∨ Q → Q ∨ P := by
  intro poq
  rcases poq with p | q
  right
  exact p
  left
  exact q


/--
### Level 4
`P ∨ Q` is true if and only if `Q ∨ P` is true.
-/
theorem level4 {P Q : Prop} : P ∨ Q ↔ Q ∨ P := by
  constructor
  exact Or.symm
  exact Or.symm

/--
### Level 5
`P ∨ Q → R` is true if and only if `(P → R) ∧ (Q → R)` is true.
-/
theorem level5 {P Q R : Prop} : (P ∨ Q → R) ↔ (P → R) ∧ (Q → R) := by
  constructor

  intro h1
  constructor
  intro p
  have poq : P ∨ Q := Or.inl p
  exact h1 poq
  intro q
  have poq : P ∨ Q := Or.inr q
  exact h1 poq

  intro h2
  intro poq
  have h3 := h2.1
  have h4 := h2.2
  rcases poq with p | q
  exact h3 p
  exact h4 q

/--
### Level 6
Or is associative: `(P ∨ Q) ∨ R` is true if and only if `P ∨ (Q ∨ R)` is true.
-/
theorem level6 {P Q R : Prop} : (P ∨ Q) ∨ R ↔ P ∨ Q ∨ R := by
  constructor

  intro h1
  rcases h1 with poq | r
  rcases poq with p | q

  have x : P ∨ Q ∨ R := Or.inl p
  exact x
  have qor : Q ∨ R := Or.inl q
  have x : P ∨ Q ∨ R := Or.inr qor
  exact x
  have qor : Q ∨ R := Or.inr r
  have x : P ∨ Q ∨ R := Or.inr qor
  exact x

  intro h1
  rcases h1 with p | qor
  have poq : P ∨ Q := Or.inl p
  have x : (P ∨ Q) ∨ R := Or.inl poq
  exact x

  rcases qor with q | r
  have poq : P ∨ Q := Or.inr q
  have x : (P ∨ Q) ∨ R := Or.inl poq
  exact x
  have x : (P ∨ Q) ∨ R := Or.inr r
  exact x


/--
### Level 7
Conjunction distributes over disjunction: `P ∧ (Q ∨ R)` and `(P ∧ Q) ∨ (P ∧ R)` are logically equivalent.
-/
theorem level7 {P Q R : Prop} : P ∧ (Q ∨ R) ↔ (P ∧ Q) ∨ (P ∧ R) := by
  constructor

  intro h1
  have p := h1.1
  have qor := h1.2
  rcases qor with q | r
  exact Or.inl ⟨p,q⟩
  exact Or.inr ⟨p,r⟩

  intro h2
  rcases h2 with pnq | pnr
  have p := pnq.1
  have q := pnq.2
  have qor : Q ∨ R := Or.inl q
  exact ⟨p,qor⟩
  have p := pnr.1
  have r := pnr.2
  have qor : Q ∨ R := Or.inr r
  exact ⟨p,qor⟩


/--
### Level 8
`(P ∨ Q) ∧ (R ∨ S)` holds if and only if `(P ∧ R) ∨ (P ∧ S) ∨ (Q ∧ R) ∨ (Q ∧ S)` holds.
-/
theorem level8 {P Q R S : Prop} : (P ∨ Q) ∧ (R ∨ S) ↔ (P ∧ R) ∨ (P ∧ S) ∨ (Q ∧ R) ∨ (Q ∧ S) := by
  constructor

  intro h
  have poq := h.1
  have ros := h.2
  rcases poq with p | q
  rcases ros with r | s
  exact Or.inl ⟨p,r⟩
  have x : P ∧ S ∨ Q ∧ R ∨ Q ∧ S := Or.inl ⟨p,s⟩
  exact Or.inr x
  rcases ros with r | s
  have x : Q ∧ R ∨ Q ∧ S := Or.inl ⟨q,r⟩
  have y : P ∧ S ∨ Q ∧ R ∨ Q ∧ S := Or.inr x
  have z : P ∧ R ∨ P ∧ S ∨ Q ∧ R ∨ Q ∧ S := Or.inr y
  exact z
  have x : Q ∧ R ∨ Q ∧ S := Or.inr ⟨q,s⟩
  have y : P ∧ S ∨ Q ∧ R ∨ Q ∧ S := Or.inr x
  have z : P ∧ R ∨ P ∧ S ∨ Q ∧ R ∨ Q ∧ S := Or.inr y
  exact z

  intro h

  constructor
  rcases h with pnr | h1
  exact Or.inl pnr.1
  rcases h1 with pns | h2
  exact Or.inl pns.1
  rcases h2 with qnr | qns
  exact Or.inr qnr.1
  exact Or.inr qns.1

  rcases h with pnr | h1
  exact Or.inl pnr.2
  rcases h1 with pns | h2
  exact Or.inr pns.2
  rcases h2 with qnr | qns
  exact Or.inl qnr.2
  exact Or.inr qns.2

/--
### Level 9
If `T ∨ U → V ∧ Y` and `Q → P → T` and `Y → Q → W` and `(V ∧ W) ∨ (X ∧ Y) → Z` and `(R → S → U) ∧ (V → R → X)` then `P ∧ (Q ∨ R) ∧ S` implies `Z`.
-/
theorem level9 {P Q R S T U V W X Y Z : Prop} : (T ∨ U → V ∧ Y) → (Q → P → T) → (Y → Q → W) → ((V ∧ W) ∨ (X ∧ Y) → Z) → (R → S → U) ∧ (V → R → X) → P ∧ (Q ∨ R) ∧ S → Z := by
  intro h1 h2 h3 h4 h5 h6
  have p := h6.1
  have qor := h6.2.1
  have s := h6.2.2
  have h7 := h5.1
  have h8 := h5.2
  apply h4
  rcases qor with q | r
  have t := h2 q p
  have vny := h1 (Or.inl t)
  have v := vny.1
  have y := vny.2
  have w := h3 y q
  exact Or.inl ⟨v,w⟩

  have u := h7 r s
  have vny := h1 (Or.inr u)
  have v := vny.1
  have y := vny.2
  have x := h8 v r
  exact Or.inr ⟨x,y⟩

end RTPNotes.Worlds.Disjunction
