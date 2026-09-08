# Paper map - Phase 1

This document is an analytical map, not the final one-page submission. Provenance labels have the following meanings:

- **PAPER**: a claim, definition, assumption, or result stated by the authors in the May 5, 2026 manuscript.
- **DERIVATION**: an algebraic step independently reconstructed from the paper's primitives.
- **INTERPRETATION**: an economic reading of the formal object.
- **OPEN QUESTION**: a boundary case, ambiguity, or extension that remains to be settled.

## 1. Source and version record

> **PAPER**

**Daron Acemoglu, Dingwen Kong, and Asuman Ozdaglar (2026), _AI, Human Cognition and Knowledge Collapse_, NBER Working Paper 34910.**

The primary reading copy is the **May 5, 2026** author manuscript hosted by MIT and named explicitly in the course repository's `papers/fetch.sh`:

<https://economics.mit.edu/sites/default/files/2026-05/AI%2C%20Human%20Cognition%20and%20Knowledge%20Collapse%2005-05-26.pdf>

- Download checked: 2026-09-08.
- Length: 69 pages.
- Size: 745,190 bytes.
- SHA-256: `63E37F2AF463422E587C9BD81CDA3BB555404A6AD65763ACA0F9BEBB8E2D4EC6`.
- Embedded metadata: blank title and author fields; `LaTeX with hyperref`; `pdfTeX-1.40.21`; created May 5 and modified May 8, 2026; PDF 1.5.

The PDF served by NBER on 2026-09-08 at <https://www.nber.org/system/files/working_papers/w34910/w34910.pdf> is a different 69-page file:

- It identifies itself as the **February 2026** NBER version.
- Size: 750,067 bytes.
- SHA-256: `10FA85CC57D8C28FE14922D603B93B642F0EB1FB456233CFCDADEA9DE3A19F30`.
- Embedded metadata: created February 20 and modified February 24, 2026; `pdfTeX-1.40.27`; PDF 1.6.
- Its effort cost is written as `e^alpha/alpha`, and the stability split is expressed by comparing `alpha - 1` with `1/4`.
- The May manuscript instead parameterizes the cost by the constant Frisch elasticity `epsilon` and states the split at `epsilon = 4`. It also contains textual and substantive revisions.

**Version read and used below:** the May 5, 2026 MIT-hosted manuscript. Equal page counts are not evidence that the two PDFs are identical.

> **OPEN QUESTION - assignment numbering**

The current issue says to prioritize “Sections 2 and 3.4 - the static problem and Observation 1.” Direct inspection shows that **Section 2 is Related Literature**. The model begins in Section 3; the static environment and problem span Sections 3.1-3.5, and Observation 1 is in Section 3.4. This map follows the actual PDF while preserving the issue's wording as a documented discrepancy.

## 2. Research question

> **PAPER**

Can agentic AI improve each user's current, context-specific decision while weakening the human learning effort that replenishes society's shared stock of general knowledge - potentially enough to make useful collective knowledge collapse?

> **INTERPRETATION**

The paper separates a static benefit from a dynamic social cost. A personalized AI recommendation can make today's medical or investment decision more accurate. Yet it substitutes for the same human effort that would have produced both private understanding and a small public contribution. Because users do not capture the future benefit of that public contribution, individually optimal reliance on AI can be socially excessive.

## 3. Economic mechanism

> **PAPER**

The mechanism has five parts:

1. Successful decisions require **general knowledge** and **context-specific knowledge**.
2. These inputs are complements in production.
3. One unit of human learning effort jointly produces a private signal about the agent's context and a thin public signal about the common state.
4. Agentic AI supplies context-specific information, but in the baseline it neither creates new general knowledge nor improves its aggregation.
5. Agents are short-lived and atomistic, so they choose effort for its private contextual return and do not internalize the future public knowledge created by their effort.

> **INTERPRETATION**

For a medical decision, general knowledge is knowledge of anatomy, diseases, and treatments; context-specific knowledge is the patient's symptoms and condition. Symptoms without a correct disease model may be useless, while textbook medicine without examination is incomplete. For investment, general knowledge covers instruments, institutions, and macro risks; context-specific knowledge covers the person's horizon, income exposure, and risk tolerance.

“Knowledge collapse” is the steady state `X = 0`: useful precision about the evolving common state vanishes. AI may still have positive context precision, but under `Delta_I = 0` that information produces no payoff without general knowledge.

The feedback loop is

\[
X_t \downarrow \quad\Rightarrow\quad e_t \downarrow
\quad\Rightarrow\quad E_t \downarrow
\quad\Rightarrow\quad X_{t+1} \downarrow.
\]

Better agentic AI starts the same loop through `tau_A up -> e_t down`. Better aggregation works differently: a larger island scale `I` makes human public signals more informative, raises future `X`, and thereby raises the return to private learning.

## 4. Timing and information structure

> **PAPER**

Time is discrete. In every period there is a continuum of short-lived agents of total mass `M`, partitioned into islands of equal mass `I`. General knowledge is aggregated and shared within an island.

Within period `t`:

1. Agent `i` observes the island's public history and chooses `e_{i,t}`.
2. The agent observes the human private signal `s^H_{i,t}`.
3. In the post-AI economy, the agent receives `s^A_{i,t}`.
4. The agent forms predictions `(x_{i,t}, y_{i,t})` and receives current utility.
5. The island aggregates cohort `t`'s common-state signals into `s^C_{m,t}`, available to future cohorts.

> **INTERPRETATION**

Effort is chosen before the private and AI signal realizations. The predictions are chosen afterward. The public signal created by the current cohort arrives too late to improve that cohort's own task, and an atomistic individual's contribution is infinitesimal. These choices make the public component of effort an intergenerational externality.

Short lives are essential to the baseline mechanism: no current agent values descendants' utility or the continuation value of the public stock. A long-lived or altruistic agent would internalize at least part of the `e_t -> X_{t+1}` link.

## 5. Notation

| Symbol | Meaning |
|---|---|
| `t` | Discrete period |
| `i` | Agent, atomistic within a continuum |
| `M` | Total mass of agents |
| `I` | Island mass and baseline aggregation capacity |
| `theta_t` | Common state, interpreted as general knowledge |
| `theta_{i,t}` | Agent-period idiosyncratic state |
| `Sigma^2` | Innovation variance of the common-state random walk |
| `Sigma_0^2` | Initial variance of `theta_1` |
| `sigma^2` | Prior variance of the idiosyncratic state |
| `x_{i,t}` | Prediction of the common state |
| `y_{i,t}` | Prediction of the idiosyncratic state |
| `f(a,b)` | Output when common and idiosyncratic predictions have success indicators `a,b` |
| `Delta_G` | Gain from getting only the common prediction right |
| `Delta_I` | Gain from getting only the idiosyncratic prediction right |
| `Delta_X` | Discrete complementarity between the two correct predictions |
| `e_{i,t}` | Human learning effort |
| `epsilon` | Constant Frisch elasticity of effort supply in the May version |
| `lambda_I` | Precision of private human learning per unit effort |
| `lambda_G` | Precision of the public common-state signal per unit aggregate effort |
| `E_{m,t}` | Aggregate effort on island `m` |
| `s^H_{i,t}` | Human private signal about `theta_{i,t}` |
| `s^A_{i,t}` | Agentic-AI signal about `theta_{i,t}` |
| `s^C_{m,t}` | Aggregated public signal about `theta_t` |
| `tau_A` | Precision of the agentic-AI signal |
| `V_t` | Posterior variance of the common state given public history |
| `X_t = V_t^{-1}` | Public precision; stock of general knowledge |
| `Y_{i,t}` | Posterior precision about the idiosyncratic state |
| `G(tau)` | Probability that a centered normal error with precision `tau` lies within one unit |
| `g(tau)` | Derivative `G'(tau)` |
| `F(X)` | One-period public-precision transition map |

## 6. Equation-by-equation interpretation

### 6.1 Common state

\[
\theta_{t+1}=\theta_t+\varepsilon_t,
\qquad \varepsilon_t\sim N(0,\Sigma^2),
\qquad \theta_1\sim N(0,\Sigma_0^2).
\]

1. **Mathematics - PAPER:** the common state follows a Gaussian random walk.
2. **Economics - INTERPRETATION:** the relevant general environment changes as technologies, markets, diseases, and treatments change.
3. **Why needed - PAPER:** old knowledge cannot remain perfectly useful forever; without new signals, uncertainty accumulates.
4. **Connection:** the added innovation variance `Sigma^2` generates depreciation in the precision recursion and caps next-period public precision by `Sigma^{-2}`.

### 6.2 Idiosyncratic state

\[
\theta_{i,t}\overset{i.i.d.}{\sim}N(0,\sigma^2).
\]

1. **Mathematics - PAPER:** each agent-period receives an independent normal context.
2. **Economics - INTERPRETATION:** symptoms, risk tolerance, horizon, and other case details are individual and nonpersistent.
3. **Why needed:** context cannot be learned once for everyone or carried mechanically across cohorts.
4. **Connection:** human effort and agentic AI both produce signals about this same state, so their precisions enter the same posterior `Y_{i,t}`.

### 6.3 Prediction success and production

Define

\[
A_{i,t}=\mathbf 1\{|x_{i,t}-\theta_t|\le 1\},\qquad
B_{i,t}=\mathbf 1\{|y_{i,t}-\theta_{i,t}|\le 1\},
\]

and output

\[
f(A_{i,t},B_{i,t}),\qquad f:\{0,1\}^2\to\mathbb R,
\]

where `f` is weakly increasing and `f(1,1)-f(0,0)=1`.

1. **Mathematics - PAPER:** each prediction is scored by a unit tolerance indicator, and `f` maps the two binary successes into output.
2. **Economics - INTERPRETATION:** the task succeeds according to whether the general diagnosis and the case-specific diagnosis are accurate enough.
3. **Why needed:** the binary representation isolates the interaction between general and specific correctness without committing to a smooth loss function.
4. **Connection:** the four values of `f` are reparameterized into separate and joint gains.

### 6.4 Production gains

\[
\begin{aligned}
\Delta_G&=f(1,0)-f(0,0),\\
\Delta_I&=f(0,1)-f(0,0),\\
\Delta_X&=f(1,1)-f(1,0)-f(0,1)+f(0,0).
\end{aligned}
\]

The normalization implies

\[
\Delta_G+\Delta_I+\Delta_X=1.
\]

1. **Mathematics - PAPER:** `Delta_X` is the discrete cross-difference of `f`.
2. **Economics - INTERPRETATION:** `Delta_G` and `Delta_I` are stand-alone gains; `Delta_X` is the extra payoff from joint correctness.
3. **Why needed:** this decomposition makes the complementarity that drives effort visible in expected utility.
4. **Connection:** Assumption 1 removes the stand-alone contextual payoff and makes private effort valuable only when general knowledge succeeds.

### 6.5 Assumption 1

\[
\Delta_I=0,\qquad \Delta_X>0.
\]

1. **Mathematics - PAPER:** context-specific correctness alone adds no output, while joint correctness has a strictly positive interaction gain.
2. **Economics - INTERPRETATION:** observing symptoms without knowing disease mechanisms, or knowing an investor's risk tolerance without knowing financial instruments, is not productive by itself.
3. **Why needed:** `Delta_X>0` signs the complement between `X` and effort. `Delta_I=0` makes effort privately worthless at `X=0`, which creates the zero-effort, zero-public-knowledge fixed point.
4. **Connection:** expected utility simplifies to a general term plus `G(X)G(Y)Delta_X`.

The Leontief example `f(a,b)=min{a,b}` satisfies `Delta_G=Delta_I=0` and `Delta_X=1`.

### 6.6 Effort cost and primitive utility

\[
c(e)=\frac{\epsilon}{\epsilon+1}e^{(\epsilon+1)/\epsilon},
\qquad c'(e)=e^{1/\epsilon}.
\]

\[
u_{i,t}=f(A_{i,t},B_{i,t})-c(e_{i,t}),\qquad e_{i,t}\ge 0.
\]

1. **Mathematics - PAPER:** cost is strictly convex for `epsilon>0`, with inverse marginal cost elasticity `epsilon`.
2. **Economics - INTERPRETATION:** additional learning is increasingly costly; a larger `epsilon` means effort responds more elastically to its marginal return.
3. **Why needed:** increasing marginal cost gives a finite unique best response and determines how quickly effort disappears when `X` is small.
4. **Connection:** the marginal cost `e^{1/epsilon}` appears on the right side of the effort FOC; its near-zero exponent later generates the threshold `epsilon=4`.

### 6.7 Human private signal

\[
s^H_{i,t}\sim N\!\left(\theta_{i,t},\frac{1}{\lambda_I e_{i,t}}\right).
\]

1. **Mathematics - PAPER:** human effort creates precision `lambda_I e` about the idiosyncratic state.
2. **Economics - INTERPRETATION:** examination, research, or reflection teaches the agent about the particular case.
3. **Why needed:** this is the privately appropriable return to effort.
4. **Connection:** its precision adds to the idiosyncratic prior and AI precision in `Y_{i,t}`.

### 6.8 Human public signal and aggregate effort - equations (1)-(2)

\[
E_{m,t}=\int_{I_m}e_{i,t}\,di,
\qquad
s^C_{m,t}\sim N\!\left(\theta_t,\frac{1}{\lambda_G E_{m,t}}\right).
\]

1. **Mathematics - PAPER:** independent thin signals aggregate into common-state precision proportional to total island effort.
2. **Economics - INTERPRETATION:** many small discoveries, diagnoses, experiments, or write-ups build a shared knowledge base.
3. **Why needed:** this is the bridge from individual effort to the public state inherited by future cohorts.
4. **Connection:** in a symmetric equilibrium `E_t=I e_t`, which enters the recursion for `X_{t+1}`.

### 6.9 Agentic-AI signal

\[
s^A_{i,t}\sim N\!\left(\theta_{i,t},\frac{1}{\tau_A}\right).
\]

1. **Mathematics - PAPER:** agentic AI supplies an independent signal about the same idiosyncratic state as human private learning.
2. **Economics - INTERPRETATION:** AI offers a personalized recommendation about this patient or investor.
3. **Why needed:** placing `tau_A` and `lambda_I e` in the same information problem creates direct substitution through diminishing returns to precision.
4. **Connection:** AI precision is added to `Y`; in the baseline it does **not** enter `X` or the public-signal technology.

### 6.10 Public precision - equation (3)

\[
V_t=\operatorname{Var}(\theta_t\mid\mathcal I_t),
\qquad X_t=V_t^{-1},
\]

and

\[
X_{t+1}^{-1}=(X_t+\lambda_G E_t)^{-1}+\Sigma^2.
\]

1. **Mathematics - PAPER:** precision `X_t` and new signal precision `lambda_G E_t` add when estimating `theta_t`; then the random-walk innovation adds variance before the next cohort.
2. **Economics - INTERPRETATION:** current shared knowledge and new human discoveries pool, but environmental change makes the combined estimate stale.
3. **Why needed:** this recursion translates the static effort choice into dynamics.
4. **Connection:** after inversion and substitution of the best response it becomes `X_{t+1}=F(X_t)`.

### 6.11 Idiosyncratic precision - equation (4)

\[
Y_{i,t}=\operatorname{Var}(\theta_{i,t}\mid\mathcal I_{i,t})^{-1}
=\sigma^{-2}+\lambda_I e_{i,t}+\tau_A.
\]

1. **Mathematics - PAPER:** independent normal prior and signal precisions add.
2. **Economics - INTERPRETATION:** baseline familiarity, human investigation, and AI advice are three sources of knowledge about one case.
3. **Why needed:** it creates a sufficient statistic for the probability of an accurate idiosyncratic prediction.
4. **Connection:** because both `e` and `tau_A` raise the same `Y`, concavity of success in precision makes them substitutes at the margin.

The precision sum follows from multiplying independent Gaussian likelihoods: their quadratic log-likelihood terms add, so the posterior quadratic coefficient is `sigma^{-2}+lambda_I e+tau_A`.

### 6.12 Optimal predictions - equation (5)

\[
x_{i,t}=\mathbb E[\theta_t\mid\mathcal I_{i,t}],
\qquad
y_{i,t}=\mathbb E[\theta_{i,t}\mid\mathcal I_{i,t}].
\]

1. **Mathematics - PAPER:** posterior means center the Gaussian prediction errors.
2. **Economics - INTERPRETATION:** rational agents combine all available information optimally after seeing the signals.
3. **Why needed:** centered posterior errors let success probabilities depend only on precisions.
4. **Connection:** common and idiosyncratic success probabilities become `G(X_t)` and `G(Y_{i,t})`.

### 6.13 Success probability `G` and its derivative `g`

For `Z~N(0,tau^{-1})` and `tau>0`,

\[
G(\tau)=\Pr(|Z|\le 1)=2\Phi(\sqrt\tau)-1,
\qquad
g(\tau)=G'(\tau)=\frac{\phi(\sqrt\tau)}{\sqrt\tau}.
\]

> **DERIVATION**

\[
g'(\tau)
=-\frac{1}{2}\left(1+\frac{1}{\tau}\right)g(\tau)<0
\qquad(\tau>0).
\]

1. **Mathematics:** `G` is strictly increasing and strictly concave on positive precision; `g>0` and `g'<0`.
2. **Economics - INTERPRETATION:** precision raises the chance of being within the tolerance band, but with diminishing marginal returns.
3. **Why needed:** `g>0` signs the complementarity with public knowledge; `g'<0` signs the substitution between AI precision and human effort.
4. **Connection:** these functions convert posterior precisions into expected production and marginal incentives.

At the boundary, `G(0)=0` by continuity, while `g(tau)` diverges as `tau` approaches zero from above. Classical cross-partials involving `g(X)` therefore require `X>0`.

### 6.14 Expected utility - equation (6)

\[
U_{i,t}=f(0,0)+G(X_t)\Delta_G
+G(X_t)G(Y_{i,t})\Delta_X
-\frac{\epsilon}{\epsilon+1}e_{i,t}^{(\epsilon+1)/\epsilon}.
\]

1. **Mathematics - PAPER:** expected output decomposes into the baseline, the stand-alone general gain, and the probability of joint success times `Delta_X`, net of cost.
2. **Economics - INTERPRETATION:** private learning pays only when it can be combined with useful general knowledge.
3. **Why needed:** equation (6) is the static optimization problem from which both cross-partials and the effort best response follow.
4. **Connection:** differentiating with respect to effort gives the FOC; holding `X` fixed isolates the static effect of AI.

> **DERIVATION**

For a general `Delta_I`, independence would give

\[
\mathbb E[f]=f(0,0)+G(X)\Delta_G+G(Y)\Delta_I+G(X)G(Y)\Delta_X.
\]

Equation (6) follows by imposing `Delta_I=0`.

## 7. The agent's static problem

> **PAPER**

Conditional on inherited `X_t=X` and AI precision `tau_A`, the agent chooses only effort before signal realizations:

\[
\max_{e\ge0}\;
f(0,0)+G(X)\Delta_G
+G(X)G(\sigma^{-2}+\lambda_Ie+\tau_A)\Delta_X
-\frac{\epsilon}{\epsilon+1}e^{(\epsilon+1)/\epsilon}.
\]

- **Choice:** `e`.
- **Constraint:** `e>=0`.
- **Taken as given:** `X`, `tau_A`, `sigma`, `lambda_I`, `Delta_G`, `Delta_X`, and `epsilon`; also all past efforts embedded in `X`.
- **Not privately internalized:** the infinitesimal contribution of `e` to the public signal and future `X`.
- **Information at effort choice:** public history summarized by `X`; signal realizations have not yet arrived.

After effort and signals, the prediction choices are the posterior means in equation (5).

> **DERIVATION - FOC**

Let `Y=sigma^{-2}+lambda_I e+tau_A`. Then

\[
U_e(e;X,\tau_A)
=\Delta_XG(X)\lambda_I g(Y)-e^{1/\epsilon}.
\]

For an interior optimum,

\[
\boxed{\Delta_XG(X)\lambda_I
g(\sigma^{-2}+\lambda_Ie+\tau_A)=e^{1/\epsilon}.}
\]

The left side is marginal benefit and the right side is marginal cost.

For `X>0`, marginal benefit is positive at `e=0`, weakly decreasing in `e`, and tends to zero; marginal cost starts at zero, is strictly increasing, and tends to infinity. More explicitly,

\[
U_{ee}=\Delta_XG(X)\lambda_I^2g'(Y)
-\frac{1}{\epsilon}e^{1/\epsilon-1}<0
\]

where the classical expression is read for `e>0`. Strict concavity of the objective and the endpoint signs yield one finite interior maximizer for every `X>0`.

At `X=0`, `G(0)=0`, so the benefit term vanishes for every `e` and

\[
U(e;0,\tau_A)=\text{constant}-c(e).
\]

The unique solution is the corner `e=0`. The equality-form FOC is not a reason to call this an interior solution; it must be read with the nonnegativity constraint and the boundary argument.

Define this unique best response as `e(X,tau_A)`. It is strictly increasing in `X` and strictly decreasing in `tau_A` for `X>0`; at `X=0`, it equals zero for every `tau_A`.

## 8. Observation 1

### 8.1 Result written by the authors

> **PAPER**

“Public precision `X_t` complements human effort, while agentic-AI precision `tau_A` substitutes for human effort.” The paper displays

\[
\frac{\partial^2U}{\partial e\,\partial X}>0,
\qquad
\frac{\partial^2U}{\partial e\,\partial\tau_A}<0.
\]

### 8.2 Independent derivation

> **DERIVATION**

Starting from

\[
U_e=\Delta_XG(X)\lambda_Ig(Y)-e^{1/\epsilon},
\qquad Y=\sigma^{-2}+\lambda_Ie+\tau_A,
\]

differentiation gives

\[
\boxed{U_{eX}=\Delta_X\lambda_Ig(X)g(Y)>0}
\]

for `X>0`, and

\[
\boxed{U_{e\tau_A}=\Delta_XG(X)\lambda_Ig'(Y)<0}
\]

for `X>0` and `Y>0`.

The first sign uses `Delta_X>0`, `lambda_I>0`, `g(X)>0`, and `g(Y)>0`. The second uses the same positive factors plus `G(X)>0` and `g'(Y)<0`.

### 8.3 Economic interpretation

> **INTERPRETATION**

- **Why `X` complements effort:** effort improves the particular-case prediction. A larger stock of general knowledge makes correctly understanding that particular case more productive, so the marginal payoff from effort rises.
- **Why `tau_A` substitutes for effort:** AI and human effort both add precision about `theta_{i,t}`. Since `G` has diminishing returns to precision, AI makes the next unit of human-produced precision less valuable.
- **Why the channels differ:** an improvement in aggregation raises the common input that makes human contextual learning useful; an improvement in agentic AI supplies the contextual input directly and crowds out its human substitute.

### 8.4 Role of Assumption 1

> **DERIVATION**

Without imposing `Delta_I=0`, marginal effort benefit would be

\[
U_e=\lambda_Ig(Y)[\Delta_I+\Delta_XG(X)]-e^{1/\epsilon}.
\]

Thus, if one changes only `Delta_I` from zero to a positive value while retaining `Delta_X>0`, both interior static signs survive:

\[
U_{eX}=\lambda_I\Delta_Xg(X)g(Y)>0,
\]

\[
U_{e\tau_A}=\lambda_Ig'(Y)[\Delta_I+\Delta_XG(X)]<0.
\]

However, `Delta_I=0` is crucial dynamically. The focused extension in
`extensions.md` proves that, under the maintained finite-variance and positive
technology primitives, `Delta_I>0` implies `e(0,tau_A)>0` and `F(0)>0`.
Thus exact zero is no longer a fixed point. The location and stability of any
positive low-knowledge state remain open.

`Delta_X>0` is the condition that makes public knowledge a strict complement. If `Delta_X=0`, `X` does not change the marginal return to effort. Under the baseline `Delta_I=0`, it would also eliminate all private benefit from effort.

### 8.5 Boundary audit

> **OPEN QUESTION / TECHNICAL QUALIFICATION**

The paper writes both inequalities strictly in Observation 1 without attaching `X>0` to that display. At `X=0`:

- `G(0)=0`, so `U_{e\tau_A}=0`, not strictly negative.
- `g(0)` is not finite, so the classical formula for `U_{eX}` is not defined at the boundary.
- Direct optimization is nevertheless unambiguous: `e(0,tau_A)=0`.
- The paper explicitly qualifies the best-response comparative statics in Observation 2 as strict only for `X>0`, and footnote 6 separately treats the corner.

This is a boundary qualification, not a demonstrated error in the economic result. On the interior path generated by any `X_1>0`, the strict cross-partials are valid. In increasing-differences terms, complementarity can also be expressed without requiring a finite derivative at `X=0`.

## 9. From static incentives to dynamics

> **PAPER**

Symmetry gives

\[
E_t=I e_t=I e(X_t,\tau_A).
\]

The recursion becomes

\[
X_{t+1}=F(X_t)
=\left[\Sigma^2+
\left(X_t+\lambda_GI e(X_t,\tau_A)\right)^{-1}
\right]^{-1}.
\]

The causal chain is

\[
X_t\longrightarrow e_t\longrightarrow E_t\longrightarrow X_{t+1}.
\]

> **INTERPRETATION**

1. Larger `X_t` raises the marginal benefit of private learning, so the cohort chooses more effort.
2. More individual effort raises island aggregate effort.
3. More aggregate effort makes the new common-state signal more precise.
4. Current public precision and new signal precision add when estimating `theta_t`.
5. Innovation variance `Sigma^2` is then added in variance space, making part of the estimate obsolete before period `t+1`.

Even perfect knowledge of `theta_t` cannot make the variance of `theta_{t+1}` smaller than `Sigma^2`. Therefore

\[
0\le F(X)<\Sigma^{-2}
\]

for finite `X`: public precision has a technological ceiling.

Better AI lowers `e(X,tau_A)` at every positive `X`, shifts `F` downward, and weakens the future stock. Better aggregation `I` raises the amount of public precision generated from per-capita effort and shifts `F` upward.

### Why the threshold `epsilon=4` appears

> **DERIVATION - summary, not a reproduction of the paper's dynamic proof**

As `X` approaches zero,

\[
G(X)\sim\sqrt{\frac{2}{\pi}}X^{1/2}.
\]

Holding the positive baseline `Y` terms fixed to first order, the FOC implies

\[
e(X,\tau_A)=\Theta(X^{\epsilon/2}).
\]

The per-capita effort required to reproduce a small positive `X` solves

\[
e_{\mathrm{maint}}(X)
=\frac{\Sigma^2X^2}{\lambda_GI(1-\Sigma^2X)}
=\Theta(X^2).
\]

Therefore:

- if `epsilon<4`, equilibrium effort decays more slowly than maintenance effort near zero, so zero is locally unstable;
- if `epsilon>4`, equilibrium effort decays more quickly, so zero is locally stable;
- `epsilon=4` is a knife-edge where coefficients, not only exponents, matter and is not covered by Lemma 2's two cases.

## 10. Read-only map of long-run results

> **PAPER - READ ONLY**

- `X=0`, `e=0`, `Y=sigma^{-2}+tau_A` is always a baseline steady state under Assumption 1.
- If `epsilon<4`, the zero state is locally unstable and there is a unique positive stable steady state for every `X_1>0`.
- If `epsilon>4`, zero is locally stable. Below an endogenous AI threshold `tau_A^c`, zero and a high-knowledge state are stable and an intermediate unstable state separates their basins.
- Raising `tau_A` expands the collapse basin; above `tau_A^c`, the positive steady states disappear and zero is globally stable.
- Raising aggregation capacity `I` or complementarity `Delta_X` makes the high-knowledge state more resilient.
- In the high state, `X` and effort fall with `tau_A`. Idiosyncratic precision can initially rise and then fall close to collapse because endogenous human learning can fall more than AI precision rises.

No dynamic proof is reproduced in this phase.

## 11. Welfare question

> **PAPER**

Steady-state welfare, relative to `f(0,0)`, is

\[
\bar U=G(\bar X)\Delta_G
+G(\bar X)G(\bar Y)\Delta_X
-\frac{\epsilon}{\epsilon+1}\bar e^{(\epsilon+1)/\epsilon}.
\]

At a high-knowledge steady state, the envelope decomposition is

\[
\frac{d\bar U^+}{d\tau_A}
=\underbrace{g(\bar Y)G(\bar X)\Delta_X}_{\text{direct effect }\ge0}
+\underbrace{\frac{dG(\bar X)}{d\tau_A}
[\Delta_G+G(\bar Y)\Delta_X]}_{\text{indirect effect }\le0}.
\]

> **INTERPRETATION**

- **Direct effect:** at a fixed public stock, a more precise personalized signal improves current decision quality. Because effort is privately reoptimized, the static value of extra information cannot be negative in this correctly specified model.
- **Indirect effect:** higher AI precision crowds out effort, which lowers the steady-state public stock; losing general knowledge reduces both its stand-alone value and its complementarity with contextual knowledge.
- **Selection effect when `epsilon>4`:** higher AI precision also raises the unstable basin threshold and can eliminate the high-knowledge state discontinuously.

Welfare is therefore **not necessarily increasing** in AI precision. The paper's single-peaked conclusions require more than Observation 1:

- Assumption 1;
- existence and focus on the positive high-knowledge steady state;
- the relevant effort-elasticity regime and, in the multiple-state case, attention to initial conditions/basin selection;
- Assumption 2, `sigma^{-2} >= sqrt(2)-1`, which rules out a welfare derivative that changes sign twice near very low idiosyncratic precision.

Under Assumption 2, Propositions 10-11 give a finite welfare-maximizing `tau_A^*`: high-state welfare rises below it and falls above it. In the multiple-state regime, crossing `tau_A^c` produces collapse and zero long-run welfare under the baseline normalization.

By contrast, Proposition 9 states that better aggregation `I` strictly raises high-state welfare whenever that state exists, and in the multiple-state regime it also expands the favorable basin.

## 12. Section 5 audit

### 12.1 Assumptions the authors relax

> **PAPER**

1. **AI affects only context-specific information (Section 5.1).** The authors let agentic capability also raise effective aggregation:
   \[
   I(\tau_A)=I_0+\exp(\eta\tau_A).
   \]
   Substitution through effort competes with the aggregation channel. If `eta<epsilon/2`, the high-knowledge state still vanishes as AI precision becomes arbitrarily large and the welfare-maximizing AI precision remains finite.

2. **Only human effort creates new common-state information (Section 5.2).** An exogenous synthetic signal adds precision `tau_syn`:
   \[
   X_{t+1}^{-1}=(X_t+\lambda_GE_t+\tau_{syn})^{-1}+\Sigma^2.
   \]
   For finite positive `tau_syn`, zero is no longer a fixed point; it becomes a strictly positive low-knowledge state. The AI-effort substitution channel remains.

3. **One unit of effort produces the private and public components proportionally (Section 5.3).** Public-signal precision becomes proportional to `e^beta`. For `beta>0`, the paper states analogous results with the stability boundary changed from `epsilon<4` to `epsilon<4/beta`. At `beta=0`, changes in private effort no longer change public learning.

Section 4.5 also develops a two-phase Gaussian garbling policy, so “cap or garble AI precision” is not a new extension.

### 12.2 Assumptions not relaxed in Section 5

> **DERIVATION / AUDIT**

The production-side condition **`Delta_I=0` in Assumption 1 is not relaxed**. A full-text check finds it only in the baseline definition, static derivation, collapse interpretation, and welfare normalization - not in Section 5 as an altered assumption. Section 5.3 changes how effort maps into the public signal; it does not change `f` or give stand-alone value to context-specific correctness.

Other maintained baseline features include:

- short-lived agents;
- atomistic agents who do not internalize their public contribution;
- correctly specified independent Gaussian states and signals;
- precision linear in private effort;
- posterior-mean Bayesian prediction;
- binary unit-tolerance success and the associated production decomposition.

The relevant appendices provide proofs for Propositions 14-16 and rework the dynamic arguments under the Section 5 technologies. They do not add a separate relaxation of `Delta_I=0`.

### 12.3 Extensions that must not be presented as new

- AI-enhanced aggregation;
- synthetic common-state data;
- imperfect separability/directional allocation of effort;
- precision caps or Gaussian garbling.

## 13. Unresolved questions and possible traps

> **OPEN QUESTION**

1. **Observation 1 at the boundary - resolved for this audit:** the strict
   cross-partial display is an interior statement. At `X=0`,
   `U_{e tau_A}=0` and `U_{eX}` is not a finite classical derivative.
   See `analysis/static_audit.md`.
2. **Knife edge `epsilon=4`:** which parameter coefficients determine local stability when the two asymptotic orders coincide?
3. **Relaxing `Delta_I=0` - boundary resolved, dynamics open:** the extension
   proves `e(0,tau_A)>0` and `F(0)>0`, so exact zero is not a fixed point.
   The number and stability of positive steady states remain open.
4. **Section 5.1 notation:** the text calls `I_0` the pre-AI baseline, while the displayed formula implies `I(0)=I_0+1`. Is `I_0` meant as an additive baseline component rather than the total no-AI capacity?
5. **Version dependence:** all use of `epsilon`, the threshold `epsilon=4`, and Section 5's `epsilon<4/beta` must be tied to the May manuscript. The February NBER PDF uses the equivalent `alpha` parameterization.
6. **Scope of welfare:** statements about non-monotonicity refer to long-run high-steady-state welfare under Assumption 2, with additional basin considerations when `epsilon>4`; they are not claims that more accurate information lowers an agent's static optimized utility.

## 14. Selected handwritten check

> **DERIVATION PLAN**

The selected check is **Observation 1, cross-partials and the boundary
\(X=0\)**. It has precedence because the assignment prioritizes the static
problem and Observation 1, while the dynamic proofs are read-only.

The exact two-page sequence is in `hand/DERIVATION_GUIDE.md`. The future
photograph must be named `hand/observation1-boundary.jpg`; its status is
`PENDING STUDENT PHOTO`. No physical derivation or photograph exists yet.
