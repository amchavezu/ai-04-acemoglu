import KnowledgeCollapse.Precision
import Mathlib.Analysis.SpecialFunctions.Pow.Deriv

/-!
# Static effort problem

This module formalizes manuscript equations (4), (6), and the differential
content of Observation 1 (manuscript pages 13--15). The public stock `X` and
AI precision `τA` are parameters of the short-lived agent's problem; effort
`e` is the choice variable.
-/

open Set

namespace KnowledgeCollapse

noncomputable section

/-- Equation (4): independent prior, human, and AI precisions add. -/
def privatePrecision (priorPrecision lambdaI e τA : ℝ) : ℝ :=
  priorPrecision + lambdaI * e + τA

/-- Paper's convex effort cost. The economic domain is `e ≥ 0`, `ε > 0`. -/
def effortCost (ε e : ℝ) : ℝ :=
  ε / (ε + 1) * e ^ ((ε + 1) / ε)

/-- Equation (6), with terms independent of effort retained for semantic fidelity. -/
def baselineUtility (f00 ΔG ΔX ε priorPrecision lambdaI X τA e : ℝ) : ℝ :=
  f00 + precisionSuccess X * ΔG +
    precisionSuccess X * precisionSuccess (privatePrecision priorPrecision lambdaI e τA) * ΔX -
    effortCost ε e

/-- The paper's marginal utility of effort on the interior. -/
def baselineMarginalUtility (ΔX ε priorPrecision lambdaI X τA e : ℝ) : ℝ :=
  lambdaI * ΔX * precisionSuccess X *
      precisionMarginal (privatePrecision priorPrecision lambdaI e τA) -
    e ^ (1 / ε)

/-- Observation 1's public-precision cross-partial. -/
def publicEffortCrossPartial (ΔX lambdaI X Y : ℝ) : ℝ :=
  lambdaI * ΔX * precisionMarginal X * precisionMarginal Y

/-- Observation 1's AI-precision cross-partial, with `g'` expanded. -/
def aiEffortCrossPartial (ΔX lambdaI X Y : ℝ) : ℝ :=
  lambdaI * ΔX * precisionSuccess X *
    (-((1 : ℝ) / 2) * (1 + 1 / Y) * precisionMarginal Y)

@[simp] theorem privatePrecision_effort_zero (priorPrecision lambdaI τA : ℝ) :
    privatePrecision priorPrecision lambdaI 0 τA = priorPrecision + τA := by
  simp [privatePrecision]

theorem privatePrecision_pos {priorPrecision lambdaI e τA : ℝ}
    (hprior : 0 < priorPrecision) (hlambdaI : 0 ≤ lambdaI) (he : 0 ≤ e) (hAI : 0 ≤ τA) :
    0 < privatePrecision priorPrecision lambdaI e τA := by
  unfold privatePrecision
  positivity

theorem hasDerivAt_privatePrecision_effort
    (priorPrecision lambdaI τA e : ℝ) :
    HasDerivAt (fun z => privatePrecision priorPrecision lambdaI z τA) lambdaI e := by
  simpa [privatePrecision] using
    (((hasDerivAt_const e priorPrecision).add ((hasDerivAt_id e).const_mul lambdaI)).add_const τA)

theorem hasDerivAt_privatePrecision_ai
    (priorPrecision lambdaI e τA : ℝ) :
    HasDerivAt (fun a => privatePrecision priorPrecision lambdaI e a) 1 τA := by
  simpa [privatePrecision] using
    (hasDerivAt_const τA (priorPrecision + lambdaI * e)).add (hasDerivAt_id τA)

theorem hasDerivAt_effortCost {ε e : ℝ} (hε : 0 < ε) (he : 0 < e) :
    HasDerivAt (effortCost ε) (e ^ (1 / ε)) e := by
  have hε0 : ε ≠ 0 := hε.ne'
  have hε1 : ε + 1 ≠ 0 := by positivity
  have hexponent : (ε + 1) / ε - 1 = 1 / ε := by
    field_simp [hε0]
    ring
  have hcoefficient : ε / (ε + 1) * ((ε + 1) / ε) = 1 := by
    field_simp [hε0, hε1]
  have hp := Real.hasDerivAt_rpow_const
    (x := e) (p := (ε + 1) / ε) (Or.inl he.ne')
  have hmul := hp.const_mul (ε / (ε + 1))
  simpa [effortCost, hexponent, ← mul_assoc, hcoefficient] using hmul

/-- Independent reconstruction of the effort derivative in equation (6). -/
theorem hasDerivAt_baselineUtility_effort
    {f00 ΔG ΔX ε priorPrecision lambdaI X τA e : ℝ}
    (hε : 0 < ε) (he : 0 < e)
    (hY : 0 < privatePrecision priorPrecision lambdaI e τA) :
    HasDerivAt (fun z => baselineUtility f00 ΔG ΔX ε priorPrecision lambdaI X τA z)
      (baselineMarginalUtility ΔX ε priorPrecision lambdaI X τA e) e := by
  have hGY := (hasDerivAt_precisionSuccess hY).comp e
    (hasDerivAt_privatePrecision_effort priorPrecision lambdaI τA e)
  have hbenefit :=
    ((hGY.const_mul (precisionSuccess X)).mul_const ΔX)
  have hcost := hasDerivAt_effortCost hε he
  simpa [baselineUtility, baselineMarginalUtility, mul_assoc, mul_left_comm, mul_comm] using
    ((((hasDerivAt_const e f00).add_const (precisionSuccess X * ΔG)).add hbenefit).sub hcost)

/-- Differentiating marginal effort value with respect to public precision gives
the first cross-partial in Observation 1. -/
theorem hasDerivAt_baselineMarginal_public
    {ΔX ε priorPrecision lambdaI X τA e : ℝ} (hX : 0 < X) :
    HasDerivAt
      (fun x => baselineMarginalUtility ΔX ε priorPrecision lambdaI x τA e)
      (publicEffortCrossPartial ΔX lambdaI X
        (privatePrecision priorPrecision lambdaI e τA)) X := by
  have hG := hasDerivAt_precisionSuccess hX
  have hscaled := hG.const_mul
    (lambdaI * ΔX * precisionMarginal (privatePrecision priorPrecision lambdaI e τA))
  simpa [baselineMarginalUtility, publicEffortCrossPartial, mul_assoc, mul_left_comm,
    mul_comm] using hscaled.sub_const (e ^ (1 / ε))

/-- Differentiating marginal effort value with respect to AI precision gives
the second cross-partial in Observation 1. -/
theorem hasDerivAt_baselineMarginal_ai
    {ΔX ε priorPrecision lambdaI X τA e : ℝ}
    (hY : 0 < privatePrecision priorPrecision lambdaI e τA) :
    HasDerivAt
      (fun a => baselineMarginalUtility ΔX ε priorPrecision lambdaI X a e)
      (aiEffortCrossPartial ΔX lambdaI X
        (privatePrecision priorPrecision lambdaI e τA)) τA := by
  have hg := (hasDerivAt_precisionMarginal hY).comp τA
    (hasDerivAt_privatePrecision_ai priorPrecision lambdaI e τA)
  have hscaled := hg.const_mul (lambdaI * ΔX * precisionSuccess X)
  simpa [baselineMarginalUtility, aiEffortCrossPartial, mul_assoc, mul_left_comm,
    mul_comm] using hscaled.sub_const (e ^ (1 / ε))

theorem publicEffortCrossPartial_pos
    {ΔX lambdaI X Y : ℝ} (hΔX : 0 < ΔX) (hlambdaI : 0 < lambdaI)
    (hX : 0 < X) (hY : 0 < Y) :
    0 < publicEffortCrossPartial ΔX lambdaI X Y := by
  unfold publicEffortCrossPartial
  exact mul_pos
    (mul_pos (mul_pos hlambdaI hΔX) (precisionMarginal_pos hX))
    (precisionMarginal_pos hY)

theorem aiEffortCrossPartial_neg
    {ΔX lambdaI X Y : ℝ} (hΔX : 0 < ΔX) (hlambdaI : 0 < lambdaI)
    (hX : 0 < X) (hY : 0 < Y) :
    aiEffortCrossPartial ΔX lambdaI X Y < 0 := by
  unfold aiEffortCrossPartial
  have hsum : 0 < 1 + 1 / Y := by
    have : 0 < 1 / Y := one_div_pos.mpr hY
    linarith
  have hderiv : -((1 : ℝ) / 2) * (1 + 1 / Y) * precisionMarginal Y < 0 := by
    have hcoef : -((1 : ℝ) / 2) * (1 + 1 / Y) < 0 := by
      exact mul_neg_of_neg_of_pos (by norm_num) hsum
    exact mul_neg_of_neg_of_pos hcoef (precisionMarginal_pos hY)
  have hfront : 0 < lambdaI * ΔX * precisionSuccess X :=
    mul_pos (mul_pos hlambdaI hΔX) (precisionSuccess_pos hX)
  exact mul_neg_of_pos_of_neg hfront hderiv

/-! ## Discrete differences

The next results do not differentiate at the public boundary. They compare
marginal effort incentives at two parameter values and therefore express the
global weak complement/substitute claims precisely.
-/

theorem baselineMarginal_public_monotone
    {ΔX ε priorPrecision lambdaI X1 X2 τA e : ℝ}
    (hΔX : 0 ≤ ΔX) (hlambdaI : 0 ≤ lambdaI)
    (hX1 : 0 ≤ X1) (hX2 : 0 ≤ X2) (hX12 : X1 ≤ X2)
    (hY : 0 < privatePrecision priorPrecision lambdaI e τA) :
    baselineMarginalUtility ΔX ε priorPrecision lambdaI X1 τA e ≤
      baselineMarginalUtility ΔX ε priorPrecision lambdaI X2 τA e := by
  have hG := precisionSuccess_monotoneOn hX1 hX2 hX12
  have hfactor : 0 ≤ lambdaI * ΔX *
      precisionMarginal (privatePrecision priorPrecision lambdaI e τA) := by
    exact mul_nonneg (mul_nonneg hlambdaI hΔX) (precisionMarginal_pos hY).le
  unfold baselineMarginalUtility
  nlinarith [mul_le_mul_of_nonneg_left hG hfactor]

theorem baselineMarginal_public_strict
    {ΔX ε priorPrecision lambdaI X1 X2 τA e : ℝ}
    (hΔX : 0 < ΔX) (hlambdaI : 0 < lambdaI)
    (hX1 : 0 ≤ X1) (hX2 : 0 ≤ X2) (hX12 : X1 < X2)
    (hY : 0 < privatePrecision priorPrecision lambdaI e τA) :
    baselineMarginalUtility ΔX ε priorPrecision lambdaI X1 τA e <
      baselineMarginalUtility ΔX ε priorPrecision lambdaI X2 τA e := by
  have hG := precisionSuccess_strictMonoOn_nonnegative hX1 hX2 hX12
  have hfactor : 0 < lambdaI * ΔX *
      precisionMarginal (privatePrecision priorPrecision lambdaI e τA) :=
    mul_pos (mul_pos hlambdaI hΔX) (precisionMarginal_pos hY)
  unfold baselineMarginalUtility
  nlinarith [mul_lt_mul_of_pos_left hG hfactor]

theorem baselineMarginal_ai_antitone
    {ΔX ε priorPrecision lambdaI X τA1 τA2 e : ℝ}
    (hΔX : 0 ≤ ΔX) (hlambdaI : 0 ≤ lambdaI) (hX : 0 ≤ X)
    (hAI12 : τA1 ≤ τA2)
    (hY1 : 0 < privatePrecision priorPrecision lambdaI e τA1)
    (hY2 : 0 < privatePrecision priorPrecision lambdaI e τA2) :
    baselineMarginalUtility ΔX ε priorPrecision lambdaI X τA2 e ≤
      baselineMarginalUtility ΔX ε priorPrecision lambdaI X τA1 e := by
  rcases hAI12.eq_or_lt with rfl | hAIlt
  · exact le_rfl
  · have hYlt : privatePrecision priorPrecision lambdaI e τA1 <
        privatePrecision priorPrecision lambdaI e τA2 := by
      unfold privatePrecision
      linarith
    have hg := (precisionMarginal_strictAntiOn hY1 hY2 hYlt).le
    have hfactor : 0 ≤ lambdaI * ΔX * precisionSuccess X :=
      mul_nonneg (mul_nonneg hlambdaI hΔX) (precisionSuccess_nonneg hX)
    unfold baselineMarginalUtility
    nlinarith [mul_le_mul_of_nonneg_left hg hfactor]

theorem baselineMarginal_ai_strict
    {ΔX ε priorPrecision lambdaI X τA1 τA2 e : ℝ}
    (hΔX : 0 < ΔX) (hlambdaI : 0 < lambdaI) (hX : 0 < X)
    (hAI12 : τA1 < τA2)
    (hY1 : 0 < privatePrecision priorPrecision lambdaI e τA1)
    (hY2 : 0 < privatePrecision priorPrecision lambdaI e τA2) :
    baselineMarginalUtility ΔX ε priorPrecision lambdaI X τA2 e <
      baselineMarginalUtility ΔX ε priorPrecision lambdaI X τA1 e := by
  have hYlt : privatePrecision priorPrecision lambdaI e τA1 <
      privatePrecision priorPrecision lambdaI e τA2 := by
    unfold privatePrecision
    linarith
  have hg := precisionMarginal_strictAntiOn hY1 hY2 hYlt
  have hfactor : 0 < lambdaI * ΔX * precisionSuccess X :=
    mul_pos (mul_pos hlambdaI hΔX) (precisionSuccess_pos hX)
  unfold baselineMarginalUtility
  nlinarith [mul_lt_mul_of_pos_left hg hfactor]

theorem baselineMarginal_ai_constant_at_public_zero
    (ΔX ε priorPrecision lambdaI τA1 τA2 e : ℝ) :
    baselineMarginalUtility ΔX ε priorPrecision lambdaI 0 τA1 e =
      baselineMarginalUtility ΔX ε priorPrecision lambdaI 0 τA2 e := by
  simp [baselineMarginalUtility]

end

end KnowledgeCollapse
