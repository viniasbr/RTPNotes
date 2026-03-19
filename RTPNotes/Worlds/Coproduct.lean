import RTPNotes.Common

/-!
Coproduct World
-/

namespace RTPNotes.Worlds.Coproduct

/--
### Level 1
For any `a : A`, there is an element `Sum.inl a : A ⊕ B`.
-/
def level1 {A B : Type} (a : A) : A ⊕ B := by
  sorry

/--
### Level 2
For any `b : B`, there is an element `Sum.inr b : A ⊕ B`.
-/
def level2 {A B : Type} (b : B) : A ⊕ B := by
  sorry

/--
### Level 3
A function of type `A ⊕ B → C` may be split into component functions of types `A → C` and `B → C`.
-/
def level3 {A B C : Type} : (A ⊕ B → C) → (A → C) × (B → C) := by
  sorry

/--
### Level 4
Two functions `g : A → C` and `h : B → C` combine to define a single function of type `A ⊕ B → C`.
-/
def level4 {A B C : Type} (g : A → C) (h : B → C) : (A ⊕ B → C) := by
  sorry

/--
### Level 5
For any types `A` and `B`, there is a canonical function of type `A ⊕ B → B ⊕ A`.
-/
def level5 {A B : Type} : A ⊕ B → B ⊕ A := by
  sorry

/--
### Level 6
For types `A`, `B`, and `C`, there are canonical functions between the types `(A ⊕ B) ⊕ C` and `A ⊕ (B ⊕ C)`.
-/
def level6 {A B C : Type} : (((A ⊕ B) ⊕ C) → (A ⊕ (B ⊕ C))) × ((A ⊕ (B ⊕ C)) → ((A ⊕ B) ⊕ C)) := by
  sorry

/--
### Level 7
For types `A`, `B`, and `C`, there are canonical functions between the types `A × (B ⊕ C)` and `(A × B) ⊕ (A × C)`.
-/
def level7 {A B C : Type} : (A × (B ⊕ C) → (A × B) ⊕ (A × C)) × ((A × B) ⊕ (A × C) → A × (B ⊕ C)) := by
  sorry

/--
### Level 8
A function of type `A ⊕ B → C × D` can be broken into component functions of type `(A → C) × (B → C) × (A → D) × (B → D)` and conversely the component functions assemble into a function from the coproduct type to the product type.
-/
def level8 {A B C D : Type} : ((A ⊕ B → C × D) → (A → C) × (B → C) × (A → D) × (B → D)) × ((A → C) × (B → C) × (A → D) × (B → D) → (A ⊕ B → C × D)) := by
  sorry

end RTPNotes.Worlds.Coproduct
