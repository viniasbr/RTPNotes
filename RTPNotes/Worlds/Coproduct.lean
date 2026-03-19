import RTPNotes.Common

/-!
Coproduct World
-/

namespace RTPNotes.Worlds.Coproduct

/--
### Level 1
For any `a : A`, there is an element `Sum.inl a : A ⊕ B`.
-/
def level1 {A B : Type} (a : A) : A ⊕ B := by
  left
  exact a

/--
### Level 2
For any `b : B`, there is an element `Sum.inr b : A ⊕ B`.
-/
def level2 {A B : Type} (b : B) : A ⊕ B := by
  apply Sum.inr
  exact b

/--
### Level 3
A function of type `A ⊕ B → C` may be split into component functions of types `A → C` and `B → C`.
-/
def level3 {A B C : Type} : (A ⊕ B → C) → (A → C) × (B → C) := by
  intro f
  constructor
  intro a
  have apb : A ⊕ B := Sum.inl a
  exact f apb
  intro b
  have apb : A ⊕ B := Sum.inr b
  exact f apb



/--
### Level 4
Two functions `g : A → C` and `h : B → C` combine to define a single function of type `A ⊕ B → C`.
-/
def level4 {A B C : Type} (g : A → C) (h : B → C) : (A ⊕ B → C) := by
  intro apb
  rcases apb with a | b
  exact g a
  exact h b

/--
### Level 5
For any types `A` and `B`, there is a canonical function of type `A ⊕ B → B ⊕ A`.
-/
def level5 {A B : Type} : A ⊕ B → B ⊕ A := by
  intro apb
  rcases apb with a| b
  exact Sum.inr a
  exact Sum.inl b

/--
### Level 6
For types `A`, `B`, and `C`, there are canonical functions between the types `(A ⊕ B) ⊕ C` and `A ⊕ (B ⊕ C)`.
-/
def level6 {A B C : Type} : (((A ⊕ B) ⊕ C) → (A ⊕ (B ⊕ C))) × ((A ⊕ (B ⊕ C)) → ((A ⊕ B) ⊕ C)) := by
  constructor
  intro x
  rcases x with apb | c
  rcases apb with a | b
  have apbpc : A ⊕ B ⊕ C := Sum.inl a
  exact apbpc
  have apbpc: A ⊕ B ⊕ C := Sum.inr (Sum.inl b)
  exact apbpc
  have apbpc: A ⊕ B ⊕ C := Sum.inr (Sum.inr c)
  exact apbpc
  intro x
  rcases x with a | bpc
  have apbpc : (A ⊕ B) ⊕ C := Sum.inl (Sum.inl a)
  exact apbpc
  rcases bpc with b | c
  have apbpc : (A ⊕ B) ⊕ C := Sum.inl (Sum.inr b)
  exact apbpc
  have apbpc : (A ⊕ B) ⊕ C := Sum.inr c
  exact apbpc



/--
### Level 7
For types `A`, `B`, and `C`, there are canonical functions between the types `A × (B ⊕ C)` and `(A × B) ⊕ (A × C)`.
-/
def level7 {A B C : Type} : (A × (B ⊕ C) → (A × B) ⊕ (A × C)) × ((A × B) ⊕ (A × C) → A × (B ⊕ C)) := by
  constructor
  intro x
  have a := x.1
  have bpc := x.2
  rcases bpc with b | c
  exact Sum.inl ⟨a,b⟩
  exact Sum.inr ⟨a,c⟩
  intro x
  constructor
  rcases x with apb | apc
  exact apb.1
  exact apc.1
  rcases x with apb | apc
  exact Sum.inl apb.2
  exact Sum.inr apc.2


/--
### Level 8
A function of type `A ⊕ B → C × D` can be broken into component functions of type `(A → C) × (B → C) × (A → D) × (B → D)` and conversely the component functions assemble into a function from the coproduct type to the product type.
-/
def level8 {A B C D : Type} : ((A ⊕ B → C × D) → (A → C) × (B → C) × (A → D) × (B → D)) × ((A → C) × (B → C) × (A → D) × (B → D) → (A ⊕ B → C × D)) := by
  constructor

  intro f
  constructor
  intro a
  have apb : A ⊕ B := Sum.inl a
  exact (f apb).1
  constructor
  intro b
  have apb : A ⊕ B := Sum.inr b
  exact (f apb).1
  constructor
  intro a
  have apb : A ⊕ B := Sum.inl a
  exact (f apb).2
  intro b
  have apb : A ⊕ B := Sum.inr b
  exact (f apb).2

  intro f
  intro apb
  rcases apb with a | b
  exact ⟨f.1 a, f.2.2.1 a⟩
  exact ⟨f.2.1 b, f.2.2.2 b⟩



end RTPNotes.Worlds.Coproduct
