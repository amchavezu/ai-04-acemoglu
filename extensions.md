# Extension: autonomous value of context-specific knowledge

This document develops one modest extension of the May 5, 2026 manuscript.
It changes a maintained production assumption and does not re-solve the
paper's dynamic or welfare propositions.

## Baseline assumption

> **PAPER**

Assumption 1 imposes

\[
\Delta_I=0,\qquad \Delta_G>0,\qquad \Delta_X>0.
\]

Thus, getting the idiosyncratic prediction right has no stand-alone production
value when the common prediction is wrong.

## Modified utility

> **OWN EXTENSION**

Retain \(\Delta_X>0\), but allow \(\Delta_I>0\). Before Assumption 1, expected
production admits the decomposition

\[
\mathbb E[f]
=f(0,0)+G(X)\Delta_G+G(Y)\Delta_I+G(X)G(Y)\Delta_X.
\]

The modified objective is therefore

\[
U_\Delta(e;X,\tau_A)
=f(0,0)+G(X)\Delta_G+G(Y)\Delta_I
+G(X)G(Y)\Delta_X-c(e),
\]

with

\[
Y=\sigma^{-2}+\lambda_Ie+\tau_A,
\qquad
c(e)=\frac{\varepsilon}{\varepsilon+1}
e^{(\varepsilon+1)/\varepsilon}.
\]

## Modified first-order condition

\[
U_e
=\lambda_Ig(Y)[\Delta_I+G(X)\Delta_X]-e^{1/\varepsilon}.
\]

An interior optimum satisfies

\[
\lambda_Ig(Y)[\Delta_I+G(X)\Delta_X]=e^{1/\varepsilon}.
\]

## Comparative statics

For \(X>0\),

\[
U_{eX}=\lambda_I\Delta_Xg(X)g(Y)>0.
\]

Public precision continues to complement effort. For \(X\geq0\),

\[
U_{e\tau_A}
=\lambda_Ig'(Y)[\Delta_I+G(X)\Delta_X]<0.
\]

AI precision continues to substitute for effort. The substitution is now
strict at \(X=0\) because \(\Delta_I>0\) preserves a private return to
idiosyncratic learning.

## Boundary result

At \(X=0\),

\[
U_e
=\lambda_I\Delta_I
g(\sigma^{-2}+\lambda_Ie+\tau_A)-e^{1/\varepsilon}.
\]

For a proper finite-variance prior and finite \(\tau_A\), the first term is
positive and finite at \(e=0\). The marginal payoff tends to \(-\infty\) as
\(e\to\infty\). Moreover,

\[
U_{ee}
=\lambda_I^2g'(Y)[\Delta_I+G(X)\Delta_X]
-\frac1\varepsilon e^{1/\varepsilon-1}<0
\quad (e>0).
\]

Strict concavity and the endpoint signs give a unique positive optimum at the
boundary.

## Proposed extension result

> **PROPOSITION - OWN EXTENSION**

Suppose \(\Delta_I>0\), \(\Delta_X>0\), \(\lambda_I>0\),
\(\varepsilon>0\), finite \(\tau_A\), and a proper finite-variance prior.
Maintain \(\lambda_G>0\), \(I>0\), and \(\Sigma^2>0\). Then the best response
at \(X=0\) is uniquely positive and the induced public-precision transition
satisfies

\[
F_\Delta(0)
=\left[
\Sigma^2+
\bigl(\lambda_GI e_\Delta(0,\tau_A)\bigr)^{-1}
\right]^{-1}>0.
\]

Hence \(X=0\) is not a steady state.

### Proof sketch

At \(e=0\), marginal utility equals
\(\lambda_I\Delta_Ig(\sigma^{-2}+\tau_A)>0\). It becomes negative for large
effort. Strict concavity makes the crossing unique, so
\(e_\Delta(0,\tau_A)>0\). Positive effort generates a public signal with
positive precision. Substitution into the paper's transition equation yields
\(F_\Delta(0)>0\).

## What is established

- Context-specific knowledge has a private return at \(X=0\).
- Boundary effort is uniquely positive.
- Zero public precision maps to positive next-period precision.
- The exact zero-knowledge fixed point disappears.

## What remains open

- The number and stability of positive steady states.
- Whether a positive low-knowledge state replaces zero.
- Basins of attraction and global dynamics.
- Welfare and policy effects.

These questions require a new dynamic analysis. The proposition does not claim
that every low-knowledge outcome disappears.

## Relation to Section 5

> **PAPER / NOVELTY CHECK**

Section 5.1 changes knowledge aggregation through \(I(\tau_A)\). Section 5.2
adds synthetic information about the common state. Section 5.3 changes public
knowledge production to depend on \(e^\beta\). None relaxes
\(\Delta_I=0\), so the result above is not one of the paper's extensions.
