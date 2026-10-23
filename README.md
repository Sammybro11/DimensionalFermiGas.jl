# EnsemblesQuantumGas

Microcanonical, canonical, and grand canonical ensembles for an ideal Fermi gas in `d` spatial dimensions, with exact small-system enumeration to verify ensemble equivalence.

Natural units throughout: `ħ²/2m = 1`, `k_B = 1`.

## Layout

- `src/dos.jl` — density of states `g(ε) ∝ ε^(d/2-1)` in `d` dimensions
- `src/grandcanonical.jl` — Fermi occupation; `⟨N⟩`, `⟨E⟩`, ΔN², ΔE² as moments of the DOS; `μ(T,N)`; entropy
- `src/microcanonical.jl` — `T(E,N)`, `μ(E,N)`, `S(E,N)` via saddle-point (numerical inversion)
- `src/canonical.jl` — `⟨E⟩(T,N)` in the continuum
- `src/analytics.jl` — closed-form Sommerfeld low-T expansions in general `d`
- `src/exact_counting.jl` — exact Ω(N,E) and Z_N via generating functions (any size), brute-force enumeration for cross-checks, exact microcanonical T
- `scripts/verify_equivalence.jl` — the assignment demo: (N,E,V) → T, μ → ⟨E⟩ → ⟨N⟩ and matching checks
- `scripts/figures.jl` — caloric curve, μ(T), fluctuation scaling, exact-enumeration convergence
- `test/runtests.jl` — DOS checks, Sommerfeld vs numeric, fluctuation scaling, exact-enumeration equivalence
- `report/report.md` — full writeup, rendered to `report.pdf` via `pandoc report.md -o report.pdf --pdf-engine=xelatex`
