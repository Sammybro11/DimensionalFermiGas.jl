//  Build: typst compile --root . slides/slides.typ slides/slides.pdf
//
//  Act I   P1  5:00   what controls the gas
//  Act II  P2  5:00   temperature from state counts (Shanmukh)
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

== The system, and the claim

#block(breakable:false)[

A Fermi gas in $d$ dimensions is not $d$ separate problems: the dimension
enters only through the density of states, $g(epsilon) = A epsilon^alpha$.
Two numbers fix every thermodynamic quantity.

$N$ non-interacting spin-$1 slash 2$ fermions in a $d$-dimensional box,
$V = L^d$ #text(fill: gray)[(plus a harmonic trap, frequency $omega$, as a
second dial on $alpha$)]. The single-particle levels are

#align(center, $ epsilon = (ℏ^2 k^2)/(2m), quad k = (2 pi)/L (n_1, ..., n_d), quad n_i = 1, 2, ... $)

#text(fill: gray)[*Units*] --- $ℏ^2 slash 2m = 1$, $k_B = 1$, so $epsilon = k^2$; entropy is dimensionless and $T$ carries units of energy.

#text(fill: gray)[*Scope*] --- non-interacting, one species, thermodynamic
limit $N, V -> infinity$ at fixed $N slash V$, with $d = 1, ..., 6$ #text(fill: gray)[(the thermodynamics never sees $d$ directly, only $alpha$; $d = 6$ is just a larger $alpha$)].
// P1, 60 s. Claim first, then everything the audience needs on one slide.

]

== The DOS gives two parameters

#block(breakable:false)[

*Box* --- allowed $k$ lie on a lattice of spacing $2 pi slash L$; states
below $epsilon$ fill a $d$-ball of radius $k = sqrt(epsilon)$:
$ N(epsilon) = g_s (V V_d k^d)/((2 pi)^d) quad -> quad alpha = d/2 - 1 , quad A = g_s (V V_d (d/2))/((2 pi)^d) $
#text(size: 0.85em)[$V_d = pi^(d/2) slash Gamma(d/2 + 1)$ is the unit $d$-ball
volume; the factor $d slash 2$ in $A$ comes from the derivative.]

*Trap* --- tuples with $sum n_i <= epsilon slash ℏ omega$ fill a $d$-simplex:
$ N(epsilon) = g_s/(d!) (epsilon slash ℏ omega)^d quad -> quad alpha = d - 1 , quad A = g_s/((d - 1)! (ℏ omega)^d) $

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
  [$d = 3$ box], [0.5], [44.42], [26 654],
  [$d = 4$ box], [1.0], [39.74], [26 492],
  [$d = 5$ box], [1.5], [38.67], [27 625],
  [#text(fill: blue)[$d = 6$ box]], [#text(fill: blue)[2.0]], [#text(fill: blue)[39.05]], [#text(fill: blue)[29 285]],
  [#text(fill: blue)[trap, $d = 3$]], [#text(fill: blue)[2.0]], [#text(fill: blue)[14.42]], [#text(fill: blue)[10 817]],
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

== Sommerfeld, and why $alpha$ cancels

#block(breakable:false)[
For $T dot.c mu$: integrate by parts and expand $H$ about $mu$,

#align(center, $ integral_0^infinity H(epsilon) f(epsilon) dif epsilon approx integral_0^mu H(epsilon) dif epsilon + (pi^2/6) T^2 H'(mu) $)

*Take $H = g$* (fixes $N$):
$mu(T) approx epsilon_F [1 - (pi^2/6) alpha (T slash epsilon_F)^2]$.
$mu$ is *not* universal --- rising DOS ($alpha > 0$) forces $mu$ down,
falling ($alpha < 0$, the $d = 1$ box) forces it up, flat ($alpha = 0$,
$d = 2$) holds it.

*Take $H = epsilon g$*: the $alpha$ inherited from $mu(T)$ cancels the
explicit $alpha$, so $U$ *is* universal,

#align(center, $ U(T) approx E_0 + (pi^2/6) g(epsilon_F) T^2 $)

one form, every dimension. Then $C_V = S = (pi^2/3) g(epsilon_F) T$,
linear in $T$ for any power-law DOS.
]
// P1, 75 s. Core of Act I. U is universal, mu is not.

#figure-slide(
  image("figures/mu_vs_T.png", width: 75%),
  title: [The sign of the slope flips with $alpha$],
  caption: [$d = 1$ rises. $d = 2$ is flat. $d >= 3$ falls.],
)
// P1, 45 s. One sentence.

// ------------------------------------------------------------
//  ACT II --- P2 (Shanmukh) --- 5:00
// ------------------------------------------------------------
#section-slide[Temperature from state counts]
// P2 (Shanmukh), 5 s. Handoff in from P1.

== Temperature from counting alone

#block(breakable:false)[
An isolated gas fixes $(N, E, V)$. We count its microstates and read $T$ and
$mu$ off how the count changes.

#block(stroke: 0.6pt, inset: 8pt, radius: 3pt, width: 100%, above: 0.8em, below: 1.4em)[
  #align(center, $ S = ln Omega(N, E), quad 1/T = lr((partial S)/(partial E)|)_(N, V), quad mu/T = - lr((partial S)/(partial N)|)_(E, V) $)
]

#grid(
  columns: (1fr, 1fr),
  column-gutter: 2em,
  row-gutter: 1.1em,
  align: (left + top, left + top),
  [#text(fill: gray)[*Generating function*] --- each level empty or full],
  [#text(fill: gray)[*Table fill*] --- one update per level],
  align(center, $ product_i (1 + z thin x^(epsilon_i)) = sum_(N, E) Omega(N, E) thin z^N x^E $),
  align(center, $ Z'_(n, e) = Z_(n, e) + Z_(n - 1, thin e - epsilon_i) $),
  text(size: 0.85em)[Levels $1, 4, 9, 16$ with $N = 2$: six states at
    $E = 5, 10, 13, 17, 20, 25$, each with $Omega = 1$.],
  text(size: 0.85em)[Cost $O(L dot.c N dot.c E_"max")$ instead of $binom(L, N)$.
    Exact `BigInt` counts in `omega_counts`.],
)

#v(1.4em)
#text(fill: blue)[No bath and no canonical input: $T$ comes from $Omega$ alone.]
]
// P2 (Shanmukh), 75 s. Definitions, then the product. Point at the four-level example.

== Boltzmann against Gibbs: offsets that do not shrink

#block(breakable:false)[
#grid(
  columns: (1.35fr, 1fr),
  column-gutter: 1.4em,
  align: (center + horizon, left + horizon),
  [
    #image("figures/microcanonical_T_convergence.png", width: 100%)
    #v(-0.4em)
    #text(size: 0.8em, fill: gray)[1D trap, levels $0, ..., L$, $N = L slash 2$, reference $T_0 = 4$.]
  ],
  [
    #text(fill: gray)[*Boltzmann*] at the mode $E^*$
    $ S_B = ln Omega(E) $
    #text(fill: gray)[*Gibbs*] at the mean $⟨E⟩$
    $ S_G = ln sum_(E' <= E) Omega(E') $

    #align(center, table(
      columns: (auto, auto, auto),
      align: (center,) * 3,
      stroke: none,
      table.hline(stroke: 0.8pt),
      [$L$], [$T_B$], [$T_G$],
      table.hline(stroke: 0.4pt),
      [10], [$+9.5%$], [$-18.6%$],
      [30], [$-5.0%$], [$-0.6%$],
      [60 -- 120], [$-1.7%$], [$+3.3%$],
      table.hline(stroke: 0.8pt),
    ))

    #text(fill: blue)[From $L = 60$ the numbers freeze. The Boltzmann offset is fit bias; the Gibbs offset is a real finite-size gap.]
  ],
)
]
// P2 (Shanmukh), 75 s. Admit no convergence to a limit. Backup slide explains the freeze.

== The continuum route, and its built-in circularity

#block(breakable:false)[
At $N = 1000$ counting is out of reach. $Omega(E) e^(-E slash T)$ peaks
where $partial ln Omega slash partial E = 1 slash T$, so we solve

#align(center, $ ⟨E⟩(T, mu(T, N)) = E quad -> quad T(E, N), quad mu = mu(T(E, N), N) . $)

#grid(
  columns: (auto, 1fr),
  column-gutter: 2em,
  align: (center + top, left + top),
  table(
    columns: (auto, auto, auto, auto, auto),
    align: (center,) * 5,
    stroke: none,
    table.hline(stroke: 0.8pt),
    [case], [$T$], [$mu$], [$T slash epsilon_F$], [$S$],
    table.hline(stroke: 0.4pt),
    [$d = 3$ box], [17.79], [37.31], [0.40], [1648],
    [$d = 4$ box], [14.43], [30.70], [0.36], [2004],
    [$d = 5$ box], [12.78], [28.26], [0.33], [2329],
    [#text(fill: blue)[$d = 6$ box]], [11.80], [27.50], [0.30], [#text(fill: blue)[2633]],
    [#text(fill: blue)[trap, $d = 3$]], [4.359], [10.16], [0.30], [#text(fill: blue)[2633]],
    [trap, $d = 4$], [2.690], [7.091], [0.26], [3200],
    table.hline(stroke: 0.8pt),
  ),
  [
    #set par(spacing: 0.9em)
    #text(fill: gray)[*Operating point*] --- $N = 1000$, $E = 1.5 thin E_0$.

    #text(fill: gray)[*Warm gas*] --- $T slash epsilon_F = 0.26$ to $0.40$. The inverted
    Sommerfeld $U(T)$ gives a $T$ 4 to 13% low.

    #text(fill: blue)[Blue rows share $alpha = 2$: same $S$, different $T$.]

    #text(fill: red)[This $T$ is defined through $⟨E⟩$. Fed back into the canonical and
    grand canonical sums, $E$ and $N$ return to $10^(-16)$ by construction.]
  ],
)
]
// P2 (Shanmukh), 60 s. Saddle point in one sentence. The red line sets up Act III; do not resolve it here.

== Numerics behind the temperature

#block(breakable:false)[
#grid(
  columns: (1fr, 1fr, 1fr),
  column-gutter: 1.4em,
  align: (left + top,) * 3,
  [
    #text(fill: gray)[*$T$ inversion*] --- bisection on
    $ ⟨E⟩(T, mu(T, N)) = E $
    inside the bracket #box($T in (10^(-12), T_"max")$) with
    $ T_"max" = 20 (E - E_0) slash N + epsilon_F . $

    #text(size: 0.85em)[The lower end stands in for $T = 0$. The upper end is always hotter than
    the answer. Every step re-solves $mu$ so that $⟨N⟩ = N$. The integrals set the accuracy,
    $tilde 10^(-8)$.]
  ],
  [
    #text(fill: gray)[*Exact counts*] --- the largest entry at $L = 120$, $N = 60$ is
    $ max_E thin Omega(N, E) approx 4 times 10^(32) . $

    #text(size: 0.85em)[`Int64` wraps silently above #box($9.2 times 10^(18)$). `Float64` holds integers
    exactly only to #box($2^(53) approx 9 times 10^(15)$). So $Omega$ is a `BigInt`, and the canonical
    weights switch to `BigFloat` when #box($N dot.c Delta epsilon slash T > 1000$).]
  ],
  [
    #text(fill: gray)[*Exact-$T$ estimator*] --- $1 slash T$ is the least-squares slope of
    $ln Omega$ over $plus.minus w$ occupied energies.

    #align(center, table(
      columns: (auto, auto, auto, auto),
      align: (center,) * 4,
      stroke: none,
      table.hline(stroke: 0.8pt),
      [$w$], [2], [10], [20],
      table.hline(stroke: 0.4pt),
      [$T_B$], [4.004], [3.931], [3.815],
      table.hline(stroke: 0.8pt),
    ))

    #text(size: 0.85em)[At the mode $E^*$ the exact slope is $1 slash T_0$, so a narrow window
    returns $T_0 = 4$. A wide window fits a straight line to a curve.]
  ],
)

#v(0.8em)
#text(fill: blue)[Counting is exact; the only free choice is the fit window. We get
temperature with no canonical input.]
]
// P2 (Shanmukh), 45 s. Three columns left to right. Close on the blue line, then hand to Samyak.

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
  image("figures/fluctuation_scaling.png", width: 68%),
  title: [Jensen Gap],
  caption: [$Delta N slash N prop N^(-1 slash 2)$ at fixed $T slash epsilon_F = 0.1$, for every $d$. The square of this curve gives the $1 slash N$ in the gap.],
)


#figure-slide(
  image("figures/exact_convergence.png", width: 68%),
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
  contact: ("https://github.com/Sammybro11/DimensionalFermiGas.jl", ),
)

// ============================================================
//  BACKUP
// ============================================================

== Backup: the classical chemical potential
// If asked. Same trend with alpha.

== Backup: where the closed forms hold
// If asked. The T^2 forms are strictest for C_V.

== Backup: why the exact table freezes

#block(breakable:false)[
Once $N$ and the empty levels above the Fermi sea exceed the thermal
excitations, the count depends on the excitation $q = E - E_0$ alone:

#align(center, $ Omega(N, E_0 + q) = p(q) = 1, 1, 2, 3, 5, 7, 11, 15, 22, 30, 42, ... $)

#text(size: 0.85em)[$p(q)$ counts the integer partitions of $q$. Each excited state lists how far
each particle moved up. The result is the same for every $L >= 60$ at $T_0 = 4$.]

The heat capacity never grows: $C_V = (pi^2 slash 3) thin g(epsilon_F) thin T$ with
$g(epsilon_F) = 1 slash ℏ omega$ at every $N$. At $T = 4$, $C approx 12.7$, $⟨q⟩ approx 24.4$
and $Delta E slash ⟨q⟩ approx 0.58$.

#v(0.3em)
#text(fill: blue)[A gas with $C approx 13$ stays a small system. Convergence needs $C$ to grow,
for example at fixed $T slash epsilon_F$.]
]
// P2 (Shanmukh). Only if asked why the offsets never shrink.

#figure-slide(
  image("figures/caloric_curve.png", width: 75%),
  title: [Backup: caloric curves],
  caption: [Numeric inversion against the inverted Sommerfeld $U(T)$.],
)

== Backup: the exact enumeration, in full
// If asked. Four-level box, 18 percent gap.
