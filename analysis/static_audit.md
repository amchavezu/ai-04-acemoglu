# Static audit: Observation 1 and the boundary

## 1. Source location

> **PAPER**

This audit uses only the May 5, 2026 MIT manuscript, *AI, Human Cognition, and Knowledge Collapse*, NBER Working Paper 34910, stored locally at paper/07-acemoglu-kong-ozdaglar-2026-knowledge-collapse.pdf. The static problem and Observation 1 are on manuscript pages 13--15 (PDF pages 14--16). Sections 5.1--5.3 are on manuscript pages 30--34.

## 2. Baseline utility

> **PAPER**

Assumption 1 imposes \(\Delta_I=0\) and \(\Delta_X>0\). It does **not**
impose \(\Delta_G>0\): weak monotonicity gives \(\Delta_G\geq0\), and the
paper explicitly allows (but does not require) a strictly positive
stand-alone gain from general knowledge. Let

\[
Y=\sigma^{-2}+\lambda_I e+\tau_A,
\qquad
c(e)=\frac{\varepsilon}{\varepsilon+1}
e^{(\varepsilon+1)/\varepsilon}.
\]

The agent's expected utility is

\[
U(e;X,\tau_A)
=f(0,0)+G(X)\Delta_G
+G(X)G(Y)\Delta_X-c(e),
\qquad e\geq0.
\]

Here \(X\) and \(\tau_A\) are taken as given. Effort changes only \(Y\), with
\(Y_e=\lambda_I\), \(Y_X=0\), and \(Y_{\tau_A}=1\).

## 3. Derivative of \(g\)

> **DERIVATION**

\[
G(\tau)=2\Phi(\sqrt{\tau})-1.
\]

For \(\tau>0\), the chain rule gives

\[
g(\tau)=G'(\tau)
=2\phi(\sqrt{\tau})\frac{1}{2\sqrt{\tau}}
=\frac{\phi(\sqrt{\tau})}{\sqrt{\tau}}.
\]

Since \(\phi(\sqrt{\tau})=(2\pi)^{-1/2}\exp(-\tau/2)\),

\[
g(\tau)=(2\pi)^{-1/2}e^{-\tau/2}\tau^{-1/2}.
\]

Differentiating the exponential and power factors separately,

\[
\begin{aligned}
g'(\tau)
&=(2\pi)^{-1/2}e^{-\tau/2}
\left[-\frac12\tau^{-1/2}-\frac12\tau^{-3/2}\right] \\
&=-\frac12\left(1+\frac1\tau\right)g(\tau)<0,
\qquad \tau>0.
\end{aligned}
\]

Thus \(G\) is increasing and strictly concave on \((0,\infty)\). It extends
continuously to \(G(0)=2\Phi(0)-1=0\), but

\[
g(\tau)\sim\frac{\phi(0)}{\sqrt{\tau}}\longrightarrow+\infty
\quad\text{as }\tau\downarrow0.
\]

Therefore \(g(0)\) is not finite and \(G\) has no finite right derivative at
zero.

## 4. Cross-partials

> **DERIVATION**

First differentiate \(G(Y)\) with respect to effort. The outer derivative is
\(g(Y)\), and the inner derivative is \(Y_e=\lambda_I\). The cost derivative is
\(c'(e)=e^{1/\varepsilon}\). Hence

\[
U_e
=\lambda_I\Delta_XG(X)g(Y)-e^{1/\varepsilon}.
\]

Next differentiate this marginal payoff with respect to \(X\). Only \(G(X)\)
depends on \(X\); \(Y_X=0\). Therefore

\[
U_{eX}
=\lambda_I\Delta_Xg(X)g(Y).
\]

Finally differentiate \(U_e\) with respect to \(\tau_A\). The chain rule gives
\(\partial g(Y)/\partial\tau_A=g'(Y)Y_{\tau_A}=g'(Y)\), while \(G(X)\)
does not change. Therefore

\[
U_{e\tau_A}
=\lambda_I\Delta_XG(X)g'(Y).
\]

## 5. Interior conditions

> **PAPER**

The maintained primitives imply \(\lambda_I>0\), \(\Delta_X>0\),
\(\varepsilon>0\), \(\sigma^2>0\), \(e\geq0\), and \(\tau_A\geq0\).
Consequently \(Y=\sigma^{-2}+\lambda_Ie+\tau_A>0\).

> **DERIVATION**

For \(X>0\), both cross-partials are finite:

\[
U_{eX}>0
\quad\text{and}\quad
U_{e\tau_A}<0.
\]

Strict complementarity requires \(X>0\), \(Y>0\), \(\lambda_I>0\), and
\(\Delta_X>0\). Strict substitution additionally uses \(G(X)>0\) and
\(g'(Y)<0\). The utility and \(U_e\) are defined for \(X\geq0\); the
classical derivative \(U_{eX}\) is defined only for \(X>0\).

## 6. Boundary \(X=0\)

> **BOUNDARY CHECK**

Because \(G(0)=0\), the entire baseline private return to context-specific
precision vanishes:

\[
U(e;0,\tau_A)=f(0,0)-c(e).
\]

This optimization problem is continuous and well defined even though \(g(0)\)
is not finite: its objective uses \(G(0)\), not \(g(0)\). Since \(c(e)\) is
strictly increasing for \(e>0\), the unique optimum is \(e^*=0\).

The AI cross-partial remains a valid finite derivative at the boundary because
\(Y>0\):

\[
U_{e\tau_A}(e;0,\tau_A)
=\lambda_I\Delta_XG(0)g'(Y)=0.
\]

Thus AI precision is a weak, not strict, substitute at \(X=0\). By contrast,

\[
U_{eX}=\lambda_I\Delta_Xg(X)g(Y)
\]

has no finite classical value at \(X=0\), because \(g(X)\to+\infty\). Its
right-hand effect is positive and unbounded, not zero.

## 7. Increasing- and decreasing-differences interpretation

> **DERIVATION**

Cross-partials establish local interior comparative statics. Discrete
differences give the global order statement, including the boundary. For
\(e_2>e_1\),

\[
\begin{aligned}
&[U(e_2;X,\tau_A)-U(e_1;X,\tau_A)] \\
&\quad=\Delta_XG(X)
\left[G(Y_2)-G(Y_1)\right]-[c(e_2)-c(e_1)].
\end{aligned}
\]

Because \(G(X)\) is increasing and \(G(Y_2)-G(Y_1)>0\), this expression is
increasing in \(X\). Hence effort and public precision have increasing
differences globally; the ordering remains meaningful at \(X=0\).

For fixed \(X\), the incremental return to higher effort falls when \(\tau_A\)
rises because strict concavity of \(G\) makes
\[
G(a+\lambda_Ie_2+\tau_A)-G(a+\lambda_Ie_1+\tau_A)
\]
decrease in \(\tau_A\). Thus effort and AI precision have decreasing
differences weakly for all \(X\geq0\), strictly when \(X>0\), and with equality
when \(X=0\).

> **INTERPRETATION**

More general knowledge makes learning the particular case more useful.
More AI precision supplies the same idiosyncratic precision as effort, so
diminishing returns to total precision crowd effort out. At zero public
knowledge, Assumption 1 removes every private benefit of getting only the
particular case right, so both effort and its sensitivity to AI are zero.

## 8. Final verdict on Observation 1

> **VERDICT**

**Correct with a domain qualification.** The strict cross-partial statements
are correct on the interior \(X>0\) (and \(Y>0\)). At \(X=0\),
\(U_{e\tau_A}=0\) and \(U_{eX}\) is not a finite classical cross-partial.
The paper's economic interpretation survives globally in the weak
increasing-/decreasing-differences sense, and the boundary optimum remains
well defined at \(e=0\). This is a boundary-domain qualification, not a
demonstrated contradiction of the formal interior result.

## 9. Comparison with the \(\Delta_I>0\) extension

> **DERIVATION**

With \(\Delta_I>0\),

\[
U_e=\lambda_Ig(Y)[\Delta_I+G(X)\Delta_X]-e^{1/\varepsilon}.
\]

The \(X\)-cross-partial is unchanged, but

\[
U_{e\tau_A}
=\lambda_Ig'(Y)[\Delta_I+G(X)\Delta_X]<0
\]

even at \(X=0\). At that boundary, \(U_e(0)>0\), strict concavity and the
endpoint signs yield a unique \(e^*>0\). Therefore the baseline transition
maps zero public precision to a positive value, eliminating the exact
zero-knowledge fixed point. This does not establish that all positive
low-knowledge states or collapse-like dynamics disappear.
