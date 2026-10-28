//  Build: typst compile --root . slides/slides.typ slides/slides.pdf
//
//  Act I   P1  5:00   what controls the gas
//  Act II  P2  5:00   temperature from state counts
//  Act III P3  5:00   do the ensembles agree
// ============================================================

#import "@preview/calmly-touying:0.2.0": *

#show: calmly.with(
  config-info(
    title: [Dimensional Fermi Gas],
    subtitle: [
      Microcanonical, canonical, and grand canonical Ensembles
      of a Fermi gas in $d$ dimensions
    ],
    author: "Group 4: Samyak Rai, Shanmukh Machiraju, Anirudh Bhat",
    date: "28 October, 2026",
    institution: "Indian Institute of Technology Hyderabad",
  ),
  variant: "light",
  colortheme: "paper",
  progressbar: "foot",
  header-style: "moloch",
  title-layout: "split",
)

#title-slide()

// ------------------------------------------------------------
//  ACT I --- P1 --- 5:00
// ------------------------------------------------------------
#section-slide[What controls the gas]

== The claim
// One-sentence claim, both halves.
// P1, 40 s.

== The system, the units, the scope
// P1, 45 s.

== The DOS gives two parameters
// alpha and A, box and trap.
// P1, 60 s.

== The numbers at $N = 1000$
// Table: alpha, eps_F, E0 for six cases.
// P1, 45 s. Flag the alpha = 2 duplicate here.

== Sommerfeld, and why $alpha$ cancels
// U is universal, mu is not.
// P1, 75 s. Core of Act I.

#figure-slide(
  image("../figures/mu_vs_T.png", width: 80%),
  title: [The sign of the slope flips with $alpha$],
  caption: [$d = 1$ rises. $d = 2$ is flat. $d >= 3$ falls.],
)
// P1, 45 s. One sentence.

// ------------------------------------------------------------
//  ACT II --- P2 --- 5:00
// ------------------------------------------------------------
#section-slide[Temperature from state counts]

== Temperature from counting alone
// Omega from the generator function. T from d ln Omega / dE.
// P2, 60 s.

#figure-slide(
  image("../figures/microcanonical_T_convergence.png", width: 70%),
  title: [Boltzmann against Gibbs: the estimator sets the offset],
  caption: [Beyond $L = 60$ the two conventions bracket $T_0$.],
)
// P2, 60 s. Admit no convergence to a limit.

== The continuum route, and its built-in circularity
// Inversion of <E>(T) = E. Warn that Sections 2 and 3 are circular.
// P2, 60 s. Handoff to P3.
Lorem Ipsum

== Numerics: where the error actually lives
// P2, 60 s.
Lorem Ipsum

// ------------------------------------------------------------
//  ACT III --- P3 --- 5:00
// ------------------------------------------------------------
#section-slide[Canonical & Grand Canonical Ensembles]

== Definitions

#block(stroke: 0.6pt, inset: 10pt, radius: 3pt, width: 100%, above: 0.4em, below: 0.8em)[
  #text(fill: gray)[*Canonical* --- fixed $(N, T, V)$]
  $ Z_N (T) = sum_E Omega(N, E) thin e^(-E slash T) , quad ⟨E⟩_N = 1/Z_N sum_E E thin Omega(N,E) thin e^(-E slash T) $
]

For fermions, we know the fermi function is responsible for state occupation in the ensemble and by applying the macroscopic limit we may use a continuous approximation,
#block(stroke: 0.6pt, inset: 10pt, radius: 3pt, width: 100%, above: 0.4em, below: 0.8em)[
  #text(fill: gray)[*Grand canonical* --- fixed $(mu, T, V)$]
  $ Xi(mu, T) = sum_(N=0)^infinity Z_N e^(mu N slash T) = product_i (1 + e^(-(epsilon_i - mu) slash T)) $
  $ ⟨N⟩ = sum_i f_i , quad ⟨E⟩ = sum_i epsilon_i f_i , quad Δ N^2 = sum_i f_i (1 - f_i) , quad f_i = f(epsilon_i) $
]

== Canonical Ensemble

The canonical sum needs the state count. That is the number of ways to put $N$ fermions on the levels with total energy $E$. The count of combinations grows exponentially with $N$. Enumeration works for four levels. It fails for $N = 1000$.

#grid(
  columns: (1fr, 1fr),
  column-gutter: 1.6em,
  align: (left + top, left + top),
  [
    #text(fill: gray)[*Small, discrete: exact*]

    #text(size: 0.8em)[We extract $Omega$ as a coefficient of a generating function,
    $ product_i (1 + z x^(epsilon_i)) quad -> quad [z^N x^E] . $
    The recurrence over the levels fills a table of size $O(L N dot.c E_("max"))$, and the method does not work configuration by configuration. The result is exact at every temperature. This route gives the only independent check of the ensembles against each other.]

    #text(size: 0.8em)[`omega_counts`, `canonical_sums` — `src/exact_counting.jl`]
  ],
  [
    #text(fill: gray)[*Large $N$: saddle point*]

    #text(size: 0.8em)[We replace the levels by the density of states. We then evaluate the $N$-sum at its saddle point,
    $ ⟨N⟩(T, mu) = integral g(epsilon) f(epsilon) dif epsilon = N . $
    Then $⟨E⟩ = integral epsilon thin g(epsilon) f(epsilon) dif epsilon$ at the $mu$ that solves it. This *is* the grand canonical integral, the continuum canonical ensemble is evaluated through grand canonical machinery.]

    #text(size: 0.8em)[`canonical_average_energy` — `src/canonical.jl`]
  ],
)

#v(0.3em)
#text(fill: blue, size: 0.8em)[Keep the second column in mind. We compute the canonical energy in two steps. First we solve for $⟨N⟩ = N$. Then we evaluate $⟨E⟩$. A comparison of the two ensembles then cannot fail.]

// P3, 60 s. Two routes: the exact one is a check, the continuum one is the working
// tool. The red line is the handoff to "Finite Size Ensemble" — do not expand on it here.

== Integration

Throughout we need quantities like $⟨N⟩$, $⟨E⟩$, $Delta N$, $Delta E$ and $S$. All these are computed using,

// Equation on the left, the special cases on the right
#grid(
  columns: (1.35fr, 1fr),
  column-gutter: 1.5em,
  align: (center + horizon, center + horizon),
  [
    $ ⟨epsilon^k⟩_w = integral_0^infinity epsilon^k g(epsilon) w(f(epsilon, mu, T)) dif epsilon $
  ],
  table(
    columns: (auto, auto, auto, auto),
    align: (center,) * 4,
    stroke: none,
    [*quantity*], [*$k$*], [*$w(f)$*], [*test*],
    table.hline(stroke: 0.4pt),
    [$⟨N⟩$], [$0$], [$1$], [mean],
    [$⟨E⟩$], [$1$], [$1$], [mean],
    [$Δ N^2$], [$0$], [$f(1-f)$], [variance],
    [$Δ E^2$], [$2$], [$f(1-f)$], [variance],
  ),
)

However this is not directly computable. So we utilise the *Gaussian - Kronrod Quadrature* which works as follows,

$
  "error" approx
  | underbrace(sum_(i=1)^n w_i f(x_i), "quad 1")
    - underbrace(sum_(j=1)^m v_j f(y_j), "quad 2") |
$

#v(0.3em)


== Finite Size Ensemble

// Explain the Jensen gap here
The grand canonical ensemble does not sit at a fixed $N$. It is a *mixture* of canonical sectors:

$ P(N) = (Z_N e^(beta mu N)) / Xi , quad ⟨E⟩_"gc" = sum_N P(N) ⟨E⟩_N , quad ⟨N⟩ = N . $

$⟨E⟩_N$ is *convex* in $N$. The box levels follow $prop n^2$, and the cost of each added particle rises. That rise is the curvature. Jensen then puts the mixture above the constrained value:

#align(center, $⟨E⟩_"gc" > ⟨E⟩_(⟨N⟩) = ⟨E⟩_N quad "whenever" quad Δ N^2 > 0 .$)

We expand about the mean. The linear term averages to zero by definition of the mean. Only the curvature survives:

#align(center, box(stroke: 1pt, inset: 8pt, $Δ E approx 1/2 c thin Δ N^2$))


== Forms of Convergence

$E prop N^p$, $quad p = 1 + 1 slash (alpha+1) = (alpha+2) slash (alpha+1)$, $quad Δ N^2 slash N^2 = (alpha+1) T slash (N epsilon_F)$

#grid(
  columns: (1fr, 1fr),
  column-gutter: 1.4em,
  align: (center + horizon, center + horizon),
  [
    #text(fill: gray)[*Fixed $T slash epsilon_F$*]
    $ (⟨E⟩_"gc" - ⟨E⟩_N) / ⟨E⟩ prop 1/N $
    The exponent is $-1$ for *every* $alpha$.
  ],
  [
    #text(fill: gray)[*Fixed absolute $T$*]
    $ (⟨E⟩_"gc" - ⟨E⟩_N) / ⟨E⟩ prop N^(-p) $
    The exponent is $-p$, and the gas sets $p$.
  ],
)

#align(center, table(
  columns: (auto,) * 7,
  align: (center,) * 7,
  stroke: none,
  table.hline(stroke: 0.8pt),
  [*$alpha$*], [0], [0.5], [1], [1.5], [2], [3],
  table.hline(stroke: 0.4pt),
  [*$p$*], [2.000], [1.667], [1.500], [1.400], [1.333], [1.250],
  [*case*], [$d=2$], [$d=3$], [$d=4$], [$d=5$], [$d=6$], [$d=4$ trap],
  table.hline(stroke: 0.8pt),
))

Higher $d$ converges *slower*. The gap falls off as plain $1 slash N$ as $alpha -> infinity$. This runs *opposite* to the Sommerfeld errors, which improve with $d$.

#text(fill: red)[Hold the ratio of $T$ to $epsilon_F$ fixed. The plot then shows a set of parallel lines of slope $-1$. The protocol sets the exponent. The gas only shifts the offset. So the plot hides everything.]

// P3, 60 s. Caveat: at fixed absolute T, large alpha pushes the gas non-degenerate,
// where ΔN² = T g(eps_F) fails. Verify you are still degenerate.

#figure-slide(
  image("../figures/fluctuation_scaling.png", width: 68%),
  title: [Jensen Gap],
  caption: [$Delta N slash N prop N^(-1 slash 2)$ at fixed $T slash epsilon_F = 0.1$, for every $d$. The square of this curve gives the $1 slash N$ in the gap.],
)


#figure-slide(
  image("../figures/exact_convergence.png", width: 68%),
  title: [The gap is real, and it closes],
  caption: [Exact $⟨E⟩_"gc"$ against exact $⟨E⟩_C$ for 1D boxes. Both sides are separate computations. They disagree at small $L$ and converge as $L$ grows.],
)
// P3, 45 s.

== Findings

+ *Equivalence is a limit, and the approach is dimension-dependent.* The gap closes as $N^(-p)$ with $p = (alpha+2) slash (alpha+1)$. At $alpha = 0$ the gap falls as an inverse square. Large $alpha$ gives $1 slash N$.

+ *A fixed mean leaves the width free.* $mu$ constrains $⟨N⟩$ and nothing else. Any quantity that is nonlinear in $N$ then picks up $1/2 partial_N^2 (dot) thin Δ N^2$. For extensive quantities this correction is a relative term of order $N^(-p)$.

+ *The numerical trap.* The $f(1-f)$ integrals fail silently below $T slash epsilon_F approx 0.005$. They give a wrong answer unless $mu$ is a subdivision node.

#v(0.5em)
#text(fill: gray)[The $d = 6$ box and the $d = 3$ trap share $alpha = 2$. They share every convergence exponent and coefficient. This result follows from $alpha$ alone, so it is a prediction. See Act I for detail.]

#ending-slide(
  title: [Questions?],
  contact: ("email@example.com", "github.com/username"),
)

// ============================================================
//  BACKUP
// ============================================================

== Backup: the classical chemical potential
// If asked. Same trend with alpha.

== Backup: where the closed forms hold
// If asked. The T^2 forms are strictest for C_V.

#figure-slide(
  image("../figures/caloric_curve.png", width: 80%),
  title: [Backup: caloric curves],
  caption: [Numeric inversion against the inverted Sommerfeld $U(T)$.],
)

== Backup: the exact enumeration, in full
// If asked. Four-level box, 18 percent gap.
