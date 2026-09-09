# Speaker notes

The core script is designed for approximately five minutes. The technical
backup is not part of the timed script; use it only for questions.

## Title slide -- target: 20 seconds

### Core script

This presentation studies *AI, Human Cognition and Knowledge Collapse* by
Daron Acemoglu, Dingwen Kong, and Asuman Ozdaglar. I use the May 5, 2026
version of NBER Working Paper 34910. I will explain its static mechanism, one
technical boundary qualification, and one deliberately modest extension.

### Technical backup

The primary source is the MIT-hosted manuscript. It differs as a file and in
parameterization from the February NBER PDF, so all equation references and
notation here follow the May manuscript.

### Transition

First, consider the information needed to make one good decision.

## Slide 2 -- The paper and the agent's problem -- target: 75 seconds

### Core script

A doctor or investor needs two predictions. General knowledge describes what
is common across cases, such as the disease mechanism or market environment.
Its precision is \(X\). Context-specific knowledge describes this patient or
asset; its precision is \(Y\). These inputs are complementary: knowing the
general mechanism makes a correct reading of the particular case more useful.

The agent chooses human effort \(e\), while taking public precision \(X\) and
AI precision \(\tau_A\) as given. The objective is expected production minus
effort cost. \(G(X)\) is the probability that the common prediction is
correct, so it weights the stand-alone gain \(\Delta_G\). The product
\(G(X)G(Y)\) is the probability that both independent predictions are correct,
so it weights the complementarity gain \(\Delta_X\).

Inside \(Y\), prior precision, human-signal precision, and AI precision add.
That is the normal-information rule for independent signals. Human effort
also creates public learning, but an atomistic, short-lived agent does not
internalize that benefit to future cohorts. Knowledge collapse is the feedback
in which less effort produces less public learning and inherited precision
eventually approaches zero.

### Meaning of the displayed variables

- \(e\): effort chosen before private and AI signals are observed.
- \(X\): inherited public precision about the common state.
- \(Y\): posterior precision about the idiosyncratic state.
- \(\sigma^{-2}\): prior precision about the idiosyncratic state.
- \(\lambda_I\): private-signal precision produced by one unit of effort.
- \(\tau_A\): precision of the AI signal about the same idiosyncratic state.
- \(G(\tau)\): probability that a normal prediction error with precision
  \(\tau\) lies inside the unit tolerance band.
- \(\Delta_G\): payoff gain from common correctness alone.
- \(\Delta_X\): extra payoff from joint correctness, beyond stand-alone gains.
- \(\varepsilon\): elasticity parameter governing the curvature of effort
  cost.
- \(E_t\): aggregate cohort effort; \(\lambda_GE_t\) is the precision of the
  new public signal.

### Intuition behind sums, products, and weights

Precisions add because independent Gaussian log-likelihoods add their
quadratic coefficients. Probabilities multiply because common and
idiosyncratic posterior errors are independent. A probability multiplies a
payoff because expected production weights each payoff increment by the event
that earns it. Cost is subtracted because effort uses real resources.

### Technical backup

The full pre-Assumption-1 decomposition also contains
\(G(Y)\Delta_I\). The baseline sets \(\Delta_I=0\). The public productivity
parameter \(\lambda_G\) is absent from the private FOC because one atomistic
agent ignores the infinitesimal effect of effort on aggregate public learning;
it reappears in the transition for \(X_{t+1}\).

### Transition

With that economic structure in place, the marginal incentive immediately
delivers the paper's main static result.

## Slide 3 -- Main result -- target: 80 seconds

### Core script

Start with the intuition. More general knowledge raises the value of learning
about one particular case, so \(X\) complements human effort. By contrast,
effort and AI both add precision to the same object, \(Y\). Because prediction
success has diminishing returns to precision, more AI lowers the marginal
return to effort.

The first-order condition equates marginal benefit,
\(\lambda_I\Delta_XG(X)g(Y)\), to marginal cost,
\(e^{1/\varepsilon}\). Here \(g=G'\) is the marginal effect of precision on
the probability of a correct prediction. Differentiating marginal utility
with respect to \(X\) gives a positive cross-partial. Differentiating it with
respect to \(\tau_A\) gives a negative cross-partial because \(g'(Y)<0\).

The strict signs require positive \(X\), positive \(Y\), and positive
\(\Delta_X\), \(\lambda_I\), and \(\varepsilon\). The boundary is different:
at \(X=0\), the AI cross-partial is zero, while \(g(0)\) is not finite. I keep
that technical qualification secondary because the main economic result is
the complementarity and substitution on the interior path.

### Intuition behind the equations

The factor \(G(X)\) in marginal benefit is the chance that case-specific
learning unlocks the complementarity payoff. The factor \(g(Y)\lambda_I\) is
the extra probability of case-specific success produced by one more unit of
effort. Their product, multiplied by \(\Delta_X\), is the marginal expected
payoff. The cost derivative is the amount paid at the margin.

### Meaning of the displayed variables

In addition to the previous slide, \(g(\tau)=G'(\tau)>0\) is marginal
prediction success, and \(g'(\tau)<0\) captures diminishing returns to
precision. \(U_{eX}\) asks how public precision changes marginal effort value;
\(U_{e\tau_A}\) asks how AI precision changes it.

### Technical backup

For \(\tau>0\),
\[
g(\tau)=\frac{\phi(\sqrt\tau)}{\sqrt\tau},\qquad
g'(\tau)=-\frac12\left(1+\frac1\tau\right)g(\tau)<0.
\]
The FOC has a unique positive solution for \(X>0\): marginal benefit is
positive at zero and decreasing in effort, while marginal cost starts at zero
and increases. Globally, increasing differences in \((e,X)\) and weak
decreasing differences in \((e,\tau_A)\) preserve the interpretation without
requiring finite cross-partials at every boundary point.

### Transition

The boundary check points directly to the production assumption that makes
effort vanish when public knowledge is zero.

## Slide 4 -- What I did -- target: 75 seconds

### Core script

My first contribution is the domain audit: Observation 1 is economically
correct, but its strict derivative formulation requires \(X>0\).

My second contribution asks what happens if case-specific correctness has
some autonomous value. The baseline condition \(\Delta_I=0\) says that a
correct reading of the patient or asset produces no gain when the common
prediction is wrong. This sharp complementarity is useful, but it rules out
triage, rejecting an obviously bad investment, or other local gains from
case-specific information. I therefore consider \(\Delta_I>0\).

Marginal effort now earns a stand-alone return \(\Delta_I\), plus the
complementarity return \(\Delta_X\) weighted by \(G(X)\). At \(X=0\), the
weighted complementarity vanishes but \(\Delta_I\) remains. Marginal benefit
is positive at zero effort, strict concavity gives a unique positive choice,
and that human effort creates a positive public signal. Therefore the
transition maps zero into positive precision: \(F_\Delta(0)>0\). Exact zero is
not a steady state. This does not rule out a small positive steady state or
establish any welfare result.

### Intuition behind the equation

The bracket \([\Delta_I+G(X)\Delta_X]\) separates the two reasons to learn
about a case. \(\Delta_I\) is earned from idiosyncratic correctness alone;
\(G(X)\Delta_X\) is earned only when the common prediction is also correct.
Multiplication by \(\lambda_Ig(Y)\) converts one unit of effort into an
increase in the probability of case-specific success.

### Meaning of the displayed variables

- \(\Delta_I\): payoff gain from idiosyncratic correctness when the common
  prediction is wrong.
- \(e_\Delta(0,\tau_A)\): best-response effort in the extension at the
  zero-public-precision boundary.
- \(F_\Delta(0)\): next period's public precision when current precision is
  zero under the extension.

### Technical backup

At \(X=0\),
\[
U_e=\lambda_I\Delta_Ig(\sigma^{-2}+\lambda_Ie+\tau_A)
-e^{1/\varepsilon}.
\]
It is positive at \(e=0\), negative for sufficiently large \(e\), and strictly
decreasing. With \(\lambda_G>0\), population mass \(I>0\), and finite
\(\Sigma^2>0\), positive effort implies
\[
F_\Delta(0)=\left[\Sigma^2+
(\lambda_GI e_\Delta(0,\tau_A))^{-1}\right]^{-1}>0.
\]
Sections 5.1--5.3 instead change aggregation, add synthetic public data, or
change public knowledge production to \(e^\beta\); none relaxes
\(\Delta_I=0\).

### Transition

The last slide shows the exact calculation I selected for independent
handwritten verification.

## Slide 5 -- Where I did not believe the AI -- target: 50 seconds

### Core script

The initial automated reading described both cross-partials as strictly signed
globally. I checked the boundary rather than accepting that wording.

The success probability satisfies \(G(0)=0\), but its derivative behaves like
\(\phi(0)/\sqrt X\) and diverges as \(X\) approaches zero. Therefore
\(U_{eX}\) is not a finite classical cross-partial at the boundary. The other
cross-partial contains \(G(X)\), so \(U_{e\tau_A}=0\) at \(X=0\), rather than
being strictly negative. Direct optimization is still well defined and gives
zero effort in the baseline.

My verdict is limited: Observation 1 is economically correct, but the strict
cross-partial formulation needs an interior-domain qualification. The photo
will document this calculation, not claim a major error in the paper.

### Meaning of the displayed expressions

\(G(0)=0\) means zero precision gives no chance of falling in the finite
tolerance band under the limiting diffuse posterior. The divergence of
\(g(X)\) means the slope is not finite at zero; it does not make the original
optimization problem undefined.

### Technical backup

At \(X=0\), baseline utility reduces to
\(f(0,0)-c(e)\), so the constrained optimum is \(e=0\). For any
\(X_2>X_1\geq0\), the increment in the marginal value of effort is
nonnegative; for any \(\tau_2>\tau_1\), it is nonpositive. These discrete
comparisons establish the weak global complement/substitute language even
where a finite cross-partial is unavailable.

### Closing line

The central lesson is that AI can improve current personalized information
while weakening the human activity that reproduces public knowledge; the
boundary audit clarifies exactly where the strict calculus statement applies.
