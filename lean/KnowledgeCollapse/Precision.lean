import Mathlib.Analysis.Calculus.Deriv.MeanValue
import Mathlib.Analysis.SpecialFunctions.ExpDeriv
import Mathlib.Analysis.SpecialFunctions.Sqrt
import Mathlib.MeasureTheory.Integral.IntervalIntegral.FundThmCalculus
import Mathlib.Probability.Distributions.Gaussian.Real

/-!
# Precision technology

This module formalizes the paper's normal-information success technology.
For nonnegative precision `τ`, `precisionSuccess τ` is the probability mass
between `-1` and `1`, written as twice the standard-normal integral from zero
to `sqrt τ`. This is the integral representation of
`2 * Φ (sqrt τ) - 1` used on manuscript page 13.

## Main declarations

* `precisionSuccess`: probability of a prediction inside the unit tolerance.
* `precisionMarginal`: the closed-form interior derivative `g`.
* `hasDerivAt_precisionSuccess`: `G' = g` for positive precision.
* `hasDerivAt_precisionMarginal`: the paper's formula for `g'`.
* `precisionMarginal_strictAntiOn`: diminishing marginal returns on `(0, ∞)`.
-/

open Filter MeasureTheory Set
open scoped Interval

namespace KnowledgeCollapse

noncomputable section

/-- Standard-normal density, reusing Mathlib's normalized Gaussian density. -/
def standardNormalPDF (z : ℝ) : ℝ :=
  ProbabilityTheory.gaussianPDFReal 0 1 z

/-- Paper's precision-to-success map, in an integral form equivalent to
`2 * Φ (sqrt τ) - 1` for `τ ≥ 0`. -/
def precisionSuccess (τ : ℝ) : ℝ :=
  2 * ∫ z in (0 : ℝ)..Real.sqrt τ, standardNormalPDF z

/-- Closed-form marginal success from manuscript page 13. -/
def precisionMarginal (τ : ℝ) : ℝ :=
  standardNormalPDF (Real.sqrt τ) / Real.sqrt τ

lemma continuous_standardNormalPDF : Continuous standardNormalPDF := by
  unfold standardNormalPDF ProbabilityTheory.gaussianPDFReal
  fun_prop

lemma standardNormalPDF_pos (z : ℝ) : 0 < standardNormalPDF z := by
  exact ProbabilityTheory.gaussianPDFReal_pos 0 1 z one_ne_zero

@[simp] theorem precisionSuccess_zero : precisionSuccess 0 = 0 := by
  simp [precisionSuccess]

theorem precisionSuccess_pos {τ : ℝ} (hτ : 0 < τ) : 0 < precisionSuccess τ := by
  have hsqrt : 0 < Real.sqrt τ := Real.sqrt_pos.2 hτ
  have hint : 0 < ∫ z in (0 : ℝ)..Real.sqrt τ, standardNormalPDF z := by
    apply intervalIntegral.integral_pos hsqrt
    · exact continuous_standardNormalPDF.continuousOn
    · intro z _
      exact (standardNormalPDF_pos z).le
    · exact ⟨0, left_mem_Icc.2 hsqrt.le, standardNormalPDF_pos 0⟩
  exact mul_pos zero_lt_two hint

theorem precisionMarginal_pos {τ : ℝ} (hτ : 0 < τ) : 0 < precisionMarginal τ := by
  exact div_pos (standardNormalPDF_pos _) (Real.sqrt_pos.2 hτ)

/-- Exact interior derivative of the paper's `G`. -/
theorem hasDerivAt_precisionSuccess {τ : ℝ} (hτ : 0 < τ) :
    HasDerivAt precisionSuccess (precisionMarginal τ) τ := by
  have hcont := continuous_standardNormalPDF
  have hint : HasDerivAt
      (fun u : ℝ => ∫ z in (0 : ℝ)..u, standardNormalPDF z)
      (standardNormalPDF (Real.sqrt τ)) (Real.sqrt τ) :=
    intervalIntegral.integral_hasDerivAt_right
      (hcont.intervalIntegrable _ _)
      hcont.aestronglyMeasurable.stronglyMeasurableAtFilter
      hcont.continuousAt
  have hsqrt : HasDerivAt (fun x : ℝ => Real.sqrt x)
      (1 / (2 * Real.sqrt τ)) τ :=
    Real.hasDerivAt_sqrt hτ.ne'
  have hcomp := hint.comp τ hsqrt
  have hmul := hcomp.const_mul 2
  convert hmul using 1
  rw [precisionMarginal]
  field_simp [Real.sqrt_ne_zero'.2 hτ]

theorem precisionSuccess_deriv_pos {τ : ℝ} (hτ : 0 < τ) :
    0 < deriv precisionSuccess τ := by
  rw [(hasDerivAt_precisionSuccess hτ).deriv]
  exact precisionMarginal_pos hτ

theorem precisionSuccess_strictMonoOn :
    StrictMonoOn precisionSuccess (Set.Ioi 0) := by
  apply strictMonoOn_of_deriv_pos (convex_Ioi (0 : ℝ))
  · intro τ hτ
    exact (hasDerivAt_precisionSuccess hτ).continuousAt.continuousWithinAt
  · intro τ hτ
    simp only [interior_Ioi, mem_Ioi] at hτ
    exact precisionSuccess_deriv_pos hτ

theorem precisionSuccess_strictMonoOn_nonnegative :
    StrictMonoOn precisionSuccess (Set.Ici 0) := by
  intro x hx y hy hxy
  by_cases hx0 : x = 0
  · subst x
    rw [precisionSuccess_zero]
    exact precisionSuccess_pos (lt_of_le_of_lt hx hxy)
  · have hxpos : 0 < x := lt_of_le_of_ne hx (Ne.symm hx0)
    have hypos : 0 < y := hxpos.trans hxy
    exact precisionSuccess_strictMonoOn hxpos hypos hxy

/-- The level map is weakly increasing on the economically meaningful closed domain.
This includes the boundary even though its classical derivative is not finite there. -/
theorem precisionSuccess_monotoneOn :
    MonotoneOn precisionSuccess (Set.Ici 0) := by
  exact precisionSuccess_strictMonoOn_nonnegative.monotoneOn

theorem precisionSuccess_nonneg {τ : ℝ} (hτ : 0 ≤ τ) :
    0 ≤ precisionSuccess τ := by
  have hmono := precisionSuccess_monotoneOn (by simp) hτ hτ
  simpa using hmono

/-- Closed form used to differentiate `g` without assuming facts about a CDF. -/
theorem precisionMarginal_eq_exp {τ : ℝ} (hτ : 0 < τ) :
    precisionMarginal τ =
      (Real.sqrt (2 * Real.pi))⁻¹ * Real.exp (-τ / 2) / Real.sqrt τ := by
  rw [precisionMarginal, standardNormalPDF,
    ProbabilityTheory.gaussianPDFReal]
  simp only [NNReal.coe_one, mul_one, sub_zero]
  rw [Real.sq_sqrt hτ.le]

/-- The interior marginal value is unbounded as precision approaches zero from
the right. This is the formal reason no finite classical cross-partial using
`g(0)` exists at the public boundary. -/
theorem precisionMarginal_tendsto_atTop :
    Tendsto precisionMarginal (nhdsWithin (0 : ℝ) (Set.Ioi 0)) atTop := by
  let numerator : ℝ → ℝ := fun τ =>
    (Real.sqrt (2 * Real.pi))⁻¹ * Real.exp (-τ / 2)
  have hsqrt_nhds : Tendsto Real.sqrt (nhdsWithin (0 : ℝ) (Set.Ioi 0)) (nhds 0) := by
    simpa using (Real.continuous_sqrt.tendsto (0 : ℝ)).mono_left inf_le_left
  have hsqrt_pos : ∀ᶠ (τ : ℝ) in nhdsWithin (0 : ℝ) (Set.Ioi 0),
      0 < Real.sqrt τ := by
    filter_upwards [self_mem_nhdsWithin] with τ hτ
    exact Real.sqrt_pos.2 hτ
  have hsqrt : Tendsto Real.sqrt (nhdsWithin (0 : ℝ) (Set.Ioi 0))
      (nhdsWithin (0 : ℝ) (Set.Ioi 0)) := by
    rw [nhdsWithin]
    exact tendsto_inf.2 ⟨hsqrt_nhds, tendsto_principal.2 hsqrt_pos⟩
  have hinv : Tendsto (fun τ : ℝ => (Real.sqrt τ)⁻¹)
      (nhdsWithin (0 : ℝ) (Set.Ioi 0)) atTop := hsqrt.inv_tendsto_nhdsGT_zero
  have hnumContinuous : Continuous numerator := by
    dsimp [numerator]
    fun_prop
  have hnum : Tendsto numerator (nhdsWithin (0 : ℝ) (Set.Ioi 0))
      (nhds ((Real.sqrt (2 * Real.pi))⁻¹)) := by
    have h : Tendsto numerator (nhdsWithin (0 : ℝ) (Set.Ioi 0))
        (nhds (numerator 0)) :=
      (hnumContinuous.tendsto (0 : ℝ)).mono_left inf_le_left
    simpa [numerator] using h
  have hconstant : 0 < (Real.sqrt (2 * Real.pi))⁻¹ := by positivity
  have hproduct := hinv.atTop_mul_pos hconstant hnum
  have heq : ∀ᶠ (τ : ℝ) in nhdsWithin (0 : ℝ) (Set.Ioi 0),
      precisionMarginal τ = (Real.sqrt τ)⁻¹ * numerator τ := by
    filter_upwards [self_mem_nhdsWithin] with τ hτ
    rw [precisionMarginal_eq_exp hτ]
    simp only [numerator]
    ring
  exact hproduct.congr' (Filter.EventuallyEq.symm heq)

/-- Exact derivative formula `g'(τ) = -(1/2)(1 + 1/τ)g(τ)` on the interior. -/
theorem hasDerivAt_precisionMarginal {τ : ℝ} (hτ : 0 < τ) :
    HasDerivAt precisionMarginal
      (-((1 : ℝ) / 2) * (1 + 1 / τ) * precisionMarginal τ) τ := by
  have hsqrt : HasDerivAt (fun x : ℝ => Real.sqrt x)
      (1 / (2 * Real.sqrt τ)) τ :=
    Real.hasDerivAt_sqrt hτ.ne'
  have hexp : HasDerivAt (fun x : ℝ => Real.exp (-x / 2))
      (-(1 : ℝ) / 2 * Real.exp (-τ / 2)) τ := by
    convert (Real.hasDerivAt_exp (-τ / 2)).comp τ
      (((hasDerivAt_id τ).neg).div_const 2) using 1
    ring
  have hnum : HasDerivAt
      (fun x : ℝ => (Real.sqrt (2 * Real.pi))⁻¹ * Real.exp (-x / 2))
      ((Real.sqrt (2 * Real.pi))⁻¹ * (-(1 : ℝ) / 2 * Real.exp (-τ / 2))) τ :=
    hexp.const_mul _
  have hquot := hnum.div hsqrt (Real.sqrt_ne_zero'.2 hτ)
  have hlocal : HasDerivAt precisionMarginal
      (((Real.sqrt (2 * Real.pi))⁻¹ * (-(1 : ℝ) / 2 * Real.exp (-τ / 2)) *
          Real.sqrt τ -
        (Real.sqrt (2 * Real.pi))⁻¹ * Real.exp (-τ / 2) *
          (1 / (2 * Real.sqrt τ))) /
        Real.sqrt τ ^ 2) τ := by
    apply hquot.congr_of_eventuallyEq
    filter_upwards [Ioi_mem_nhds hτ] with x hx
    exact precisionMarginal_eq_exp hx
  convert hlocal using 1
  rw [precisionMarginal_eq_exp hτ]
  field_simp [Real.sqrt_ne_zero'.2 hτ, hτ.ne']
  rw [Real.sq_sqrt hτ.le]
  ring

theorem precisionMarginal_deriv_neg {τ : ℝ} (hτ : 0 < τ) :
    deriv precisionMarginal τ < 0 := by
  rw [(hasDerivAt_precisionMarginal hτ).deriv]
  have hhalf : -((1 : ℝ) / 2) < 0 := by norm_num
  have hsum : 0 < 1 + 1 / τ := by
    have hinv : 0 < 1 / τ := one_div_pos.mpr hτ
    linarith
  have hfactor : -((1 : ℝ) / 2) * (1 + 1 / τ) < 0 :=
    mul_neg_of_neg_of_pos hhalf hsum
  exact mul_neg_of_neg_of_pos hfactor (precisionMarginal_pos hτ)

theorem precisionMarginal_strictAntiOn :
    StrictAntiOn precisionMarginal (Set.Ioi 0) := by
  apply strictAntiOn_of_deriv_neg (convex_Ioi (0 : ℝ))
  · intro τ hτ
    exact (hasDerivAt_precisionMarginal hτ).continuousAt.continuousWithinAt
  · intro τ hτ
    simp only [interior_Ioi, mem_Ioi] at hτ
    exact precisionMarginal_deriv_neg hτ

end

end KnowledgeCollapse
