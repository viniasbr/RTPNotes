import RTPNotes.Common
import Mathlib.Data.Nat.Basic

/-!
Natural Numbers World
-/

namespace RTPNotes.Worlds.NaturalNumbers

open Nat

/--
### Level 1
Explicit numerals `1`, `2`, `3`, `4`, and so on are defined as repeated successors of the previous numerals.
-/
theorem level1 : (1 = succ 0) ∧ (2 = succ 1) ∧ (3 = succ 2) ∧ (4 = succ 3) ∧ (9223372036854775809 = succ 9223372036854775808) := by
  sorry

/--
### Level 2
Arithmetic equations involving explicit numerals such as `12 + 23 = 5 * (4 + 3)` hold by `rfl`.
-/
theorem level2 : (2 + 2 = 4) ∧ (1 + 5 = 2 * 3) ∧ (12 + 23 = 5 * (4 + 3)) ∧ (2 * 5 = 5 * 2) ∧ ((3 + 1) + 2 = 2 + (1 + 3)) := by
  sorry

/--
### Level 3
Every natural number is even or odd.
-/
theorem level3 : ∀ n : ℕ , (∃ m : ℕ, n = 2 * m) ∨ (∃ m : ℕ, n = 2 * m + 1) := by
  sorry

/--
### Level 4
There is a function `pred : ℕ → ℕ` that sends `0` to `0` and `succ n` to `n`.
-/
theorem level4 : ∃ f : ℕ → ℕ, (f 0 = 0) ∧ (∀ n : ℕ, f (succ n) = n) := by
  sorry

/--
### Level 5
The composite of `succ : ℕ → ℕ` followed by `pred : ℕ → ℕ` is the identity function.
-/
theorem level5 : pred ∘ succ = id := by
  sorry

/--
### Level 6
For all natural numbers `m` and `n`, `n + 0 = n` and `m + (succ n) = succ (m + n)`.
-/
theorem level6 : (∀ n : ℕ, (n + 0 = n)) ∧ (∀ m n : ℕ, m + (succ n) = succ (m + n)) := by
  sorry

/--
### Level 7
For all natural numbers `n`, `n + 0 = n` and `0 + n = n`.
-/
theorem level7 : ∀ n : ℕ, (n + 0 = n) ∧ (0 + n = n) := by
  sorry

/--
### Level 8
For all natural numbers `m n`, `m + succ n = succ (m + n)` and `succ m + n = succ (m + n)`.
-/
theorem level8 : ∀ m n : ℕ, m + succ n = succ (m + n) ∧ succ m + n = succ (m + n) := by
  sorry

/--
### Level 9
For all natural numbers `m n`, `m + n = n + m`.
-/
theorem level9 : ∀ m n : ℕ, m + n = n + m := by
  sorry

/--
### Level 10
The successor function is injective.
-/
theorem level10 : ∀ m n : ℕ, succ m = succ n → m = n := by
  sorry

/--
### Level 11
Zero is not the successor of any natural number.
-/
theorem level11 : ¬ (∃ n : ℕ, succ n = 0) := by
  sorry

end RTPNotes.Worlds.NaturalNumbers
