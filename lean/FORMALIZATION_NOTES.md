# Formalization notes and paper-to-Lean map

## Modeling choices

The primary source is the MIT manuscript dated May 5, 2026. Manuscript pages
13--15 define the private posterior precision in equation (4), the success
map `G`, expected utility in equation (6), and Observation 1. The zero-public-
precision corner is discussed in the footnote on page 15. The public-precision
transition used only for the extension implication comes from the paper's
law of motion; the extension itself is the student's production-side
relaxation of Assumption 1.

Lean represents the paper's

`G(tau) = 2 Phi(sqrt(tau)) - 1`

by the mathematically equivalent integral

`2 * integral z in 0..sqrt(tau), gaussianPDFReal 0 1 z`.

This avoids assuming a black-box derivative of the normal CDF. Mathlib's
standard normal density is used directly, and the fundamental theorem of
calculus plus the chain rule prove `G' = g` on `tau > 0`. The density quotient
defines `g`. Its exponential form, derivative, strict decrease, and divergent
right limit at zero are proved.

Real division in Lean is totalized, so the syntactic expression defining `g`
has value zero at exactly `tau = 0`. That value is not treated as a classical
boundary derivative. The theorem `precisionMarginal_tendsto_atTop` proves the
economically relevant statement: `g(tau)` tends to positive infinity as
`tau` approaches zero from the right.

## Paper-to-Lean correspondence

| Economic claim | Source | Lean endpoint | Main assumptions | Status | Semantic limitation |
| --- | --- | --- | --- | --- | --- |
| `G(0) = 0` | Success technology, pp. 13--14 | `precisionSuccess_zero` | None | Exact | Uses the equivalent integral representation |
| `G'(tau) = g(tau) > 0` | Definition of `g`, p. 14 | `hasDerivAt_precisionSuccess`, `precisionMarginal_pos` | `tau > 0` | Exact | Interior only, as required |
| `g'(tau) = -(1/2)(1+1/tau)g(tau) < 0` | Derivation behind Observation 1 | `hasDerivAt_precisionMarginal`, `precisionMarginal_deriv_neg` | `tau > 0` | Exact | Interior only |
| `g(tau) -> +infinity` as `tau ↓ 0` | Boundary audit | `precisionMarginal_tendsto_atTop` | Right-hand filter | Exact | Separates limit from Lean's totalized value at zero |
| Private precisions add | Equation (4), p. 13 | `privatePrecision`; derivative lemmas | Positive primitives for positivity | Algebraic core | Gaussian Bayesian independence is documented, not encoded probabilistically |
| Marginal effort incentive | Equation (6), p. 14 | `hasDerivAt_baselineUtility_effort` | `epsilon > 0`, `e > 0`, private precision positive | Exact under paper assumptions | Differentiates the represented utility; does not derive expected utility from random variables |
| Public precision complements effort | Observation 1, p. 15 | `hasDerivAt_baselineMarginal_public`, `publicEffortCrossPartial_pos` | `X,Y,DeltaX,lambdaI > 0` | Exact under paper assumptions | Strict derivative statement is interior |
| Agentic AI substitutes for effort | Observation 1, p. 15 | `hasDerivAt_baselineMarginal_ai`, `aiEffortCrossPartial_neg` | `X,Y,DeltaX,lambdaI > 0` | Exact under paper assumptions | Strict derivative statement is interior |
| Weak global comparative statics | Independent audit | `baselineMarginal_public_monotone`, `baselineMarginal_ai_antitone`, `baselineMarginal_ai_constant_at_public_zero` | Nonnegative domain and positive private precision | Exact | Formalizes finite comparisons of marginal incentives, not a supermodularity library abstraction |
| Baseline best response at `X = 0` is uniquely zero | Page 15 footnote | `baseline_boundary_unique_best_response` | `epsilon > 0`, `e >= 0` | Exact | Level comparison; no invalid derivative at zero is used |
| With `DeltaI > 0`, boundary marginal incentive is positive | Own extension from pre-Assumption-1 production decomposition | `extension_boundary_marginal_at_zero_pos` | `DeltaI,lambdaI,epsilon,priorPrecision > 0`; nonnegative finite `tauA` | Exact under explicit assumptions | Static statement only |
| A unique positive boundary FOC root exists | Own extension | `extension_boundary_foc_exists_unique` | Previous positivity plus an explicit finite upper point with nonpositive marginal utility | Partial | The coercive upper bracket is exposed as a hypothesis rather than derived from asymptotic `rpow` facts |
| The extension maps zero to positive public precision | Own extension plus paper transition | `extension_transition_from_zero_pos` | Positive public productivity and effort; nonnegative innovation variance | Exact conditional consequence | Does not construct equilibrium effort or aggregate a continuum of agents |
| Zero is not a fixed point | Own extension | `zero_not_fixed_point_under_extension` | Same transition conditions | Exact conditional consequence | No claim about other fixed points, stability, or welfare |

## What Lean does and does not certify

Compilation certifies that the stated definitions and theorems type-check
from Lean's kernel, Mathlib, and the hypotheses visible in each theorem. The
axiom audit reports only `propext`, `Classical.choice`, and `Quot.sound`, the
standard foundations used by Mathlib.

It does not certify that the model is empirically appropriate, that the normal
signals are independent, or that the economic interpretation is uniquely
compelling. Those are modeling claims. It also does not formalize the paper's
steady-state multiplicity, the elasticity threshold, Propositions 3--13, or
welfare results. No dynamic or welfare conclusion is imported into the own
extension.

## Classification

The appropriate repository-wide classification is **PARTIALLY FORMALIZED**.
The selected static calculus, boundary audit, and conditional extension
implication are genuinely proved without proof holes. The complete stochastic
environment, equilibrium aggregation, and dynamic results are deliberately
outside the formal model, and the extension's existence result retains one
transparent coercivity/bracketing hypothesis.
