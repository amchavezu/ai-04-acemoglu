import KnowledgeCollapse.Static

/-!
# The boundary `X = 0`

The paper's level problem remains well defined at zero public precision even
though the interior formula `g(X)` is singular as `X ↓ 0`. These theorems
formalize the level statements used in the handwritten audit.
-/

namespace KnowledgeCollapse

noncomputable section

theorem effortCost_zero {ε : ℝ} (hε : 0 < ε) : effortCost ε 0 = 0 := by
  have hexponent : 0 < (ε + 1) / ε := div_pos (by positivity) hε
  rw [effortCost, Real.zero_rpow hexponent.ne']
  ring

theorem effortCost_pos {ε e : ℝ} (hε : 0 < ε) (he : 0 < e) :
    0 < effortCost ε e := by
  unfold effortCost
  have hcoef : 0 < ε / (ε + 1) := div_pos hε (by positivity)
  exact mul_pos hcoef (Real.rpow_pos_of_pos he _)

theorem effortCost_nonneg {ε e : ℝ} (hε : 0 < ε) (he : 0 ≤ e) :
    0 ≤ effortCost ε e := by
  rcases he.eq_or_lt with rfl | he'
  · rw [effortCost_zero hε]
  · exact (effortCost_pos hε he').le

/-- At the boundary, all effort-dependent baseline benefits disappear. -/
@[simp] theorem baselineUtility_public_zero
    (f00 ΔG ΔX ε priorPrecision lambdaI τA e : ℝ) :
    baselineUtility f00 ΔG ΔX ε priorPrecision lambdaI 0 τA e =
      f00 - effortCost ε e := by
  simp [baselineUtility]

/-- The boundary problem has the unique feasible maximizer `e = 0`.
This is the level argument in the footnote on manuscript page 15. -/
theorem baseline_boundary_unique_best_response
    {f00 ΔG ΔX ε priorPrecision lambdaI τA : ℝ} (hε : 0 < ε) :
    (∀ e, 0 ≤ e →
      baselineUtility f00 ΔG ΔX ε priorPrecision lambdaI 0 τA e ≤
        baselineUtility f00 ΔG ΔX ε priorPrecision lambdaI 0 τA 0) ∧
    (∀ e, 0 ≤ e →
      baselineUtility f00 ΔG ΔX ε priorPrecision lambdaI 0 τA e =
        baselineUtility f00 ΔG ΔX ε priorPrecision lambdaI 0 τA 0 → e = 0) := by
  constructor
  · intro e he
    rw [baselineUtility_public_zero, baselineUtility_public_zero,
      effortCost_zero hε, sub_zero]
    linarith [effortCost_nonneg hε he]
  · intro e he heq
    by_contra hne
    have hepos : 0 < e := lt_of_le_of_ne he (Ne.symm hne)
    have hcost := effortCost_pos hε hepos
    rw [baselineUtility_public_zero, baselineUtility_public_zero,
      effortCost_zero hε, sub_zero] at heq
    linarith

/-- AI precision has no marginal effect on baseline effort incentives at `X = 0`.
This is weak substitution, not a strictly negative cross-partial. -/
@[simp] theorem aiEffortCrossPartial_public_zero
    (ΔX lambdaI Y : ℝ) :
    aiEffortCrossPartial ΔX lambdaI 0 Y = 0 := by
  simp [aiEffortCrossPartial]

/-- The baseline marginal-utility expression at the public boundary. -/
@[simp] theorem baselineMarginalUtility_public_zero
    (ΔX ε priorPrecision lambdaI τA e : ℝ) :
    baselineMarginalUtility ΔX ε priorPrecision lambdaI 0 τA e =
      -(e ^ (1 / ε)) := by
  simp [baselineMarginalUtility]

/-- There is no finite value at zero supplied by the closed-form quotient itself:
Lean's totalized division assigns `0` to the syntactic expression, while
`precisionMarginal_tendsto_atTop` proves that the economically relevant
right-hand limit diverges. -/
@[simp] theorem precisionMarginal_at_zero_totalized : precisionMarginal 0 = 0 := by
  simp [precisionMarginal]

end

end KnowledgeCollapse
