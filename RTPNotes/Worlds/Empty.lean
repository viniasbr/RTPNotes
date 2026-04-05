import RTPNotes.Common

/-!
Empty World
-/

namespace RTPNotes.Worlds.Empty

/--
### Level 1
For any type `A`, there is a function `Empty → A` encoding the elimination rule of the empty type.
-/
def level1 {A : Type} : Empty → A := by
  intro h
  cases h
/--
### Level 2
For any type `A`, if there is a function `f : A → Empty` and there is an element `a : A`, then there is an element of the `Empty` type.
-/
def level2 {A : Type} : (A → Empty) → A → Empty := by
  intro h
  intro a
  have e := h a
  exact e

/--
### Level 3
For any types `A` and `B`, if there is a function `f : A → Empty` then there is also a function `A → B`.
-/
def level3 {A B : Type} : (A → Empty) → A → B := by
  intro h
  intro a
  have e := h a
  have b : B := Empty.elim e
  exact b

/--
### Level 4
For any types `A` and `B`, there is a function `(A → B) → (B → Empty) → (A → Empty)` defined by composition.
-/
def level4 {A B : Type} : (A → B) → (B → Empty) → (A → Empty) := by
  intro h1 h2 a
  exact h2 (h1 a)

/--
### Level 5
For any type `A`, there are functions in both directions between the types `Empty` and `A × Empty`.
-/
def level5 {A : Type} : (Empty → A × Empty) × (A × Empty → Empty) := by
  constructor
  intro e
  have a : A := Empty.elim e
  exact ⟨a,e⟩

  intro axe
  exact axe.2

/--
### Level 6
For any type `A`, there are functions in both directions between the types `A` and `A ⊕ Empty`.
-/
def level6 {A : Type} : (A → A ⊕ Empty) × (A ⊕ Empty → A) := by
  constructor
  intro a
  exact Sum.inl a

  intro aoe
  rcases aoe with a | e
  exact a
  exact Empty.elim e

/--
### Level 7
There are functions in both directions between the types `Empty ⊕ (Empty → Empty)` and `(Empty → Empty) × (Empty → Empty)`.
-/
def level7 : (Empty ⊕ (Empty → Empty) → (Empty → Empty) × (Empty → Empty)) × ((Empty → Empty) × (Empty → Empty) → Empty ⊕ (Empty → Empty)) := by
  constructor
  intro h1
  rcases h1 with e | ete
  constructor
  intro
  exact e
  intro
  exact e
  constructor
  exact ete
  exact ete

  intro h1
  have ete := h1.1
  exact Sum.inr ete

end RTPNotes.Worlds.Empty
