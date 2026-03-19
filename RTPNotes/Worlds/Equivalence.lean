import RTPNotes.Common
import Mathlib.Logic.Equiv.Basic

/-!
Equivalence World
-/

namespace RTPNotes.Worlds.Equivalence

/--
### Level 1
For any types `A` and `B`, the product types `A × B` and `B × A` are equivalent.
-/
def level1 {A B : Type} : (A × B) ≃ (B × A) := by
  sorry

/--
### Level 2
For any types `A` and `B`, the coproduct types `A ⊕ B` and `B ⊕ A` are equivalent.
-/
def level2 {A B : Type} : (A ⊕ B) ≃ (B ⊕ A) := by
  sorry

/--
### Level 3
For any types `A`, `B`, and `C`, the function types `A → B → C` and `B → A → C` are equivalent.
-/
def level3 {A B C : Type} : (A → B → C) ≃ (B → A → C) := by
  sorry

/--
### Level 4
For any types `A`, `B`, and `C`, the function types `A × B → C` and `A → B → C` are equivalent.
-/
def level4 {A B C : Type} : (A × B → C) ≃ (A → B → C) := by
  sorry

/--
### Level 5
For any types `X`, `A`, and `B`, the types `X → A × B` and `(X → A) × (X → B)` are equivalent.
-/
def level5 {X A B : Type} : (X → A × B) ≃ (X → A) × (X → B) := by
  sorry

/--
### Level 6
For any types `A`, `B`, and `C`, the types `A ⊕ B → C` and `(A → C) × (B → C)` are equivalent.
-/
def level6 {A B C : Type} : (A ⊕ B → C) ≃ (A → C) × (B → C) := by
  sorry

/--
### Level 7
The types `Unit ⊕ Unit` and `Bool` are equivalent.
-/
def level7 : Unit ⊕ Unit ≃ Bool := by
  sorry

/--
### Level 8
Both the empty type and an arbitrary inhabited proposition `P` satisfy equivalences of the form `P ≃ (P → Empty) → Empty`
-/
def level8 : (Empty ≃ ((Empty → Empty) → Empty)) × (∀ P : Type, P → (∀ x y : P, x = y) → P ≃ ((P → Empty) → Empty)) := by
  sorry

end RTPNotes.Worlds.Equivalence
