theorem And.curry {P Q R : Prop} : (P ∧ Q → R) → (P → Q → R) := by
  intro h p q
  exact h ⟨p, q⟩

theorem And.uncurry {P Q R : Prop} : (P → Q → R) → (P ∧ Q → R) := by
  intro h hpq
  exact h hpq.1 hpq.2
