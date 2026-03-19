import RTPNotes.Common

/-!
Equality World
-/

namespace RTPNotes.Worlds.Equality

/--
### Level 1
For any element `a : A`, `a = a` is true by reflexivity.
-/
theorem level1 {A : Type} {a : A} : a = a := by
  sorry

/--
### Level 2
A term `p : A × B` in a product type is definitionally equal to the pairing of its projections `⟨p.1, p.2⟩`.
-/
theorem level2 {A B : Type} (p : A × B) : p = ⟨p.1, p.2⟩ := by
  sorry

/--
### Level 3
If `a : A` and `b : B` then the projections of `⟨a, b⟩ : A × B` are definitionally equal to `a : A` and `b : B`, respectively.
-/
theorem level3 {A B : Type} (a : A) (b : B) : (⟨a , b⟩ : A × B).fst = a ∧ (⟨a , b⟩ : A × B).snd = b := by
  sorry

/--
### Level 4
Equality is symmetric: if `x = y` then `y = x`.
-/
theorem level4 {A : Type} {x y : A} (p : x = y) : y = x := by
  sorry

/--
### Level 5
Equality is transitive: if `x = y` and `y = z` then `x = z`.
-/
theorem level5 {A : Type} {x y z : A} (p : x = y) (q : y = z) : x = z := by
  sorry

/--
### Level 6
Functions are well-defined: if `f : A → B` and `x y : A` are equal, then `f x = f y`.
-/
theorem level6 {A B : Type} {x y : A} (f : A → B) (p : x = y) : f x = f y := by
  sorry

/--
### Level 7
The unit type is a proposition: for `x y : Unit`, `x = y`.
-/
theorem level7 {x y : Unit} : x = y := by
  sorry

/--
### Level 8
The empty type is a proposition: for `x y : Empty`, `x = y`.
-/
theorem level8 {x y : Empty} : x = y := by
  sorry

/--
### Level 9
The equality type is a proposition: for `x y : A` if `p q : x = y` then `p = q`
-/
theorem level9 {A : Type} {x y : A} (p q : x = y) : p = q := by
  sorry

/--
### Level 10
Functions out of product types are well-defined, both regarding equalities between elements and equalities between hypotheses.
-/
theorem level10 {A B C D : Type} {a a' : A} {b b' : B} (f g : A × B → C) (h k : C → D) (p : a = a') (q : b = b') (r : h ∘ f = k ∘ g) : h (f ⟨a, b⟩) = k (g ⟨a', b'⟩) := by
  sorry

end RTPNotes.Worlds.Equality
