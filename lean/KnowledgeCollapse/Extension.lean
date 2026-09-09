import KnowledgeCollapse.Boundary
import Mathlib.Topology.Order.IntermediateValue

/-!
# Production-side extension: autonomous value of particular information

The paper imposes `ΔI = 0` in Assumption 1. This project studies the modest
extension `ΔI > 0`, leaving the information and public-learning technologies
unchanged. Theorems here are project results, not theorems attributed to the paper.
-/

open Set

namespace KnowledgeCollapse

noncomputable section

/-- Expected utility before imposing `ΔI = 0`. -/
def extensionUtility
    (f00 ΔG ΔI ΔX ε priorPrecision lambdaI X τA e : ℝ) : ℝ :=
  f00 + precisionSuccess X * ΔG +
    precisionSuccess (privatePrecision priorPrecision lambdaI e τA) * ΔI +
    precisionSuccess X * precisionSuccess (privatePrecision priorPrecision lambdaI e τA) * ΔX -
    effortCost ε e

/-- Marginal utility of effort when particular information has autonomous value. -/
def extensionMarginalUtility
    (ΔI ΔX ε priorPrecision lambdaI X τA e : ℝ) : ℝ :=
  lambdaI * precisionMarginal (privatePrecision priorPrecision lambdaI e τA) *
      (ΔI + precisionSuccess X * ΔX) -
    e ^ (1 / ε)

/-- AI cross-partial in the extension, with the analytic derivative expanded. -/
def extensionAiEffortCrossPartial (ΔI ΔX lambdaI X Y : ℝ) : ℝ :=
  lambdaI * (ΔI + precisionSuccess X * ΔX) *
    (-((1 : ℝ) / 2) * (1 + 1 / Y) * precisionMarginal Y)

/-- Independent derivative of the modified expected utility. -/
theorem hasDerivAt_extensionUtility_effort
    {f00 ΔG ΔI ΔX ε priorPrecision lambdaI X τA e : ℝ}
    (hε : 0 < ε) (he : 0 < e)
    (hY : 0 < privatePrecision priorPrecision lambdaI e τA) :
    HasDerivAt
      (fun z => extensionUtility f00 ΔG ΔI ΔX ε priorPrecision lambdaI X τA z)
      (extensionMarginalUtility ΔI ΔX ε priorPrecision lambdaI X τA e) e := by
  have hGY := (hasDerivAt_precisionSuccess hY).comp e
    (hasDerivAt_privatePrecision_effort priorPrecision lambdaI τA e)
  have hprivate := hGY.mul_const ΔI
  have hinteraction := (hGY.const_mul (precisionSuccess X)).mul_const ΔX
  have hcost := hasDerivAt_effortCost hε he
  have htotal :=
    (((((hasDerivAt_const e f00).add_const (precisionSuccess X * ΔG)).add hprivate).add
      hinteraction).sub hcost)
  convert htotal using 1
  simp only [extensionMarginalUtility]
  ring

/-- Public precision still complements effort: `ΔI` adds no `X`-dependent term. -/
theorem hasDerivAt_extensionMarginal_public
    {ΔI ΔX ε priorPrecision lambdaI X τA e : ℝ} (hX : 0 < X) :
    HasDerivAt
      (fun x => extensionMarginalUtility ΔI ΔX ε priorPrecision lambdaI x τA e)
      (publicEffortCrossPartial ΔX lambdaI X
        (privatePrecision priorPrecision lambdaI e τA)) X := by
  have hG := hasDerivAt_precisionSuccess hX
  have hscaled := hG.const_mul
    (lambdaI * precisionMarginal (privatePrecision priorPrecision lambdaI e τA) * ΔX)
  have hconstant : HasDerivAt
      (fun _ : ℝ =>
        lambdaI * precisionMarginal (privatePrecision priorPrecision lambdaI e τA) * ΔI -
          e ^ (1 / ε)) 0 X := hasDerivAt_const X _
  have htotal := hconstant.add hscaled
  convert htotal using 1
  · funext x
    simp [extensionMarginalUtility]
    ring
  · simp only [publicEffortCrossPartial]
    ring

/-- AI precision remains a strict substitute whenever `ΔI > 0`, including at `X = 0`. -/
theorem hasDerivAt_extensionMarginal_ai
    {ΔI ΔX ε priorPrecision lambdaI X τA e : ℝ}
    (hY : 0 < privatePrecision priorPrecision lambdaI e τA) :
    HasDerivAt
      (fun a => extensionMarginalUtility ΔI ΔX ε priorPrecision lambdaI X a e)
      (extensionAiEffortCrossPartial ΔI ΔX lambdaI X
        (privatePrecision priorPrecision lambdaI e τA)) τA := by
  have hg := (hasDerivAt_precisionMarginal hY).comp τA
    (hasDerivAt_privatePrecision_ai priorPrecision lambdaI e τA)
  have hscaled := hg.const_mul
    (lambdaI * (ΔI + precisionSuccess X * ΔX))
  simpa [extensionMarginalUtility, extensionAiEffortCrossPartial, mul_assoc,
    mul_left_comm, mul_comm] using hscaled.sub_const (e ^ (1 / ε))

theorem extensionAiEffortCrossPartial_neg
    {ΔI ΔX lambdaI X Y : ℝ}
    (hΔI : 0 < ΔI) (hΔX : 0 ≤ ΔX) (hlambdaI : 0 < lambdaI)
    (hX : 0 ≤ X) (hY : 0 < Y) :
    extensionAiEffortCrossPartial ΔI ΔX lambdaI X Y < 0 := by
  have hbracket : 0 < ΔI + precisionSuccess X * ΔX := by
    have hG : 0 ≤ precisionSuccess X := precisionSuccess_nonneg hX
    nlinarith [mul_nonneg hG hΔX]
  have hsum : 0 < 1 + 1 / Y := by
    have : 0 < 1 / Y := one_div_pos.mpr hY
    linarith
  have hderiv : -((1 : ℝ) / 2) * (1 + 1 / Y) * precisionMarginal Y < 0 := by
    have hcoef : -((1 : ℝ) / 2) * (1 + 1 / Y) < 0 :=
      mul_neg_of_neg_of_pos (by norm_num) hsum
    exact mul_neg_of_neg_of_pos hcoef (precisionMarginal_pos hY)
  unfold extensionAiEffortCrossPartial
  exact mul_neg_of_pos_of_neg (mul_pos hlambdaI hbracket) hderiv

@[simp] theorem extensionMarginalUtility_public_zero
    (ΔI ΔX ε priorPrecision lambdaI τA e : ℝ) :
    extensionMarginalUtility ΔI ΔX ε priorPrecision lambdaI 0 τA e =
      lambdaI * precisionMarginal (privatePrecision priorPrecision lambdaI e τA) * ΔI -
        e ^ (1 / ε) := by
  simp [extensionMarginalUtility]

/-- With `ΔI > 0`, marginal effort value at the zero-knowledge boundary is positive. -/
theorem extension_boundary_marginal_at_zero_pos
    {ΔI ΔX ε priorPrecision lambdaI τA : ℝ}
    (hΔI : 0 < ΔI) (hε : 0 < ε) (hprior : 0 < priorPrecision)
    (hlambdaI : 0 < lambdaI) (hAI : 0 ≤ τA) :
    0 < extensionMarginalUtility ΔI ΔX ε priorPrecision lambdaI 0 τA 0 := by
  have hY : 0 < privatePrecision priorPrecision lambdaI 0 τA := by
    simp only [privatePrecision_effort_zero]
    linarith
  have hexponent : 0 < 1 / ε := one_div_pos.mpr hε
  rw [extensionMarginalUtility_public_zero, Real.zero_rpow hexponent.ne', sub_zero]
  exact mul_pos (mul_pos hlambdaI (precisionMarginal_pos hY)) hΔI

/-- Boundary marginal utility is strictly decreasing in nonnegative effort. -/
theorem extension_boundary_marginal_strictAntiOn
    {ΔI ΔX ε priorPrecision lambdaI τA : ℝ}
    (hΔI : 0 < ΔI) (hε : 0 < ε) (hprior : 0 < priorPrecision)
    (hlambdaI : 0 < lambdaI) (hAI : 0 ≤ τA) :
    StrictAntiOn
      (extensionMarginalUtility ΔI ΔX ε priorPrecision lambdaI 0 τA)
      (Set.Ici 0) := by
  intro e1 he1 e2 he2 he12
  have hY1 : 0 < privatePrecision priorPrecision lambdaI e1 τA :=
    privatePrecision_pos hprior hlambdaI.le he1 hAI
  have hY2 : 0 < privatePrecision priorPrecision lambdaI e2 τA :=
    privatePrecision_pos hprior hlambdaI.le he2 hAI
  have hY12 : privatePrecision priorPrecision lambdaI e1 τA <
      privatePrecision priorPrecision lambdaI e2 τA := by
    unfold privatePrecision
    nlinarith
  have hg := precisionMarginal_strictAntiOn hY1 hY2 hY12
  have hbenefit :
      lambdaI * precisionMarginal (privatePrecision priorPrecision lambdaI e2 τA) * ΔI <
      lambdaI * precisionMarginal (privatePrecision priorPrecision lambdaI e1 τA) * ΔI := by
    exact mul_lt_mul_of_pos_right (mul_lt_mul_of_pos_left hg hlambdaI) hΔI
  have hpow := Real.strictMonoOn_rpow_Ici_of_exponent_pos (one_div_pos.mpr hε)
    he1 he2 he12
  simp only [extensionMarginalUtility_public_zero]
  linarith

/-- At most one nonnegative effort satisfies the extension's boundary FOC. -/
theorem extension_boundary_foc_unique
    {ΔI ΔX ε priorPrecision lambdaI τA e1 e2 : ℝ}
    (hΔI : 0 < ΔI) (hε : 0 < ε) (hprior : 0 < priorPrecision)
    (hlambdaI : 0 < lambdaI) (hAI : 0 ≤ τA)
    (he1 : 0 ≤ e1) (he2 : 0 ≤ e2)
    (hfoc1 : extensionMarginalUtility ΔI ΔX ε priorPrecision lambdaI 0 τA e1 = 0)
    (hfoc2 : extensionMarginalUtility ΔI ΔX ε priorPrecision lambdaI 0 τA e2 = 0) :
    e1 = e2 := by
  by_contra hne
  rcases lt_or_gt_of_ne hne with hlt | hgt
  · have := extension_boundary_marginal_strictAntiOn (ΔX := ΔX)
      hΔI hε hprior hlambdaI hAI
      he1 he2 hlt
    linarith
  · have := extension_boundary_marginal_strictAntiOn (ΔX := ΔX)
      hΔI hε hprior hlambdaI hAI
      he2 he1 hgt
    linarith

/-- A sign-changing upper bracket yields a unique, strictly positive FOC solution.
The bracket is a transparent coercivity condition, not the desired conclusion. -/
theorem extension_boundary_foc_exists_unique
    {ΔI ΔX ε priorPrecision lambdaI τA upper : ℝ}
    (hΔI : 0 < ΔI) (hε : 0 < ε) (hprior : 0 < priorPrecision)
    (hlambdaI : 0 < lambdaI) (hAI : 0 ≤ τA) (hupper : 0 < upper)
    (hupperSign :
      extensionMarginalUtility ΔI ΔX ε priorPrecision lambdaI 0 τA upper ≤ 0) :
    ∃! e : ℝ, 0 < e ∧ e ≤ upper ∧
      extensionMarginalUtility ΔI ΔX ε priorPrecision lambdaI 0 τA e = 0 := by
  let m : ℝ → ℝ := fun e =>
    lambdaI * precisionMarginal (privatePrecision priorPrecision lambdaI e τA) * ΔI -
      e ^ (1 / ε)
  have hm0 : 0 < m 0 := by
    simpa [m] using
      (extension_boundary_marginal_at_zero_pos (ΔX := ΔX)
        hΔI hε hprior hlambdaI hAI)
  have hupperSignM : m upper ≤ 0 := by
    simpa [m] using hupperSign
  have hmcont : ContinuousOn m (Set.Icc 0 upper) := by
    intro e he
    have hY : 0 < privatePrecision priorPrecision lambdaI e τA :=
      privatePrecision_pos hprior hlambdaI.le he.1 hAI
    have hg := ((hasDerivAt_precisionMarginal hY).comp e
      (hasDerivAt_privatePrecision_effort priorPrecision lambdaI τA e)).continuousAt
    have hpow : ContinuousAt (fun z : ℝ => z ^ (1 / ε)) e :=
      (Real.continuous_rpow_const (one_div_pos.mpr hε).le).continuousAt
    have hcont := ((hg.const_mul lambdaI).mul_const ΔI).sub hpow
    simpa only [m, Function.comp_apply] using hcont.continuousWithinAt
  have hzeroMem : (0 : ℝ) ∈ Set.Icc (m upper) (m 0) := by
    exact ⟨hupperSignM, hm0.le⟩
  obtain ⟨e, heInterval, hme⟩ :=
    (Set.mem_image m (Set.Icc 0 upper) 0).mp
      (intermediate_value_Icc' hupper.le hmcont hzeroMem)
  have hepos : 0 < e := by
    rcases heInterval.1.eq_or_lt with rfl | hpos
    · linarith
    · exact hpos
  have hme' : extensionMarginalUtility ΔI ΔX ε priorPrecision lambdaI 0 τA e = 0 := by
    simpa [m] using hme
  refine ⟨e, ⟨hepos, heInterval.2, hme'⟩, ?_⟩
  intro z hz
  exact extension_boundary_foc_unique hΔI hε hprior hlambdaI hAI
    hz.1.le hepos.le hz.2.2 hme'

/-- The public-precision transition used to state the local dynamic implication. -/
def publicPrecisionTransition
    (innovationVariance publicProductivity X aggregateEffort : ℝ) : ℝ :=
  (X + publicProductivity * aggregateEffort) /
    (1 + innovationVariance * (X + publicProductivity * aggregateEffort))

theorem extension_transition_from_zero_pos
    {innovationVariance publicProductivity effort : ℝ}
    (hinnovation : 0 ≤ innovationVariance)
    (hproductivity : 0 < publicProductivity) (heffort : 0 < effort) :
    0 < publicPrecisionTransition innovationVariance publicProductivity 0 effort := by
  unfold publicPrecisionTransition
  have hnum : 0 < publicProductivity * effort := mul_pos hproductivity heffort
  have hden : 0 < 1 + innovationVariance * (publicProductivity * effort) := by
    nlinarith [mul_nonneg hinnovation hnum.le]
  simpa using div_pos hnum hden

theorem zero_not_fixed_point_under_extension
    {innovationVariance publicProductivity effort : ℝ}
    (hinnovation : 0 ≤ innovationVariance)
    (hproductivity : 0 < publicProductivity) (heffort : 0 < effort) :
    publicPrecisionTransition innovationVariance publicProductivity 0 effort ≠ 0 :=
  (extension_transition_from_zero_pos hinnovation hproductivity heffort).ne'

end

end KnowledgeCollapse
