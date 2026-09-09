# Extension: autonomous value of context-specific knowledge

This document develops one modest extension of the May 5, 2026 manuscript.
It changes the payoff from a correct context-specific prediction; it does not
re-solve the paper's dynamics or welfare analysis.

## Baseline assumption and motivation

> **PAPER**

Before Assumption 1, define

\[
\begin{aligned}
\Delta_G&=f(1,0)-f(0,0),\\
\Delta_I&=f(0,1)-f(0,0),\\
\Delta_X&=f(1,1)-f(1,0)-f(0,1)+f(0,0).
\end{aligned}
\]

Assumption 1 imposes

\[
\Delta_I=0,\qquad \Delta_X>0.
\]

It does not require \(\Delta_G>0\); monotonicity only implies
\(\Delta_G\geq0\). The restriction \(\Delta_I=0\) says that a correct
idiosyncratic prediction produces no gain when the common prediction is
wrong. This is a useful strong-complementarity benchmark: for example,
recognizing a symptom may be unproductive without the correct disease model.
It is also demanding. Case-specific information can sometimes improve
triage, reject a clearly bad investment, or solve a local engineering problem
even when general knowledge is poor.

> **OWN EXTENSION / INTERPRETATION**

Allow \(\Delta_I>0\) while retaining \(\Delta_X>0\). This gives autonomous
value to getting the particular case right and directly relaxes the
production assumption that creates zero effort at \(X=0\).

## Modified utility

Let \(C\) and \(I\) denote the events that the common and idiosyncratic
predictions are correct. Their probabilities are \(G(X)\) and \(G(Y)\).
Because the states and posterior errors are independent,
\(\Pr(C\cap I)=G(X)G(Y)\). The general production decomposition therefore
gives

\[
\mathbb E[f]
=f(0,0)+G(X)\Delta_G+G(Y)\Delta_I
+G(X)G(Y)\Delta_X.
\]

The modified objective is

\[
U_\Delta(e;X,\tau_A)
=f(0,0)+G(X)\Delta_G+G(Y)\Delta_I
+G(X)G(Y)\Delta_X-c(e),
\]

where

\[
Y=\sigma^{-2}+\lambda_Ie+\tau_A,
\qquad
c(e)=\frac{\varepsilon}{\varepsilon+1}
e^{(\varepsilon+1)/\varepsilon}.
\]

The terms in \(Y\) add because an independent Gaussian prior, human signal,
and AI signal contribute additive precision about the same idiosyncratic
state.

## Modified first-order condition

Differentiating only the terms that depend on effort gives

\[
U_e
=\lambda_Ig(Y)[\Delta_I+G(X)\Delta_X]-e^{1/\varepsilon}.
\]

The bracket has two returns to human learning: \(\Delta_I\) is the
stand-alone payoff, while \(G(X)\Delta_X\) is the complementarity payoff
weighted by the probability that the common prediction is correct. An
interior optimum satisfies

\[
\lambda_Ig(Y)[\Delta_I+G(X)\Delta_X]=e^{1/\varepsilon}.
\]

## Comparative statics

For \(X>0\),

\[
U_{eX}=\lambda_I\Delta_Xg(X)g(Y)>0.
\]

Public precision still complements effort because it increases the chance of
earning the complementarity gain. For \(X\geq0\), provided \(Y>0\),

\[
U_{e\tau_A}
=\lambda_Ig'(Y)[\Delta_I+G(X)\Delta_X]<0.
\]

AI precision still substitutes for effort through diminishing returns to the
same \(Y\). Unlike the baseline, substitution is strict at \(X=0\) because
\(\Delta_I>0\) keeps the private return to context-specific learning alive.

## Boundary result

At \(X=0\),

\[
U_e
=\lambda_I\Delta_I
g(\sigma^{-2}+\lambda_Ie+\tau_A)-e^{1/\varepsilon}.
\]

With \(\sigma^2\in(0,\infty)\) and finite \(\tau_A\), the marginal benefit
at \(e=0\) is positive and finite. It tends to zero as effort grows, while
marginal cost tends to infinity. Moreover, for \(e>0\),

\[
U_{ee}
=\lambda_I^2g'(Y)[\Delta_I+G(X)\Delta_X]
-\frac1\varepsilon e^{1/\varepsilon-1}<0.
\]

Thus the boundary best response exists, is unique, and is strictly positive.

## Proposed extension result

> **PROPOSITION -- OWN EXTENSION**

Suppose \(\Delta_I>0\), \(\Delta_X>0\), \(\lambda_I>0\),
\(\varepsilon>0\), finite \(\tau_A\), and a proper finite-variance prior.
Maintain \(\lambda_G>0\), population mass \(I>0\), and
\(\Sigma^2\in(0,\infty)\). Then the best response at \(X=0\) is uniquely
positive and the induced public-precision transition satisfies

\[
F_\Delta(0)
=\left[
\Sigma^2+
\bigl(\lambda_GI e_\Delta(0,\tau_A)\bigr)^{-1}
\right]^{-1}>0.
\]

Hence \(X=0\) is not a steady state.

### Proof sketch

At \(e=0\), marginal utility is
\(\lambda_I\Delta_Ig(\sigma^{-2}+\tau_A)>0\). For large effort it is
negative. Strict concavity makes the zero crossing unique, so
\(e_\Delta(0,\tau_A)>0\). Positive human effort creates a common-state signal
with precision \(\lambda_GI e_\Delta(0,\tau_A)>0\). Substituting that precision
into the paper's transition equation yields \(F_\Delta(0)>0\).

## What is established

- Context-specific learning retains a private return at \(X=0\).
- Boundary effort is uniquely positive.
- Zero public precision maps to positive next-period precision.
- The exactly zero knowledge fixed point disappears.

The intuition is simple: even after collective knowledge vanishes, agents
still investigate their own cases; the public by-product of that investigation
restarts general learning.

## What remains open

- The number, location, and stability of positive steady states.
- Whether a positive low-knowledge state replaces zero.
- Basins of attraction and global dynamics.
- Welfare and policy effects.

The result removes complete zero-knowledge collapse, not every form of
low-knowledge persistence. Those claims require a new dynamic analysis.

## Relation to Section 5

> **PAPER / NOVELTY CHECK**

Section 5.1 makes aggregation capacity depend on AI precision through
\(I(\tau_A)\). Section 5.2 adds synthetic common-state precision
\(\tau_{\mathrm{syn}}\); it also creates a positive floor, but through an
exogenous public signal rather than endogenous human effort. Section 5.3
changes public knowledge production from effort to \(e^\beta\). None changes
\(\Delta_I=0\). Our extension therefore alters the production payoff, not
aggregation, data supply, or the technology that converts effort into public
precision.
