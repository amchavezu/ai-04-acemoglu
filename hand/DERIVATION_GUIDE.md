# Handwritten derivation guide

## Topic and limit

Write at most two handwritten pages titled:

**Observation 1: cross-partials and the boundary \(X=0\)**

Use the baseline model with \(\Delta_I=0\). Keep every chain-rule factor
visible. Do not include the dynamic proofs.

## Page 1: interior derivation

Write these steps in order.

1. Define the probability-of-correct-prediction function:

   \[
   G(\tau)=2\Phi(\sqrt{\tau})-1,\qquad \tau\geq0.
   \]

2. Differentiate it for \(\tau>0\):

   \[
   g(\tau)=G'(\tau)
   =2\phi(\sqrt{\tau})\frac{1}{2\sqrt{\tau}}
   =\frac{\phi(\sqrt{\tau})}{\sqrt{\tau}}.
   \]

3. Rewrite and differentiate \(g\):

   \[
   g(\tau)=(2\pi)^{-1/2}e^{-\tau/2}\tau^{-1/2},
   \]

   \[
   g'(\tau)
   =-\frac12\left(1+\frac1\tau\right)g(\tau)<0,
   \qquad \tau>0.
   \]

4. Define total idiosyncratic precision and record its derivatives:

   \[
   Y=\sigma^{-2}+\lambda_Ie+\tau_A,\qquad
   Y_e=\lambda_I,\quad Y_X=0,\quad Y_{\tau_A}=1.
   \]

5. Write expected utility:

   \[
   U=f(0,0)+G(X)\Delta_G+G(X)G(Y)\Delta_X
   -\frac{\varepsilon}{\varepsilon+1}
   e^{(\varepsilon+1)/\varepsilon}.
   \]

6. Differentiate with respect to effort, explicitly applying the chain rule:

   \[
   U_e
   =G(X)\Delta_Xg(Y)Y_e-e^{1/\varepsilon}
   =\lambda_I\Delta_XG(X)g(Y)-e^{1/\varepsilon}.
   \]

7. Differentiate \(U_e\) with respect to \(X\):

   \[
   U_{eX}
   =\lambda_I\Delta_Xg(X)g(Y)>0
   \quad\text{for }X>0.
   \]

   Add: \(Y_X=0\), so no additional term appears.

8. Differentiate \(U_e\) with respect to \(\tau_A\):

   \[
   U_{e\tau_A}
   =\lambda_I\Delta_XG(X)g'(Y)<0
   \quad\text{for }X>0.
   \]

   Add: \(Y_{\tau_A}=1\), \(G(X)>0\), and \(g'(Y)<0\).

## Page 2: boundary check and verdict

9. State the interior signs and their meaning:

   \[
   U_{eX}>0
   \quad\Rightarrow\quad
   X\text{ complements effort},
   \]

   \[
   U_{e\tau_A}<0
   \quad\Rightarrow\quad
   \tau_A\text{ substitutes for effort}.
   \]

10. Evaluate \(X=0\) separately:

    \[
    G(0)=2\Phi(0)-1=0,
    \qquad
    g(\tau)\sim\frac{\phi(0)}{\sqrt{\tau}}\to+\infty.
    \]

    Therefore \(g(0)\) is not finite and \(U_{eX}\) is not a finite
    classical cross-partial at the boundary. Nevertheless,

    \[
    U(e;0,\tau_A)=f(0,0)
    -\frac{\varepsilon}{\varepsilon+1}
    e^{(\varepsilon+1)/\varepsilon},
    \]

    so the problem is well defined and its unique optimum is \(e^*=0\).
    Also,

    \[
    U_{e\tau_A}(e;0,\tau_A)
    =\lambda_I\Delta_XG(0)g'(Y)=0.
    \]

11. End with this verdict:

> Observation 1 is correct on the interior \(X>0\). At \(X=0\), AI precision
> is only a weak substitute because \(U_{e\tau_A}=0\), while \(U_{eX}\) is not
> a finite classical cross-partial. The economic mechanism survives, but the
> strict derivative statement needs an interior-domain qualification.

## Before photographing

- Check that all three chain-rule factors \(Y_e\), \(Y_X\), and
  \(Y_{\tau_A}\) are shown.
- Check that strict signs are explicitly restricted to \(X>0\).
- Check that \(G(0)=0\) is not confused with a finite \(g(0)\).
- Check that no dynamic proposition is claimed or proved.
- Save the future photograph as **hand/observation1-boundary.jpg**.
