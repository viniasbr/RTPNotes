import RTPNotes.Common

/-!
Function World
-/

namespace RTPNotes.Worlds.Function

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

/--
### Level 6
Given an element `a : A` and a function of two variables `f : A → B → C`, define a function from `B → C` by evaluating the first variable of `f` at the element `a`.
-/
def level6 {A B C : Type} (a : A) (f : A → B → C) : B → C := by
  exact f a

/--
### Level 7
From a function of two variables, define another function of two variables, where the inputs are swapped.
-/
def level7 {A B C : Type} : (A → B → C) → (B → A → C) := by
  intro f b a
  exact f a b

/--
### Level 8
Define the composition of two functions as a multivariable function between function types.
-/
def level8 {A B C : Type}: (B → C) → (A → B) → (A → C) := by
  intro f g a
  apply f
  apply g
  exact a

/--
### Level 9
Define the evaluation function that takes `a : A` and `f : A → B` to `f a : B`.
-/
def level9 {A B : Type} : A → (A → B) → B := by
  intro a
  intro f
  exact f a

/--
### Level 10
Given a function of type `((((V → F) → F) → F) → F)` there is a canonically defined function of type `(V → F) → F`.
-/

def level10 {F V : Type} : ((((V → F) → F) → F) → F) → ((V → F) → F) := by
  intro f
  intro g
  apply f
  intro h
  apply h
  exact g

end RTPNotes.Worlds.Function
