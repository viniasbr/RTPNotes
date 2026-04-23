import RTPNotes.Common
import Mathlib.Data.Nat.Basic
import Mathlib.Tactic

set_option linter.style.longLine false

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
  exact ⟨rfl,rfl,rfl,rfl,rfl⟩

/--
### Level 2
Arithmetic equations involving explicit numerals such as `12 + 23 = 5 * (4 + 3)` hold by `rfl`.
-/
theorem level2 : (2 + 2 = 4) ∧ (1 + 5 = 2 * 3) ∧ (12 + 23 = 5 * (4 + 3)) ∧ (2 * 5 = 5 * 2) ∧ ((3 + 1) + 2 = 2 + (1 + 3)) := by
  exact ⟨rfl,rfl,rfl,rfl,rfl⟩

/--
### Level 3
Every natural number is even or odd.
-/
theorem level3 : ∀ n : ℕ , (∃ m : ℕ, n = 2 * m) ∨ (∃ m : ℕ, n = 2 * m + 1) := by
  intro n
  induction n with
  | zero =>
    left
    use 0
  | succ k hk =>
    rcases hk with even | odd
    ·let ⟨a,ha⟩ := even
     right
     use a
     rw [ha]
    ·let⟨b,hb⟩ := odd
     left
     use (b+1)
     rw [hb]
     rfl

/--
### Level 4
There is a function `pred : ℕ → ℕ` that sends `0` to `0` and `succ n` to `n`.
-/
theorem level4 : ∃ f : ℕ → ℕ, (f 0 = 0) ∧ (∀ n : ℕ, f (succ n) = n) := by
  let f : ℕ → ℕ := fun n ↦ match n with
  | zero => 0
  | succ n => n
  use f
  constructor
  ·rfl
  ·intro n
   rfl

/--
### Level 5
The composite of `succ : ℕ → ℕ` followed by `pred : ℕ → ℕ` is the identity function.
-/
theorem level5 : pred ∘ succ = id := by
  ext n
  rfl

/--
### Level 6
For all natural numbers `m` and `n`, `n + 0 = n` and `m + (succ n) = succ (m + n)`.
-/
theorem level6 : (∀ n : ℕ, (n + 0 = n)) ∧ (∀ m n : ℕ, m + (succ n) = succ (m + n)) := by
  constructor
  ·intro n
   rfl
  ·intro m n
   rfl

/--
### Level 7
For all natural numbers `n`, `n + 0 = n` and `0 + n = n`.
-/
theorem level7 : ∀ n : ℕ, (n + 0 = n) ∧ (0 + n = n) := by
  intro n
  constructor
  ·rfl
  ·induction n with
   |zero => rfl
   |succ k hk =>
    rw[add_succ, hk]


/--
### Level 8
For all natural numbers `m n`, `m + succ n = succ (m + n)` and `succ m + n = succ (m + n)`.
-/
theorem level8 : ∀ m n : ℕ, m + succ n = succ (m + n) ∧ succ m + n = succ (m + n) := by
  intro m n
  constructor
  ·rfl
  ·induction n with
    |zero =>
     rfl
    |succ k hk =>
     rw[add_succ, hk]
     rfl

/--
### Level 9
For all natural numbers `m n`, `m + n = n + m`.
-/
theorem level9 : ∀ m n : ℕ, m + n = n + m := by
  intro m n
  induction n with
  | zero =>
    rw[add_zero, zero_add]
  | succ k hk =>
    rw[add_succ,succ_add,hk]

/--
### Level 10
The successor function is injective.
-/
theorem level10 : ∀ m n : ℕ, succ m = succ n → m = n := by
  intro m n eq1
  have h1 : pred (succ m) = pred (succ n) := by
    rw[eq1]
  apply h1

/--
### Level 11
Zero is not the successor of any natural number.
-/
theorem level11 : ¬ (∃ n : ℕ, succ n = 0) := by
  intro h1
  let ⟨n,hn⟩ := h1
  cases hn

end RTPNotes.Worlds.NaturalNumbers
