# AI, Human Cognition and Knowledge Collapse

This repository studies Daron Acemoglu, Dingwen Kong, and Asuman Ozdaglar,
*AI, Human Cognition and Knowledge Collapse*, NBER Working Paper 34910. The
primary version read here is the authors' [MIT manuscript dated May 5,
2026](https://economics.mit.edu/sites/default/files/2026-05/AI%2C%20Human%20Cognition%20and%20Knowledge%20Collapse%2005-05-26.pdf);
the [NBER record](https://www.nber.org/papers/w34910) identifies it as a
working paper, not a peer-reviewed publication.

Student repository:
[amchavezu/ai-04-acemoglu](https://github.com/amchavezu/ai-04-acemoglu)

Author: **Alvaro Marcelo Chávez Unyen**

## Question

Can agentic AI improve personalized decisions today while weakening the human
effort that maintains collective knowledge for tomorrow?

## Economic mechanism

Production needs two complementary inputs. **General knowledge** identifies
the common state shared across cases. **Context-specific knowledge** identifies
what is special about the current patient, investment, or task. Human effort
improves the agent's private information and also contributes a public signal
used by future cohorts. The agent captures the private return but, because
agents are short-lived and atomistic, does not internalize that public
externality.

Agentic AI substitutes for the private information produced by effort. Lower
effort then reduces the next cohort's general knowledge:

\[
\tau_A\uparrow
\Rightarrow e_t\downarrow
\Rightarrow E_t\downarrow
\Rightarrow X_{t+1}\downarrow.
\]

The first arrow is a static incentive effect. The remaining arrows connect an
individual best response to the collective law of motion. When lower public
precision further reduces the return to effort, this feedback can produce
knowledge collapse.

## Agent's problem

\[
\max_{e\geq0}
\left\{
f(0,0)+G(X)\Delta_G
+G(X)G(Y)\Delta_X
-\frac{\varepsilon}{\varepsilon+1}
e^{(\varepsilon+1)/\varepsilon}
\right\},
\]

where

\[
Y=\sigma^{-2}+\lambda_Ie+\tau_A,
\qquad
G(\tau)=2\Phi(\sqrt{\tau})-1.
\]

Here \(e\) is human effort, \(X\) is public precision about the common state,
and \(Y\) is posterior precision about the idiosyncratic state. AI contributes
\(\tau_A\) to \(Y\), while \(\lambda_I\) converts effort into private-signal
precision. The complementarity gain is \(\Delta_X>0\), and
\(\varepsilon>0\) is the effort-supply elasticity.

The three components of \(Y\) add because independent Gaussian evidence adds
precision: prior precision \(\sigma^{-2}\), human-signal precision
\(\lambda_Ie\), and AI precision \(\tau_A\). The function \(G\) converts a
precision into a probability of a correct prediction. Thus
\(G(X)\Delta_G\) is a probability times a stand-alone payoff, while
\(G(X)G(Y)\Delta_X\) is the probability that both independent predictions are
correct times their complementarity payoff.

The agent chooses \(e\), takes \(X\) and \(\tau_A\) as given, and ignores an
infinitesimal contribution to \(X_{t+1}\). Consequently \(\lambda_G\), the
technology converting aggregate effort into public precision, belongs to the
dynamic transition but not to the private FOC. For \(X>0\), the optimum is
unique and interior:

\[
\Delta_XG(X)\lambda_Ig(Y)=e^{1/\varepsilon}.
\]

For \(X=0\), Assumption 1 removes the private value of getting only the
idiosyncratic prediction right, so the baseline optimum is \(e=0\).

## Main result: complements and substitutes

Observation 1 follows from

\[
U_{eX}=\lambda_I\Delta_Xg(X)g(Y)>0,
\]

\[
U_{e\tau_A}
=\lambda_I\Delta_XG(X)g'(Y)<0,
\]

on the interior domain

\[
X>0,\quad Y>0,\quad
\Delta_X>0,\quad\lambda_I>0,\quad\varepsilon>0.
\]

More general knowledge raises the value of learning about a particular case.
Effort and AI, by contrast, raise the same precision \(Y\). Since
\(g'(Y)<0\), more AI precision lowers the marginal return to effort.

The boundary needs care. Although \(G(0)=0\), \(g(0)\) is not finite. Hence
\(U_{eX}\) is not a finite classical cross-partial at \(X=0\), while
\(U_{e\tau_A}=0\). The strict derivative statement belongs to \(X>0\).
Increasing and decreasing differences preserve the complementarity and
substitution interpretation globally in a weak sense.

## What I checked

1. **Domain qualification.** Observation 1 is economically correct, but its
   strict cross-partial formulation requires an interior-domain qualification.
2. **Own extension: \(\Delta_I>0\).** This relaxation does not appear in
   Section 5 of the paper. It gives context-specific correctness value even
   when \(X=0\):

\[
U_e
=\lambda_Ig(Y)[\Delta_I+G(X)\Delta_X]
-e^{1/\varepsilon}.
\]

Under the maintained positive primitives and a proper finite-variance prior,
the optimum at \(X=0\) becomes uniquely positive. Therefore
\(F_\Delta(0)>0\), and zero is no longer a fixed point. This removes complete
zero-knowledge collapse, but it does not establish that positive
low-knowledge steady states disappear.

## Hand verification

`hand/observation1-boundary.jpg` - **pending student photograph** of the
cross-partials and the \(X=0\) boundary check.

## Repository map

| Path | Purpose |
| --- | --- |
| `analysis/paper_map.md` | Model, notation, and dynamic context |
| `analysis/static_audit.md` | Independent audit of Observation 1 |
| `extensions.md` | Focused \(\Delta_I>0\) extension |
| `hand/` | Derivation guide and pending photograph |
| `presentation.tex` / `presentation.pdf` | Five-minute Beamer presentation |
| `speaker_notes.md` | Five-minute script and technical backup |
| `oral_defense.md` | Thirty oral-defense questions with concise answers |
| `prompts.md` | Verbatim task prompts and available outputs |
