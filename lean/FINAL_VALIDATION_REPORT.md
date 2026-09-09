# Final validation report

This report is completed after the final clean build. It records commands and
results without treating compiler success as validation of economic premises.

## Environment

- WSL distribution: Ubuntu 24.04
- Lean toolchain: `leanprover/lean4:v4.30.0-rc2`
- Lake: 5.0.0 source build bundled with the toolchain
- Mathlib: pinned by `lake-manifest.json` at
  `5450b53e5ddc75d46418fabb605edbf36bd0beb6`
- EconCSLib: inspected read-only; not used as a dependency and not modified

## Build and integrity results

| Check | Command | Result |
| --- | --- | --- |
| Full project build | `lake -q build` | Passed, exit code 0 |
| Clean reproducibility build | `lake clean`; `lake exe cache get`; `lake -q build` | Passed, exit code 0, using the official cache for the pinned Mathlib revision |
| Public endpoint check | `lake env lean MainTheorems.lean` | Passed, exit code 0 |
| Proof-hole search | recursive search of tracked `*.lean` sources | No proof holes, tactic-query placeholders, or unfinished-work markers |
| Custom-axiom search | declaration search plus `#print axioms` | No project-specific axiom declarations |
| Dependency pin | manifest inspection and Mathlib `git rev-parse HEAD` | Exact match at `5450b53e5ddc75d46418fabb605edbf36bd0beb6` |

The two occurrences of `by_contra` are completed kernel-checked proofs in the
baseline uniqueness and extension FOC-uniqueness results. The word `axiom`
appears in documentation and in the standard `#print axioms` command, not as a
custom declaration.

## Axiom audit

For every endpoint printed by `MainTheorems.lean`, Lean reports only:

```text
[propext, Classical.choice, Quot.sound]
```

These are standard Lean/Mathlib foundations. No theorem depends on a custom
axiom introduced by this project.

## Presentation integration

`presentation.tex` compiles with `latexmk -pdf -interaction=nonstopmode
-halt-on-error presentation.tex`. The result has exactly five frames and five
PDF pages. The log contains no unresolved references or material overfull
boxes. All five rendered pages were inspected; the added Lean line is legible
and the handwritten evidence on the final frame remains intact.

## Scope verdict

**PARTIALLY FORMALIZED.** The selected static calculus, boundary audit, and
conditional extension implications are checked without proof holes. The
stochastic derivation of additive Gaussian precision, continuum-agent
aggregation, full dynamics, stability, and welfare are not encoded. The
extension's positive-root existence theorem explicitly assumes a finite upper
bracket; the theorem proves the root's existence, positivity, and uniqueness
from that condition.
