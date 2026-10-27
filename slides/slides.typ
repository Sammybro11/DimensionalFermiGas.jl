// ============================================================
//  Three Ensembles, One Exponent
//  Theme: calmly-touying 0.2.0 (MIT), built on Touying
//  Build: typst compile --root . slides/slides.typ slides/slides.pdf
//
//  Skeleton only. Each slide holds a comment saying what goes
//  in it, plus the presenter and the target time.
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
    date: "October, 2026",
    institution: "Indian Institute of Technology Hyderabad",
  ),
  variant: "light",
  colortheme: "dracula",
  progressbar: "foot",
  header-style: "minimal",
  title-layout: "split"
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

== Numerics: where the error actually lives
// QuadGK split at mu. Error budget table.
// P2, 60 s.

// ------------------------------------------------------------
//  ACT III --- P3 --- 5:00
// ------------------------------------------------------------
#section-slide[Do the ensembles agree?]

== What the residual proves
// Two columns: proves nothing / proves something.
// P3, 75 s.

#figure-slide-split(
  image("../figures/exact_convergence.png"),
  image("../figures/fluctuation_scaling.png"),
  title: [Two of the three real checks],
  caption-left: [Exact GC against C, four-level box upward.],
  caption-right: [$Delta N \/ N$ at fixed $T \/ epsilon_F = 0.1$.],
)
// P3, 60 s.

== The coincidence is a prediction
// d = 6 box and d = 3 trap share alpha = 2.
// P3, 60 s. Answer before anyone asks.

== What we found
// P3, 45 s.

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
