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
  let f : A × B → B × A := by
    intro axb
    exact axb.swap
  let g : B × A → A × B := by
    intro bxa
    exact bxa.swap
  let α : ∀ axb : A × B, g (f axb) = axb := by
    intro axb
    rfl
  let β : ∀ bxa : B × A, f (g bxa) = bxa := by
    intro bxa
    rfl
  exact ⟨f,g,α,β⟩

/--
### Level 2
For any types `A` and `B`, the coproduct types `A ⊕ B` and `B ⊕ A` are equivalent.
-/
def level2 {A B : Type} : (A ⊕ B) ≃ (B ⊕ A) := by
  let f : A ⊕ B → B ⊕ A := by
    intro apb
    rcases apb with a | b
    ·exact Sum.inr a
    ·exact Sum.inl b
  let g : B ⊕ A → A ⊕ B := by
    intro bpa
    rcases bpa with b | a
    ·exact Sum.inr b
    ·exact Sum.inl a
  let α : ∀ apb : A ⊕ B, g (f apb) = apb := by
    intro apb
    cases apb <;> rfl
  let β : ∀ bpa : B ⊕ A, f (g bpa) = bpa := by
    intro bpa
    cases bpa <;> rfl
  exact ⟨f,g,α,β⟩

/--
### Level 3
For any types `A`, `B`, and `C`, the function types `A → B → C` and `B → A → C` are equivalent.
-/
def level3 {A B C : Type} : (A → B → C) ≃ (B → A → C) := by
  let f : (A → B → C) → (B → A → C) := by
    intro h b a
    exact h a b
  let g : (B → A → C) → (A → B → C) := by
    intro h a b
    exact h b a
  let α : ∀ h : (A → B → C), g (f h) = h := by
    intro h
    rfl
  let β : ∀ h : (B → A → C), f (g h) = h := by
    intro h
    rfl
  exact ⟨f,g,α,β⟩

/--
### Level 4
For any types `A`, `B`, and `C`, the function types `A × B → C` and `A → B → C` are equivalent.
-/
def level4 {A B C : Type} : (A × B → C) ≃ (A → B → C) := by
  let f : (A × B → C) → (A → B → C) := by
    intro h a b
    exact h ⟨a,b⟩
  let g : (A → B → C) → (A × B → C) := by
    intro h axb
    exact h axb.1 axb.2
  let α : ∀ h : (A × B → C), g (f h) = h := by
    intro h
    rfl
  let β : ∀ h : (A → B → C), f (g h) = h := by
    intro h
    rfl
  exact ⟨f,g,α,β⟩

/--
### Level 5
For any types `X`, `A`, and `B`, the types `X → A × B` and `(X → A) × (X → B)` are equivalent.
-/
def level5 {X A B : Type} : (X → A × B) ≃ (X → A) × (X → B) := by
  let f : (X → A × B) → (X → A) × (X → B) := by
    intro h
    constructor
    ·intro x
     exact (h x).1
    ·intro x
     exact (h x).2
  let g : (X → A) × (X → B) → (X → A × B) := by
    intro h x
    exact ⟨h.1 x, h.2 x⟩
  exact ⟨f,g, fun h ↦ rfl, fun h ↦ rfl⟩
/--
### Level 6
For any types `A`, `B`, and `C`, the types `A ⊕ B → C` and `(A → C) × (B → C)` are equivalent.
-/
def level6 {A B C : Type} : (A ⊕ B → C) ≃ (A → C) × (B → C) := by
  let f : (A ⊕ B → C) → (A → C) × (B → C) := by
    intro h
    constructor
    ·intro a
     exact h (Sum.inl a)
    ·intro b
     exact h (Sum.inr b)
  let g : (A → C) × (B → C) → (A ⊕ B → C):= by
    intro h apb
    rcases apb with a | b
    ·exact h.1 a
    ·exact h.2 b
  let α : ∀ h : (A ⊕ B → C), g (f h) = h := by
    intro h
    ext apb
    cases apb <;> rfl
  let β : ∀ h : (A → C) × (B → C), f (g h) = h := by
    intro h
    rfl
  exact ⟨f,g,α,β⟩
/--
### Level 7
The types `Unit ⊕ Unit` and `Bool` are equivalent.
-/
def level7 : Unit ⊕ Unit ≃ Bool := by
  let f : Unit ⊕ Unit → Bool := by
    intro u1pu2
    rcases u1pu2 with u1 | u2
    ·exact false
    ·exact true
  let g : Bool → Unit ⊕ Unit := by
    intro b
    rcases b with false | true
    ·exact Sum.inl ⟨⟩
    ·exact Sum.inr ⟨⟩
  let α : ∀ upu : Unit ⊕ Unit, g (f upu) = upu := by
    intro upu
    cases upu <;> rfl
  let β: ∀ b : Bool, f (g b) = b := by
    intro b
    cases b <;> rfl
  exact ⟨f,g,α,β⟩


end RTPNotes.Worlds.Equivalence
