# Handwritten derivation guide

## Why this is the selected check

This is the best handwritten verification because it is central to the
assigned static problem, reproduces Observation 1 independently, and exposes
a genuine boundary issue without redoing the paper's read-only dynamic proofs.
It fits in two pages and has a clear economic interpretation.

## Suggested title

**Observation 1: cross-partials and the boundary \(X=0\)**

Use the baseline model with \(\Delta_I=0\). Write the labels in quotation
marks below as short margin notes.

## Page 1 -- probability technology and interior derivatives

### 1. Define prediction success

Write

\[
G(\tau)=2\Phi(\sqrt{\tau})-1,
\qquad \tau\geq0.
\]

Margin note: **``precision \(\to\) probability of a correct prediction.''**

### 2. Derive \(g=G'\)

For \(\tau>0\), apply the chain rule:

\[
\begin{aligned}
g(\tau)=G'(\tau)
&=2\Phi'(\sqrt\tau)\frac{d\sqrt\tau}{d\tau}\\
&=2\phi(\sqrt\tau)\frac{1}{2\sqrt\tau}\\
&=\frac{\phi(\sqrt\tau)}{\sqrt\tau}>0.
\end{aligned}
\]

Margin note: **``more precision raises success.''**

### 3. Derive \(g'\)

First rewrite the density:

\[
g(\tau)=(2\pi)^{-1/2}e^{-\tau/2}\tau^{-1/2}.
\]

Apply the product rule:

\[
\begin{aligned}
g'(\tau)
&=(2\pi)^{-1/2}
\left[-\frac12e^{-\tau/2}\tau^{-1/2}
-\frac12e^{-\tau/2}\tau^{-3/2}\right]\\
&=-\frac12\left(1+\frac1\tau\right)g(\tau)<0,
\qquad \tau>0.
\end{aligned}
\]

Margin note: **``diminishing returns to precision.''**

### 4. Define private posterior precision

Write

\[
Y=\sigma^{-2}+\lambda_Ie+\tau_A,
\qquad
Y_e=\lambda_I,\quad Y_X=0,\quad Y_{\tau_A}=1.
\]

Margin note: **``independent prior, human, and AI precisions add.''**

### 5. Write the baseline utility and identify the choice

\[
U(e;X,\tau_A)
=f(0,0)+G(X)\Delta_G+G(X)G(Y)\Delta_X
-\frac{\varepsilon}{\varepsilon+1}
e^{(\varepsilon+1)/\varepsilon},
\qquad e\geq0.
\]

Write underneath:

\[
\text{choice: }e;qquad
\text{taken as given: }X,\tau_A.
\]

Margin note: **``probability \(\times\) payoff, minus effort cost.''**

### 6. Differentiate with respect to effort

Show both chain-rule and cost steps:

\[
\begin{aligned}
U_e
&=G(X)\Delta_X\,g(Y)Y_e
-\frac{\varepsilon}{\varepsilon+1}
\frac{\varepsilon+1}{\varepsilon}e^{1/\varepsilon}\\
&=\lambda_I\Delta_XG(X)g(Y)-e^{1/\varepsilon}.
\end{aligned}
\]

Margin note: **``marginal expected payoff minus marginal cost.''**

### 7. Derive both cross-partials

Holding \(e\) and \(\tau_A\) fixed, use \(Y_X=0\):

\[
\begin{aligned}
U_{eX}
&=\lambda_I\Delta_XG'(X)g(Y)\\
&=\lambda_I\Delta_Xg(X)g(Y).
\end{aligned}
\]

Holding \(e\) and \(X\) fixed, use \(Y_{\tau_A}=1\):

\[
\begin{aligned}
U_{e\tau_A}
&=\lambda_I\Delta_XG(X)g'(Y)Y_{\tau_A}\\
&=\lambda_I\Delta_XG(X)g'(Y).
\end{aligned}
\]

Margin notes: **``\(X\) raises the value of effort''** and
**``AI lowers it through diminishing returns in \(Y\).''**

## Page 2 -- signs, boundary, and verdict

### 8. Sign the interior result

Write the conditions before the inequalities:

\[
X>0,\quad Y>0,\quad
\Delta_X>0,\quad\lambda_I>0,\quad\varepsilon>0.
\]

Then

\[
g(X)>0,\quad g(Y)>0,\quad G(X)>0,\quad g'(Y)<0,
\]

so

\[
\boxed{U_{eX}>0}\quad\text{and}\quad
\boxed{U_{e\tau_A}<0}.
\]

Margin note: **``general knowledge complements effort; agentic AI
substitutes for effort.''**

### 9. Evaluate \(X=0\) separately

First compute the level:

\[
G(0)=2\Phi(0)-1=0.
\]

Then compute the limiting slope:

\[
g(X)=\frac{\phi(\sqrt X)}{\sqrt X}
\sim\frac{\phi(0)}{\sqrt X}\longrightarrow+\infty
\quad\text{as }X\downarrow0.
\]

Therefore \(g(0)\) is not finite, and \(U_{eX}\) is not a finite classical
cross-partial at the boundary. But the AI cross-partial can be evaluated from
its formula because \(Y>0\):

\[
U_{e\tau_A}(e;0,\tau_A)
=\lambda_I\Delta_XG(0)g'(Y)=0.
\]

Margin note: **``weak substitution, not a strict negative derivative.''**

### 10. Show that the optimization problem remains well defined

Substitute \(G(0)=0\) into utility:

\[
U(e;0,\tau_A)
=f(0,0)
-\frac{\varepsilon}{\varepsilon+1}
e^{(\varepsilon+1)/\varepsilon}.
\]

Since the cost is zero at \(e=0\) and strictly increasing for \(e>0\),

\[
\boxed{e^*(0,\tau_A)=0}.
\]

Margin note: **``the derivative issue does not make the choice problem
undefined.''**

### 11. Add one line on global weak differences

Write:

\[
U_e(e;X,\tau_A)
=\lambda_I\Delta_XG(X)g(Y)-e^{1/\varepsilon}.
\]

Because \(G(X)\) is nondecreasing on \(X\geq0\), marginal effort value is
nondecreasing in \(X\). Because \(g(Y)\) is decreasing in \(\tau_A\), it is
nonincreasing in \(\tau_A\); at \(X=0\) it is constant in \(\tau_A\). This is
the discrete increasing/decreasing-differences interpretation.

### 12. End with this verdict

> **Observation 1 is economically correct. Its strict cross-partial signs
> hold on the interior \(X>0\). At \(X=0\),
> \(U_{e\tau_A}=0\) and \(U_{eX}\) is not finite, so the global statement is
> valid only in the weak increasing/decreasing-differences sense.**

## Conditions not to omit

- \(X>0\) for the finite, strictly positive \(U_{eX}\) formula.
- \(Y>0\), guaranteed here by a proper finite-variance prior.
- \(\Delta_X>0\), \(\lambda_I>0\), and \(\varepsilon>0\).
- \(e\geq0\), so the baseline solution at \(X=0\) is a corner.
- The calculation uses the baseline \(\Delta_I=0\), not the extension.

## Two-page layout recommendation

- **Page 1:** Steps 1--7. Put the three short economic notes in the right
  margin and box the two cross-partial formulas.
- **Page 2:** Steps 8--12. Draw a horizontal line before the boundary check,
  box \(e^*(0,\tau_A)=0\), and finish with the verdict in a separate box.
- Keep the paper flat, use dark ink, and leave enough margin for a rectangular
  crop in the slide.

## Final file

Photograph the completed pages clearly and save the image as:

`hand/observation1-boundary.jpg`

Do not create or rename that file until the physical derivation exists.
