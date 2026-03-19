import RTPNotes.Common
import Mathlib.Logic.Equiv.Basic

/-!
Dependent World
-/

namespace RTPNotes.Worlds.Dependent

/--
### Level 1
Define any dependent family of types indexed by the type of booleans.
-/
def level1 : (Bool → Type) := by
  sorry

/--
### Level 2
The polymorphic identity function has type `(A : Type) → A → A`.
-/
def level2 : (A : Type) → A → A := by
  sorry

/--
### Level 3
Given a pair of type families `B C : A → Type` and a fiberwise function `f : (x : A) → B x → C x`, then there is a function from sections of the first type family to sections of the second type family.
-/
def level3 {A : Type} {B C : A → Type} (f : (x : A) → B x → C x) : ((y : A) → B y) → ((z : A) → C z) := by
  sorry

/--
### Level 4
The dependent pair type `(x : A) × B x` has a pair of projection functions, sending a dependent pair to its first and second components respectively.
-/
def level4 {A : Type} {B : A → Type} : ((x : A) × B x → A) × ((p : (x : A) × B x) → B p.1) := by
  sorry

/--
### Level 5
There is an equivalence between the type of dependent functions out of the dependent pair type `(x : A) × B x` and the type of dependent functions of two variables `x : A` and `y : B x` defined by currying and uncurrying.
-/
def level5 {A : Type} {B : A → Type} {C : (x : A) × B x → Type} : ((p : (x : A) × B x) → C p) ≃ ((x : A) → (y : B x) → C ⟨x, y⟩) := by
  sorry

/--
### Level 6
The type theoretic axiom of choice characterizes dependent functions into a dependent pair type.
-/
def level6 {A : Type} {B : A → Type} (C : (x : A) → B x → Type) : ((x : A) → (y : B x) × C x y) ≃ ((s : (x : A) → B x) × ((x : A) → C x (s x))) := by
  sorry

end RTPNotes.Worlds.Dependent
