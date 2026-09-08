# Focused extension: autonomous value of context-specific knowledge

This is a modest original extension of the May 5, 2026 manuscript. It changes
only the production payoff restriction \(\Delta_I=0\); it does not re-solve
the paper's dynamic or welfare propositions.

## Assumption changed

> **PAPER**

Assumption 1 imposes

\[
\Delta_I=0,\qquad \Delta_G>0,\qquad \Delta_X>0.
\]

Thus a correct idiosyncratic prediction has no stand-alone value when the
common prediction is wrong.

> **DERIVATION - EXTENSION**

Retain \(\Delta_X>0\), but allow

\[
\Delta_I>0.
\]

Context-specific correctness now has an autonomous payoff.

## Original and modified utility

Before imposing Assumption 1, the production decomposition is

\[
\begin{aligned}
\mathbb E[f]
={}&f(0,0)+G(X)\Delta_G+G(Y)\Delta_I\\
&+G(X)G(Y)\Delta_X.
\end{aligned}
\]

The baseline equation sets \(\Delta_I=0\):

\[
U_0=f(0,0)+G(X)\Delta_G+G(X)G(Y)\Delta_X-c(e).
\]

The modified equation retains the general term:

\[
U_\Delta
=f(0,0)+G(X)\Delta_G+G(Y)\Delta_I
+G(X)G(Y)\Delta_X-c(e),
\]

where

\[
Y=\sigma^{-2}+\lambda_Ie+\tau_A,\qquad
c(e)=\frac{\varepsilon}{\varepsilon+1}
e^{(\varepsilon+1)/\varepsilon}.
\]

## New first-order condition and cross-partials

The marginal payoff is

\[
U_e
=\lambda_Ig(Y)[\Delta_I+G(X)\Delta_X]-e^{1/\varepsilon}.
\]

An interior optimum satisfies

\[
\lambda_Ig(Y)[\Delta_I+G(X)\Delta_X]=e^{1/\varepsilon}.
\]

The cross-partials are

\[
U_{eX}=\lambda_I\Delta_Xg(X)g(Y)>0
\quad (X>0),
\]

\[
U_{e\tau_A}
=\lambda_Ig'(Y)[\Delta_I+G(X)\Delta_X]<0
\quad (X\geq0).
\]

Hence public precision still complements effort on the classical interior, and
AI precision still substitutes for effort. Unlike the baseline model, the
substitution is strict at \(X=0\).

## Behavior at \(X=0\)

At the boundary,

\[
U_e
=\lambda_I\Delta_Ig(\sigma^{-2}+\lambda_Ie+\tau_A)
-e^{1/\varepsilon}.
\]

Under \(\sigma^2\in(0,\infty)\), \(\lambda_I>0\), \(\Delta_I>0\),
\(\varepsilon>0\), and finite \(\tau_A\geq0\), the derivative at \(e=0\) is
strictly positive and finite. As \(e\to\infty\), it tends to
\(-\infty\). Moreover, for \(e>0\),

\[
U_{ee}
=\lambda_I^2g'(Y)[\Delta_I+G(X)\Delta_X]
-\frac1\varepsilon e^{1/\varepsilon-1}<0.
\]

Thus the objective is strictly concave and has one finite, strictly positive
optimum \(e_\Delta(0,\tau_A)\).

Keeping the paper's public-precision transition and its
\(\lambda_G>0\), \(I>0\), and \(\Sigma^2>0\) primitives,

\[
F_\Delta(0)
=\left[
\Sigma^2+\bigl(\lambda_GI e_\Delta(0,\tau_A)\bigr)^{-1}
\right]^{-1}>0.
\]

Therefore \(X=0\) is not a fixed point in this extension.

## Result demonstrated

> **DERIVATION**

Giving context-specific knowledge autonomous value changes the boundary:
agents exert positive effort even with no inherited public precision, and that
effort produces positive next-period public precision. The exact
zero-knowledge fixed point of the baseline model is eliminated.

> **INTERPRETATION**

The complete-collapse state may become a strictly positive low-knowledge
state. This extension removes exact zero as a fixed point; it does not prove
that all low-knowledge traps, multiplicity, or collapse-like comparative
statics disappear.

## Results that remain open

> **OPEN QUESTION**

- Existence, number, location, and stability of positive steady states.
- Whether a distinct low-knowledge fixed point replaces zero.
- Basin boundaries and global dynamics.
- The modified analogues of Propositions 3--13.
- Welfare and policy effects under \(\Delta_I>0\).

These require a new dynamic analysis and are not inferred here.

## Section 5 novelty check

> **PAPER / AUDIT**

- Section 5.1 lets AI improve aggregation through \(I(\tau_A)\).
- Section 5.2 adds synthetic information about the common state.
- Section 5.3 changes public-knowledge production to depend on \(e^\beta\).

None changes the production payoff restriction \(\Delta_I=0\). The extension
above is therefore not one of the paper's Section 5 exercises.
