# Extension questions - Phase 1 only

This is not a final extension proposal. It records questions that remain open after auditing Section 5 and the relevant appendices.

## Already developed by the paper - do not present as new

- Agentic AI that also improves aggregation of general knowledge: Section 5.1, with `I(tau_A) = I_0 + exp(eta tau_A)`.
- AI-generated synthetic information about the common state: Section 5.2, with precision `tau_syn`.
- Partial separation between effort that learns the individual state and effort that produces general knowledge: Section 5.3, with public precision proportional to `e^beta`.
- Gaussian information design through a time-varying precision cap: Section 4.5.

## Live questions

- **`Delta_I > 0`:** What survives if context-specific knowledge has value even when the common prediction is wrong? The static substitution result may survive, but `e(0,tau_A)` need not be zero, so the zero-knowledge fixed point, Lemma 2, and Proposition 5 must be rebuilt. The course README explicitly identifies this as a promising relaxation.
- **Long-lived or forward-looking agents:** What changes if agents internalize some effect of their effort on future public knowledge? This alters the maintained short-lived-agent assumption and partially internalizes the externality.
- **Non-atomistic contributors or private rewards for public knowledge:** How much internalization is sufficient to prevent the collapse fixed point without removing AI's static substitution channel?
- **Signals that are correlated or misspecified:** Precision additivity and posterior-mean optimality rely on the independent, correctly specified Gaussian structure. Which comparative statics survive correlation?

## Questions to settle before choosing

- Does allowing `Delta_I > 0` preserve strict AI-effort substitution at every positive `X`, and what replaces the behavior at `X = 0`?
- Which of the long-lived-agent and non-atomistic variants changes only one equation rather than the entire equilibrium concept?
- Is the wording that `I_0` is the pre-AI baseline in Section 5.1 consistent with `I(0) = I_0 + 1`, or is `I_0` intended only as an additive baseline component?
