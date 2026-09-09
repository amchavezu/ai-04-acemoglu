# Lean formalization

This directory contains a standalone Lean 4/Mathlib audit of the static
mathematics used in this repository. It was added after the original course
submission. It does not rewrite that submission and does not claim to
formalize the paper's full dynamic or welfare analysis.

## Reproduce the build

The project pins Lean and every Lake dependency. On WSL, build it on the Linux
filesystem (rather than directly under `/mnt/c`, where Git symlinks may not be
available):

```bash
cp -a /mnt/c/path/to/ai-04-acemoglu/lean ~/ai04-lean
cd ~/ai04-lean
lake exe cache get  # optional: fetch the official cache for the pinned revision
lake build
lake env lean MainTheorems.lean
```

`lake build` compiles every source module. The final command rechecks the
public endpoints and prints their axioms. A clean rebuild is:

```bash
lake clean
lake build
```

The pinned toolchain is `leanprover/lean4:v4.30.0-rc2`; the manifest pins
Mathlib to commit `5450b53e5ddc75d46418fabb605edbf36bd0beb6`.
EconCSLib is not a dependency: inspection found no model-specific component
that would justify coupling this small audit to that library.

## Source map

| File | Role |
| --- | --- |
| `KnowledgeCollapse/Precision.lean` | Standard-normal success technology, derivatives, monotonicity, diminishing returns, and the right-boundary limit |
| `KnowledgeCollapse/Static.lean` | Private precision, effort cost, equation (6), Observation 1, and weak finite comparisons |
| `KnowledgeCollapse/Boundary.lean` | Level problem at `X = 0`, baseline corner solution, and totalized-value/right-limit distinction |
| `KnowledgeCollapse/Extension.lean` | The project's `DeltaI > 0` extension and its conditional transition implication |
| `KnowledgeCollapse.lean` | Aggregate import |
| `MainTheorems.lean` | Public endpoint and `#print axioms` audit |
| `FORMALIZATION_NOTES.md` | Paper-to-Lean correspondence and semantic limits |
| `FINAL_VALIDATION_REPORT.md` | Recorded build and integrity checks |

## Honest coverage statement

The calculus and order-theoretic core is proved directly: the integral
representation of `G`, `G' = g` for positive precision, the exact formula and
negative sign of `g'`, the singular right limit at zero, the two static
comparative statics, their weak finite-comparison analogues, and the baseline
corner solution. The extension's positive boundary incentive and the
positive-transition/no-zero-fixed-point implication are also proved under
explicit hypotheses.

Coverage is nevertheless **partial for the economic model as a whole**. Lean
does not derive Gaussian Bayesian precision addition from a probability
space, encode the continuum-agent externality, or reproduce the paper's
long-run and welfare propositions. Existence of the extension's positive FOC
root uses an explicit upper-bracket hypothesis; uniqueness and positivity are
then proved rather than assumed. See `FORMALIZATION_NOTES.md` for the exact
boundary between definitions, proofs, and semantic assumptions.
