import Mathlib
import RTPNotes.Common
set_option linter.style.longLine false

/-
Type World
-/

namespace RTPNotes.Worlds.Type


/-
Under the hypothesis that we have a type `A` and an element `a : A`, we may define an element of `A`.
-/
def level1 {A : Type} (a : A) : A := by
  exact a


/-
Under the hypothesis that we have a proposition `P` and a proof `p : P`, we may conclude that `P` is true.
-/
theorem level2 {P : Prop} (p : P) : P := by
  exact p

/-
Under the hypothesis that we have types `A` and `B` and elements `x : A` and `y z : B`,
we may define an element of type `B`.
-/
def level3 {A B : Type} (x : A) (y z : B) : B := by
  exact y

/-
The unit type `Unit` has a canonical element `⟨⟩`.
-/
def level4 : Unit := by
  exact ⟨⟩

/-
The type of propositions `Prop` contains propositions like `True`.
-/

def level5 (P Q : Prop) (p : P) : Prop := by
  exact True

/-
The elements of the type `Type` of types are types at the lowest universe level.
-/
def level6 : Type := by
  exact Unit

/-
The elements of the type `Type` of types are types at the lowest universe level.
-/
def level7 (P Q R : Prop) (q : Q) (r : R) : Type := by
  exact Prop

end RTPNotes.Worlds.Type
