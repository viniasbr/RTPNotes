import RTPNotes.Common

/-!
Product World
-/

namespace RTPNotes.Worlds.Product

/--
### Level 1
By pairing any element `a : A` with any element `b : B`, there is an element `⟨a, b⟩ : A × B`.
-/
def level1 {A B : Type} (a : A) (b : B) : A × B := by
  sorry

/--
### Level 2
Define the canonical function projecting from a product type to its first argument.
-/
def level2 {A B : Type} : A × B → A := by
  sorry

/--
### Level 3
Define the canonical function projecting from a product type to its second argument.
-/
def level3 {A B : Type} : A × B → B := by
  sorry

/--
### Level 4
Product types are symmetric: an element of type `A × B` has a corresponding element of type `B × A` with components swapped.
-/
def level4 {A B : Type} : A × B → B × A := by
  sorry

/--
### Level 5
Product types are associative: for types `A`, `B`, and `C`, there are canonical functions in each direction between the types `(A × B) × C` and `A × (B × C)`.
-/
def level5 {A B C : Type} : (((A × B) × C) → (A × (B × C))) × ((A × (B × C)) → ((A × B) × C)) := by
  sorry

/--
### Level 6
Define the currying function, convering a function out of a product type into a function of two variables.
-/
def level6 {A B C : Type} : (A × B → C) → (A → B → C) := by
  sorry

/--
### Level 7
Define the uncurrying function, convering a function of two variables into a function out of a product type.
-/
def level7 {A B C : Type} : (A → B → C) → (A × B → C) := by
  sorry

/--
### Level 8
A function into a product type decomposes into a pair of component functions.
-/
def level8 {X A B : Type} : (X → A × B) → (X → A) × (X → B) := by
  sorry

/--
### Level 9
A pair of functions `g : X → A` and `h : X → A` may be combined into a single function from `X` to the product type `A × B`.
-/
def level9 {X A B : Type} : (X → A) × (X → B) → (X → A × B) := by
  sorry

/--
### Level 10
Given functions of types `B × D → M`, `E → Y × N`, `A → M → X`, and `C → N → Z`, there is a function from the product type `A × B × C × D × E` to the product type `X × Y × Z`.
-/
def level10 {A B C D E M N X Y Z : Type} : (B × D → M) → (E → Y × N) → (A → M → X) → (C → N → Z) → (A × B × C × D × E → X × Y × Z) := by
  sorry

end RTPNotes.Worlds.Product
