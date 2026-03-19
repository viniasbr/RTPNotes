import RTPNotes.Common

/-!
Function World
-/

/--
### Level 1
For a type `A`, the identity function `id : A → A` is the function defined by sending and arbitrary element `a : A` to itself.
-/
def level1 {A : Type} : A → A := by
  intro a
  exact a

/--
### Level 2
Given a function `f : A → B` and an element `a : A`, there is an element `f a : B` obtained by evaluating the function `f` at `a`.
-/
def level2 {A B : Type} (a : A) (f : A → B) : B := by
  exact f a

/--
### Level 3
Given a function `f : A → B` and an element `a : A`, there is an element `f a : B` obtained by evaluating the function `f` at `a`.
-/
def level3 {A B : Type} (a : A) (f : A → B) : B := by
  apply f
  exact a

/--
### Level 4
Given functions `g : B → C` and `f : A → B`, define the composite function `g ∘ f : A → C` that sends `x : A to g (f x)`.
-/
def level4 {A B C : Type} (g : B → C) (f : A → B) : A → C := by
  exact fun x ↦ g (f x)

/--
### Level 5
For any types `A` and `B` and element `a : A`, there is a constant function const `a : B → A` that sends any `x : B` to the element `a : A`.
-/
def level5 {A B : Type} (a : A) : B → A := by
  exact fun _ ↦ a
