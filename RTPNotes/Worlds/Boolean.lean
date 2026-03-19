import RTPNotes.Common

/-!
Boolean World
-/

namespace RTPNotes.Worlds.Boolean

open Bool

/--
### Level 1
The negation function `not : Bool → Bool` sends the boolean `false` to `true` and `true` to `false`.
-/
theorem level1 : ∃ f : Bool → Bool, f true = false ∧ f false = true := by
  sorry

/--
### Level 2
For any `b : Bool`, `b = not (not b)`.
-/
theorem level2 (b : Bool) : b = not (not b) := by
  sorry

/--
### Level 3
There is a function `and : Bool → Bool → Bool` that captures the logical operation of conjunction.
-/
theorem level3 : ∃ f: Bool → Bool → Bool, f true true = true ∧ f false true = false ∧ f true false = false ∧ f false false = false := by
  sorry

/--
### Level 4
The function `and : Bool → Bool → Bool` is symmetric.
-/
theorem level4 (x y : Bool) : and x y = and y x := by
  sorry

/--
### Level 5
There is a function `or : Bool → Bool → Bool` that captures the logical operation of conjunction.
-/
theorem level5 : ∃ f: Bool → Bool → Bool, f true true = true ∧ f false true = true ∧ f true false = true ∧ f false false = false := by
  sorry

/--
### Level 6
The function `or : Bool → Bool → Bool` is symmetric.
-/
theorem level6 (x y : Bool) : or x y = or y x := by
  sorry

/--
### Level 7
The DeMorgan equalities relate the operations of conjunction, disjunction, and negation on booleans.
-/
theorem level7 (x y : Bool) : (not (and x y) = or (not x) (not y)) ∧ (not (or x y) = and (not x) (not y)) := by
  sorry

/--
### Level 8
The elements `false : Bool` and `true : Bool` are not equal.
-/
theorem level8 : ¬ (false = true) := by
  sorry

/--
### Level 9
The following expression in conjunctive normal form is satisfiable.
-/
theorem level9 : ∃ p : Bool, ∃ q : Bool, ∃ r : Bool, and (not p || q) (and (not q || p) (and (not p || not r) (and (not q || not r) (p || q)))) = true := by
  sorry

end RTPNotes.Worlds.Boolean
