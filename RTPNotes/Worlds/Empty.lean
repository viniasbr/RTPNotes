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
  sorry

/--
### Level 2
For any type `A`, if there is a function `f : A → Empty` and there is an element `a : A`, then there is an element of the `Empty` type.
-/
def level2 {A : Type} : (A → Empty) → A → Empty := by
  sorry

/--
### Level 3
For any types `A` and `B`, if there is a function `f : A → Empty` then there is also a function `A → B`.
-/
def level3 {A B : Type} : (A → Empty) → A → B := by
  sorry

/--
### Level 4
For any types `A` and `B`, there is a function `(A → B) → (B → Empty) → (A → Empty)` defined by composition.
-/
def level4 {A B : Type} : (A → B) → (B → Empty) → (A → Empty) := by
  sorry

/--
### Level 5
For any type `A`, there are functions in both directions between the types `Empty` and `A × Empty`.
-/
def level5 {A : Type} : (Empty → A × Empty) × (A × Empty → Empty) := by
  sorry

/--
### Level 6
For any type `A`, there are functions in both directions between the types `A` and `A ⊕ Empty`.
-/
def level6 {A : Type} : (A → A ⊕ Empty) × (A ⊕ Empty → A) := by
  sorry

/--
### Level 7
There are functions in both directions between the types `Empty ⊕ (Empty → Empty)` and `(Empty → Empty) × (Empty → Empty)`.
-/
def level7 : (Empty ⊕ (Empty → Empty) → (Empty → Empty) × (Empty → Empty)) × ((Empty → Empty) × (Empty → Empty) → Empty ⊕ (Empty → Empty)) := by
  sorry

end RTPNotes.Worlds.Empty
