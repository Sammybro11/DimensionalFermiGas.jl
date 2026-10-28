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
    subtitle: [The dimension $d$ enters only through the density of states, $g(epsilon) = A epsilon^alpha$.],
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

== The system, the units, the scope

#block(breakable:false)[
*System* --- $N$ non-interacting spin-$1 slash 2$ fermions in a
$d$-dimensional box, $V = L^d$, plus a harmonic trap, frequency $omega$.

*Units* --- $ℏ^2 slash 2m = 1$ and $k_B = 1$, so $epsilon = k^2$ and $T$
carries units of energy.

*Scope* --- thermodynamic limit, $N, V -> infinity$ at fixed $N slash V$,
with $d = 1, ..., 6$: the thermodynamics never sees $d$ directly, only $alpha$.
]
// P1, 40 s. Three short lines.

== The DOS gives two parameters

#block(breakable:false)[

*Box* --- allowed $k$ lie on a lattice of spacing $2 pi slash L$; states
below $epsilon$ fill a $d$-ball of radius $k = sqrt(epsilon)$:
$ N(epsilon) = g_s (V V_d k^d)/((2 pi)^d) quad -> quad alpha = d/2 - 1 , quad A = g_s (V V_d (d/2))/((2 pi)^d) $
#text(size: 0.85em)[$V_d = pi^(d/2) slash Gamma(d/2 + 1)$ is the unit $d$-ball
volume; the factor $d slash 2$ in $A$ comes from the derivative.]

*Trap* --- tuples with $sum n_i <= epsilon slash ℏ omega$ fill a $d$-simplex:
$ N(epsilon) = g_s/(d!) (epsilon slash ℏ omega)^d quad -> quad alpha = d - 1 , quad A = g_s/((d - 1)! (ℏ omega)^d) $

*Continuum* --- levels so dense that $sum_i -> integral g(epsilon) dif epsilon$.

#v(0.3em)
#text(fill: blue)[
  Trap in $d$ dims $equiv$ box in $2d$ dims: same $alpha$, different $A$ ---
  the power law matches, the thermodynamics does not.
]
// P1, 75 s. Both derivations, one linear read: count, differentiate, done.

]
== The numbers at $N = 1000$

#block(breakable:false)[
Operating point: box $V = 100$, trap $ℏ omega = 1$, with
$E_0 = ((alpha+1)/(alpha+2)) N epsilon_F$.

#align(center, table(
  columns: (auto, auto, auto, auto),
  align: (center,) * 4,
  stroke: none,
  table.hline(stroke: 0.8pt),
  [case], [$alpha$], [$epsilon_F$], [$E_0$],
  table.hline(stroke: 0.4pt),
  [$d = 3$ box], [0.5], [44.42], [26 650],
  [$d = 4$ box], [1.0], [39.74], [26 490],
  [$d = 5$ box], [1.5], [38.67], [27 620],
  [#text(fill: blue)[$d = 6$ box]], [#text(fill: blue)[2.0]], [#text(fill: blue)[39.05]], [#text(fill: blue)[29 280]],
  [#text(fill: blue)[trap, $d = 3$]], [#text(fill: blue)[2.0]], [#text(fill: blue)[14.42]], [#text(fill: blue)[10 820]],
  [trap, $d = 4$], [3.0], [10.47], [8 373],
  table.hline(stroke: 0.8pt),
))

#v(0.3em)
#text(fill: gray, size: 0.85em)[
  Blue rows share $alpha = 2$: identical entropy, identical Sommerfeld error
  tables, identical convergence exponents --- a *prediction* of the
  $(alpha, A)$ story.
]
// P1, 45 s. Flag the alpha = 2 duplicate here.
]

== Sommerfeld, and the $alpha$ cancellation

#block(breakable:false)[
#text(fill: gray)[*Lemma*] (for $T dot.c mu$): #text(fill: gray)[integrate by parts, expand $H$ about $mu$]

#align(center, $ integral_0^infinity H(epsilon) f(epsilon) dif epsilon approx integral_0^mu H(epsilon) dif epsilon + (pi^2/6) T^2 H'(mu) $)

#text(fill: gray)[*Cancellation*] (take $H = epsilon g$): #text(fill: gray)[the $alpha$ from $mu(T)$ cancels the explicit $alpha$]

#align(center, $ U(T) approx E_0 + (pi^2/6) g(epsilon_F) T^2 , quad C_V = (pi^2/3) g(epsilon_F) T $)
]
// P1, 60 s. One line each; mu(T) and the slope mechanism are spoken.

#figure-slide(
  image("figures/mu_vs_T.png", width: 75%),
  caption: [$d = 1$ rises, $d = 2$ is flat, $d >= 3$ falls: the slope sign flips with $alpha$.],
)
// P1, 45 s. Figure 4 alone; the closing line is spoken from memory.

// ------------------------------------------------------------
//  ACT II --- P2 --- 5:00
// ------------------------------------------------------------
#section-slide[Temperature from state counts]

== Temperature from counting alone
// Omega from the generator function. T from d ln Omega / dE.
// P2, 60 s.

#figure-slide(
  image("figures/microcanonical_T_convergence.png", width: 70%),
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
#v(0.3em)
#block(stroke: 0.6pt, inset: 10pt, radius: 3pt, width: 100%, above: 0.4em, below: 0.8em)[
  #text(fill: gray)[*Grand canonical* --- fixed $(mu, T, V)$]
  $ Xi(mu, T) = sum_(N=0)^infinity Z_N e^(mu N slash T) = product_i (1 + e^(-(epsilon_i - mu) slash T)) $
  $ ⟨N⟩ = sum_i f_i , quad ⟨E⟩ = sum_i epsilon_i f_i , quad Δ N^2 = sum_i f_i (1 - f_i) , quad f_i = f(epsilon_i) $
]

== Canonical Ensemble

The canonical sum needs the state count. That is the number of ways to put $N$ fermions on the levels with total energy $E$. The count of combinations grows exponentially with $N$.

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
  image("../figures/alpha_convergence.png", width: 68%),
  title: [Higher $alpha$ converges slower],
  caption: [Gap against $N$ at fixed absolute $T$. Fitted slopes are $-1.97$, $-1.46$, $-1.29$, $-1.20$ against the predicted $-2$, $-1.5$, $-1.33$, $-1.25$.],
)

#figure-slide(
  image("../figures/fluctuation_scaling.png", width: 68%),
  title: [Jensen Gap],
  caption: [$Delta N slash N prop N^(-1 slash 2)$ at fixed $T slash epsilon_F = 0.1$, for every $d$. The square of this curve gives the $1 slash N$ in the gap.],
)


#figure-slide(
  image("figures/exact_convergence.png", width: 68%),
  title: [The gap is real, and it closes],
  caption: [Exact $⟨E⟩_"gc"$ against exact $⟨E⟩_C$ for 1D boxes. Both sides are separate computations. They disagree at small $L$ and converge as $L$ grows.],
)
// P3, 45 s.

#ending-slide(
  title: [Thank You],
  subtitle: [Questions?],
  contact: ("https://github.com/Sammybro11/DimensionalFermiGas.jl", ),
)

// ============================================================
//  BACKUP
// ============================================================

== Backup: the classical limit of $mu$

#block(breakable:false)[
#align(center, table(
  columns: (auto, auto, auto, auto, auto),
  align: (center,) * 5,
  stroke: none,
  table.hline(stroke: 0.8pt),
  [$T slash epsilon_F$], [degeneracy], [$mu$ exact], [$mu$ classical], [error],
  table.hline(stroke: 0.4pt),
  [0.05], [67.28], [44.33], [9.349], [78.91%],
  [0.10], [23.79], [44.05], [14.08], [68.04%],
  [0.30], [4.578], [40.63], [20.27], [50.10%],
  [0.50], [2.128], [33.01], [16.77], [49.20%],
  [1.00], [0.7523], [-0.9534], [-12.65], [1227%],
  [2.00], [0.2660], [-109.3], [-117.7], [7.61%],
  [5.00], [0.06728], [-594.2], [-599.5], [0.89%],
  [10.00], [0.02379], [-1657], [-1661], [0.23%],
  table.hline(stroke: 0.8pt),
))
#v(0.3em)
#text(fill: gray, size: 0.85em)[$d = 3$ box at $N = 1000$: the classical form is a seed and a high-$T$ check, never an answer below $T approx epsilon_F$. Higher $d$ converges sooner.]
]
// Backup only, not in the main line.

== Backup: where the closed forms hold
// If asked. The T^2 forms are strictest for C_V.

#figure-slide(
  image("figures/caloric_curve.png", width: 75%),
  title: [Backup: caloric curves],
  caption: [Numeric inversion against the inverted Sommerfeld $U(T)$.],
)

== Backup: the exact enumeration, in full
// If asked. Four-level box, 18 percent gap.
