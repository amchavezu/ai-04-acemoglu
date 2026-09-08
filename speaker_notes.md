# Speaker notes

## Title slide - 20 seconds

This presentation studies *AI, Human Cognition and Knowledge Collapse* by
Daron Acemoglu, Dingwen Kong, and Asuman Ozdaglar. I use the May 5, 2026
manuscript of NBER Working Paper 34910. I will explain the paper's static
incentive mechanism, one boundary qualification, and one focused extension.

**Transition:** I will begin with the economic problem faced by one agent.

## Slide 2: The paper and the agent's problem - 70 seconds

The paper asks whether agentic AI can improve a personalized decision today
while weakening the human effort that maintains collective knowledge for
future decision makers.

Production needs two complementary predictions. General knowledge concerns the
common state, such as the overall investment environment or the general
medical evidence. Its precision is \(X\). Context-specific knowledge concerns
the current asset or patient. Its posterior precision is \(Y\).

The agent chooses effort \(e\). Effort increases \(Y\) through
\(\lambda_I e\), while AI adds precision \(\tau_A\) to that same object. The
agent takes \(X\) and AI precision as given. Effort also contributes a public
signal about the common state, but an atomistic, short-lived agent does not
value that infinitesimal contribution to future cohorts. This missing public
return is the externality that drives the dynamic mechanism.

**Transition:** The first-order incentives reveal why public knowledge and AI
move effort in opposite directions.

## Slide 3: Main result and conditions - 80 seconds

Observation 1 compares the marginal payoff from effort across two forms of
precision. The first cross-partial is positive. More public precision \(X\)
makes a correct idiosyncratic prediction more productive, so general knowledge
complements effort.

The second cross-partial is negative. Human effort and agentic AI both raise
the same idiosyncratic precision \(Y\). The function \(G\) gives the
probability of predicting within the model's tolerance band, and its
derivative \(g\) falls with precision. Therefore extra AI precision lowers the
marginal return to another unit of effort.

These strict signs require \(X>0\), \(Y>0\), positive complementarity
\(\Delta_X\), positive learning productivity \(\lambda_I\), and
\(\varepsilon>0\). At \(X=0\), the AI cross-partial equals zero and \(g(0)\)
is not finite. The strict derivative display is therefore an interior result.

**Transition:** That boundary check also suggests a direct extension of the
production assumption.

## Slide 4: What I did - 70 seconds

My first contribution was to audit the strict cross-partial statement. The
result is economically correct, but the classical derivatives need an
interior-domain qualification. Discrete comparisons still give increasing
differences between public precision and effort, and weak decreasing
differences between AI precision and effort, including the boundary.

My second contribution relaxes \(\Delta_I=0\). In the paper's baseline,
idiosyncratic correctness has no stand-alone value. I instead let
\(\Delta_I>0\). The marginal benefit of effort then contains
\(\Delta_I+G(X)\Delta_X\).

At \(X=0\), the \(\Delta_I\) term remains positive. Strict concavity yields a
unique positive effort choice. That effort creates a positive public signal,
so the transition maps zero precision into positive precision:
\(F_\Delta(0)>0\). Exact zero-knowledge collapse disappears. I have not proved
that all positive low-knowledge steady states disappear.

**Transition:** The final slide isolates the calculation that needs a physical
hand check.

## Slide 5: Where I did not believe the AI - 60 seconds

The initial automated interpretation treated both cross-partials as strictly
signed everywhere. I checked the boundary separately.

The probability function satisfies \(G(0)=0\), but its derivative behaves like
\(\phi(0)/\sqrt{X}\) near zero and is not finite at the boundary. Thus
\(U_{eX}\) is not a finite classical cross-partial at \(X=0\). The other
cross-partial contains \(G(X)\), so \(U_{e\tau_A}=0\) there rather than being
strictly negative.

This does not overturn the mechanism. On the interior, public knowledge
strictly complements effort and AI strictly substitutes for it. Globally, the
same ordering survives in a weak differences sense. The photograph will show
this derivation once the student adds it.

## Likely questions

### Why does precision add?

The signals are conditionally independent and Gaussian. Bayesian updating
adds their precisions, which are inverse variances, so prior, effort-produced,
and AI precision enter \(Y\) linearly.

### Why does the agent ignore public learning?

Agents are short-lived and atomistic. One person's contribution to aggregate
public precision is infinitesimal, and the benefit arrives for future cohorts,
so it does not enter the private first-order condition.

### Why does AI crowd out effort?

AI and effort increase the same idiosyncratic precision \(Y\). Since \(G\) is
concave for positive precision, AI lowers the marginal gain from additional
human learning.

### What exactly fails at \(X=0\)?

\(G(0)=0\), so the AI-effort cross-partial equals zero. Meanwhile
\(g(X)\) diverges as \(X\) approaches zero, so the effort-public-precision
cross-partial has no finite classical boundary value.

### Why does \(\Delta_I>0\) remove the zero fixed point?

It gives private learning a positive payoff even when \(X=0\). The unique
best response is then positive, current effort creates a positive public
signal, and the next period begins with \(F_\Delta(0)>0\).
