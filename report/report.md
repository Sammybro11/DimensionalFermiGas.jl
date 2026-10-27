---
title: "Microcanonical, Canonical, and Grand Canonical Ensembles of an Ideal Fermi Gas in d Dimensions"
author: "Samyak Rai"
date: "October 2026"
geometry: margin=1in
monofont: Menlo
---

# The system

We study a gas of $N$ non-interacting spin-$1/2$ fermions of mass $m$ in a $d$-dimensional
box of volume $V = L^d$. The single-particle energies are

$$\varepsilon = \frac{\hbar^2 k^2}{2m}, \qquad k = \frac{2\pi}{L}(n_1, \dots, n_d).$$

## Units

Set $\hbar = 1$ and $m = 1/2$ in the expression above. Then $k = 2\pi n/L$ and $\varepsilon = k^2$.
The trap frequency $\omega$ stays dimensionful, so we measure trap energies in units of
$\hbar\omega$. Set also $k_B = 1$. Entropy is then dimensionless. Temperature carries
units of energy.

## Scope and assumptions

The gas is non-interacting and dilute, and it has one spin-$1/2$ species. Every equivalence
statement in this report holds in the thermodynamic limit. That limit is $N \to \infty$ and
$V \to \infty$ at fixed density $n = N/V$.

The report treats a free gas only. Interactions, a magnetic field, a lattice, band
structure, and topology are all outside its scope. We also do not treat the discrete box
degeneracies in canonical or microcanonical form.

## The dimensionality as a parameter

We treat $d$ as a dial. The cases $d = 1, 2, 3$ appear in nanowires, 2DEGs, and ordinary 3D
gases. We extend the study to $d = 6$ to exercise the general-$d$ closed forms well past the
physical range. The DOS exponent grows with $d$. The higher cases sharpen the trend that
$d = 3$ only suggests.

The 3D harmonic trap, where $\alpha = 2$, already covers the interesting range of $\alpha$
physically. The $d = 6$ box has the same $\alpha = 2$. Those two cases share every
thermodynamic ratio in this report. Section 1 shows this duplication in the error tables.

Synthetic-dimension experiments realize different models. They study lattice systems with
nontrivial topology, such as a quantized 4D Hall response. This report studies a free
continuum gas. Its thermodynamics depend only on $(\alpha, A)$, and topology does not enter.
So the higher $d$ cases here are not those systems.

## Density of states: derivation of $\alpha$ and $A$

For the box, count $d$-dimensional wavevectors inside a ball of radius $k$:

$$N(\varepsilon) = g_s\,\frac{V\,V_d\,k^d}{(2\pi)^d}, \qquad k = \sqrt{\varepsilon},
\qquad V_d = \frac{\pi^{d/2}}{\Gamma(d/2 + 1)},$$

where $V_d$ is the volume of the unit $d$-ball. So $N(\varepsilon) = C\, \varepsilon^{d/2}$
with $C = g_s V V_d/(2\pi)^d$. Differentiate once:

$$g(\varepsilon) = \frac{dN}{d\varepsilon} = C\,\frac{d}{2}\,\varepsilon^{d/2 - 1}
= A\,\varepsilon^{\alpha}.$$

This step produces both the exponent and the factor $d/2$ in the prefactor:

$$\alpha = \frac{d}{2} - 1, \qquad
A = \frac{g_s\, V\, V_d}{(2\pi)^d}\,\frac{d}{2} \qquad (\text{box}).$$

For the trap, count oscillator states with energy at or below $\varepsilon$. Write $\varepsilon/(\hbar\omega) = m$.
The number of tuples of non-negative integers with $\sum_i n_i \leq m$ is the volume of the
$d$-simplex, that is $m^d/d!$. So

$$N(\varepsilon) = \frac{g_s}{d!}\left(\frac{\varepsilon}{\hbar\omega}\right)^d,
\qquad g(\varepsilon) = \frac{dN}{d\varepsilon}
= \frac{g_s}{(d-1)!\,(\hbar\omega)^d}\,\varepsilon^{d-1},$$

so

$$\alpha = d - 1, \qquad A = \frac{g_s}{(d-1)!\,(\hbar\omega)^d}
\qquad (\text{trap}).$$

The exponents coincide when the trap dimension $d$ satisfies $d - 1 = d_{\text{box}}/2 - 1$,
that is when $d_{\text{box}} = 2d$. So a trap in $d$ dimensions has the same DOS exponent as
a box in $2d$ dimensions. The prefactors differ. $A_{\text{trap}}$ has no $V$ and a
different dimension. The trap reproduces the box power law, and it does not reproduce the
box thermodynamics. A different $A$ means a different $\varepsilon_F$, a different $C_V$,
and different values of every thermodynamic quantity.

## Fermi energy and ground-state energy

The Fermi energy follows from $N = \int_0^{\varepsilon_F} g(\varepsilon)\, d\varepsilon$:

$$N = \frac{A}{\alpha+1}\,\varepsilon_F^{\alpha+1} \quad\Longrightarrow\quad
\varepsilon_F = \left(\frac{N\,(\alpha+1)}{A}\right)^{1/(\alpha+1)}.$$

The ground-state energy follows the same way:

$$E_0 = \int_0^{\varepsilon_F} \varepsilon\, g(\varepsilon)\, d\varepsilon
= \frac{A}{\alpha+2}\,\varepsilon_F^{\alpha+2} = \frac{\alpha+1}{\alpha+2}\,
N\,\varepsilon_F .$$

Table 1 lists the values at the operating point of Section 1.

| case | $\alpha$ | $A$ | $\varepsilon_F$ | $E_0$ | $g(\varepsilon_F)$ |
|---|---|---|---|---|---|
| $d = 3$ box | 0.5 | 5.066059 | 44.4236 | 26654.175 | 33.7658 |
| $d = 4$ box | 1.0 | 1.266515 | 39.7384 | 26492.235 | 50.3292 |
| $d = 5$ box | 1.5 | 0.268763 | 38.6748 | 27624.875 | 64.6415 |
| $d = 6$ box | 2.0 | 0.050393 | 39.0466 | 29284.976 | 76.8312 |
| trap, $d = 3$ | 2.0 | 1.0 | 14.4225 | 10816.872 | 208.008 |
| trap, $d = 4$ | 3.0 | 0.333333 | 10.4664 | 8373.081 | 382.177 |
: DOS parameters and Fermi energies at $N = 1000$, box $V = 100$, trap $\hbar\omega = 1$. The $d = 6$ box and the $d = 3$ trap share $\alpha = 2$, so they share every ratio below.

## The Sommerfeld lemma

At low temperature we need integrals of the form $\int_0^\infty H(\varepsilon) f(\varepsilon)\, d\varepsilon$.
Integrate by parts. The Fermi function $f$ drops from one to zero within about $T$ of $\mu$.
The boundary term at the band bottom is negligible. The remaining integrand peaks near
$\mu$, so we Taylor-expand $H$ about $\mu$:

$$\int_0^\infty H(\varepsilon) f(\varepsilon)\, d\varepsilon
\approx \int_0^\mu H(\varepsilon)\, d\varepsilon + \frac{\pi^2}{6}\, T^2\,
H'(\mu).$$

The factor $\pi^2/6$ comes from the standard integral $\int_{-\infty}^{\infty} x^2 \operatorname{sech}^2(x/2)\, dx/4 = \pi^2/3$.

The expansion is valid when four conditions hold. First, $T \ll \mu$. Second, $\mu$ is
positive and well above the band bottom. Third, $H$ is smooth near $\mu$. Fourth, $g$
vanishes or stays integrable at the band bottom, so the lower-limit term is negligible.

## Chemical potential and the $\alpha$ cancellation

Apply the lemma to $N = \int g f\, d\varepsilon$, that is with $H = g$:

$$N = \frac{A\,\mu^{\alpha+1}}{\alpha+1} + \frac{\pi^2}{6}\, T^2\,
A\,\alpha\,\mu^{\alpha-1}.$$

Write $N = A\varepsilon_F^{\alpha+1}/(\alpha+1)$ and $\mu = \varepsilon_F(1 + \delta)$.
Divide by $N$:

$$1 \approx 1 + (\alpha+1)\delta
+ \frac{\pi^2}{6}\,\alpha\,(\alpha+1)\left(\frac{T}{\varepsilon_F}\right)^2
\quad\Longrightarrow\quad \mu(T) = \varepsilon_F\left[1 - \frac{\pi^2}{6}\,
\alpha\left(\frac{T}{\varepsilon_F}\right)^2\right].$$

Now apply the lemma to $U = \int \varepsilon g f\, d\varepsilon$, that is with $H = \varepsilon g$:

$$U = \frac{A\,\mu^{\alpha+2}}{\alpha+2} + \frac{\pi^2}{6}\, T^2\,
A\,(\alpha+1)\,\mu^{\alpha}.$$

Insert $\mu(T)$ into both terms and keep order $T^2$. The first term gives

$$\frac{A\,\mu^{\alpha+2}}{\alpha+2} = E_0\left[1 - \frac{\pi^2}{6}\,
\alpha\,(\alpha+2)\left(\frac{T}{\varepsilon_F}\right)^2\right].$$

The second term gives $(\pi^2/6)\,T^2\,(\alpha+1)\,g(\varepsilon_F)$ to this order. Add the
two terms and use $N(\alpha+1) = A\varepsilon_F^{\alpha+1}$, so that $(\alpha+1)N/\varepsilon_F = g(\varepsilon_F)$:

$$U = E_0 + \frac{\pi^2}{6} T^2 (\alpha+1) g(\varepsilon_F)
- \frac{\pi^2}{6}\alpha\, g(\varepsilon_F)\, T^2 = E_0 + \frac{\pi^2}{6}\,
g(\varepsilon_F)\, T^2 .$$

The $\alpha$ dependence inherited from $\mu(T)$ cancels the explicit $\alpha$ dependence of
the second term. The coefficient of $T^2$ is $\alpha$-independent. This cancellation is why
$U(T)$ has one form for all $\alpha$, while $\mu(T)$ does not.

The heat capacity and the entropy follow by differentiation and integration:

$$C_V = \frac{dU}{dT} = \frac{\pi^2}{3}\, g(\varepsilon_F)\, T, \qquad
S(T) = \int_0^T \frac{C_V}{T'}\, dT' = \frac{\pi^2}{3}\,
g(\varepsilon_F)\, T .$$

## The sign of $\partial\mu/\partial T$

The constraint $\langle N \rangle = N$ fixes $\mu$ at each $T$. Since $g' \propto \alpha$, a
DOS that rises with energy ($\alpha > 0$) forces $\mu$ down as $T$ grows. A DOS that falls
with energy ($\alpha < 0$) forces $\mu$ up. A flat DOS ($\alpha = 0$) keeps $\mu$ constant
to this order. The $1/\sqrt{\varepsilon}$ divergence at the band bottom of the $d = 1$ box
is one example. It is not the cause.

## The classical limit of the chemical potential

The classical (Boltzmann) gas gives a second closed form for $\mu$. Take the
non-degenerate limit of the number equation, $N = A\, e^{\mu/T} T^{\alpha+1} \Gamma(\alpha+1)$.
Invert it:

$$\mu_{\text{cl}}(T) = T \ln\!\left[\frac{N}{A\,\Gamma(\alpha+1)\,T^{\alpha+1}}\right].$$

This form is exact when the degeneracy parameter $N/(A\Gamma(\alpha+1)T^{\alpha+1})$ is small.
It is wrong at low $T$, where the same parameter is large. The code uses it in two
places only. It is the first value for the $\mu$ root find at high $T$. It is also an
independent check on the solver, because $\mu_{\text{cl}}$ must approach the exact $\mu$ as
$T$ grows.

Table 2 measures the gap at fixed $N = 1000$.

| $T/\varepsilon_F$ | degeneracy parameter | $\mu$ exact | $\mu$ classical | relative error |
|---|---|---|---|---|
| 0.05 | 67.28 | 44.3319 | 9.3488 | 78.91% |
| 0.10 | 23.79 | 44.0523 | 14.0787 | 68.04% |
| 0.30 | 4.578 | 40.6291 | 20.2742 | 50.10% |
| 0.50 | 2.128 | 33.0117 | 16.7708 | 49.20% |
| 1.00 | 0.7523 | -0.9534 | -12.6466 | 1227% |
| 2.00 | 0.2660 | -109.346 | -117.670 | 7.61% |
| 5.00 | 0.06728 | -594.182 | -599.461 | 0.89% |
| 10.00 | 0.02379 | -1657.069 | -1660.804 | 0.23% |
: the exact Fermi-Dirac chemical potential against the classical closed form, for the $d = 3$ box at $N = 1000$. The exact value comes from the $\langle N\rangle = N$ root find.

The classical form fails by a wide margin at low $T/\varepsilon_F$. The error is 78.9
percent at $T/\varepsilon_F = 0.05$ and 49.2 percent at $T/\varepsilon_F = 0.5$. It passes 1
percent only near $T/\varepsilon_F = 5$. The failure is worst near $T = \varepsilon_F$, where
$\mu$ goes through zero and the relative error peaks. Above that value both quantities are
negative and large. The ratio then shrinks.

Higher dimensions converge sooner. Table 3 fixes $T/\varepsilon_F = 1$ and varies $d$.

| case | $\alpha$ | degeneracy parameter | relative error |
|---|---|---|---|
| $d = 3$ box | 0.5 | 0.7523 | 1227% |
| $d = 4$ box | 1.0 | 0.5000 | 21.16% |
| $d = 5$ box | 1.5 | 0.3010 | 4.50% |
| $d = 6$ box | 2.0 | 0.1667 | 1.16% |
: classical chemical potential error at $T/\varepsilon_F = 1$, versus dimension, at $N = 1000$.

The reason is the degeneracy parameter. It scales as $T^{-(\alpha+1)}$, so a larger $\alpha$
pushes the gas toward the classical regime at lower $T/\varepsilon_F$. This is the same
$\alpha$ that sets the slope of $\mu(T)$ above.

The trap cases follow the same pattern. The $d = 4$ trap has $\alpha = 3$ and reaches 0.08
percent error already at $T/\varepsilon_F = 1$.

# 1. Microcanonical ensemble: fixed $(N, E, V)$

We *derive* temperature and chemical potential from the entropy:

$$\frac{1}{T} = \frac{\partial S}{\partial E}\bigg|_{N,V}, \qquad
\frac{\mu}{T} = -\frac{\partial S}{\partial N}\bigg|_{E,V}.$$

We use two routes. Exact state counting gives $T$ and $\mu$ from $\Omega$ with no canonical
input. Inversion of the canonical mean energy gives the same quantities as a
thermodynamic-limit convenience.

## Exact state counting with a generator function

$\Omega(N, E, V)$ counts the ways to distribute $N$ fermions over single-particle states
with total energy $E$. For discrete levels $\varepsilon_i$ and integer energies,
$\Omega(N,E)$ is the coefficient of $z^N x^E$ in the product

$$\prod_i \left(1 + z\, x^{\varepsilon_i}\right).$$

We extract that coefficient in polynomial time. We do not enumerate configurations. The
entropy then follows as $S = \ln\Omega$. In the thermodynamic limit, the saddle point of the
density of states in $Z_N = \int \Omega(E) e^{-E/T} dE$ reproduces $S = \ln\Omega$ at the
saddle energy.

### Exact microcanonical temperature: 1D harmonic trap

For a 1D harmonic trap with levels $\varepsilon = 0, 1, \dots, L$ we compute the exact
counts and compare with the canonical reference $T_0 = 4$:

| $L$ | $N$ | $T_{\text{boltzmann}}$ | deviation | $T_{\text{gibbs}}$ | deviation |
|---|---|---|---|---|---|
| 10 | 5 | 4.382 | +9.5% | 3.256 | -18.6% |
| 16 | 8 | 3.871 | -3.2% | 3.634 | -9.2% |
| 22 | 11 | 3.744 | -6.4% | 3.863 | -3.4% |
| 30 | 15 | 3.800 | -5.0% | 3.974 | -0.6% |
| 40 | 20 | 3.943 | -1.4% | 4.071 | +1.8% |
| 60 | 30 | 3.931 | -1.7% | 4.133 | +3.3% |
: exact microcanonical temperatures from pure state counting for the 1D harmonic trap, relative to the canonical reference $T_0 = 4$.

We evaluate Boltzmann's $S = \ln\Omega(E)$ at the canonical *mode* energy $E^*$, the
saddle point of $\Omega(E)e^{-E/T}$. We evaluate Gibbs's
$S = \ln\sum_{E'\leq E}\Omega(E')$ at the *mean*.

Boltzmann and Gibbs lie on opposite sides of the canonical temperature at
$L = 10$, $L = 40$, and $L = 60$. At $L = 16$, $L = 22$, and $L = 30$ both values
fall below it. The magnitudes are not monotonic. The Boltzmann deviation runs
through 9.5, 3.2, 6.4, 5.0, 1.4, and 1.7 percent. The pattern shows a bracket in
three of six cases, and no convergence.

An extended scan locates where the pattern settles:

| $L$ | $N$ | $T_{\text{boltzmann}}$ | deviation | $T_{\text{gibbs}}$ | deviation |
|---|---|---|---|---|---|
| 80 | 40 | 3.931 | -1.7% | 4.133 | +3.3% |
| 100 | 50 | 3.931 | -1.7% | 4.133 | +3.3% |
| 120 | 60 | 3.931 | -1.7% | 4.133 | +3.3% |
: the same comparison extended to $L = 120$ in steps of 20.

From $L = 60$ the two conventions bracket $T_0 = 4$ in every row.
$T_{\text{boltzmann}}$ sits about 1.7 percent low and $T_{\text{gibbs}}$ about
3.3 percent high. The offsets do not shrink as $L$ grows. They come from the
finite energy window used in the difference, not from the system size. A wider
window of 20 levels at $L = 120$ moves the Boltzmann value to $-4.6$ percent
and the Gibbs value to $-1.2$ percent. The plateau is an estimator bias. The table
does not establish a limit.

A second caveat applies to every row. The levels are spinless, so $N = L/2$ and
$\varepsilon_F \approx N$. Both grow from row to row, so $T_0/\varepsilon_F$ falls
from 0.80 at $L = 10$ to 0.067 at $L = 120$. The ratio "relative to $T_0 = 4$" is
not a fixed baseline. The level spacing of the 1D trap also changes with $L$. We
fix $N = 30$ and vary only $L$ to remove the drift. With
$\varepsilon_F = 30$ and $T_0/\varepsilon_F = 0.133$, the two conventions bracket
$T_0$ in five of five rows from $L = 40$ to $L = 120$, with the same offsets.

![Exact microcanonical temperatures from pure state counting,
relative to the canonical $T_0 = 4$, versus system size. The dashed line $T_{\text{micro}}/T_0 = 1$
is the canonical reference.](../figures/microcanonical_T_convergence.png)

## Continuum temperature by inversion of the canonical mean energy

For the continuum gas we obtain $T(E,N)$ by inversion of the equilibrium relation $\langle E\rangle(T, \mu(T,N)) = E$.
This step **defines** the continuum microcanonical temperature operationally. It is a
thermodynamic-limit convenience, not an independent measurement.

The inversion solves for the pair $(T, \mu)$ that reproduces $E$ and $N$. Sections 2 and 3
then evaluate the canonical and grand canonical ensembles at exactly that pair. Their
residuals measure the solver tolerance. They do not measure the physics of ensemble
equivalence. A residual of `0.00e+00` or `1.82e-16` comes from the solver. Construction
forces it to zero.

This report uses three independent checks of equivalence:

1. Exact enumeration of small discrete systems, where we compute all three
   ensembles without approximation (Sections 1 and 4).
2. The finite-size decay of the grand-canonical to canonical energy
   discrepancy (Section 4).
3. The scaling $\Delta N/N \sim N^{-1/2}$ of grand-canonical number
   fluctuations (Section 4).

## Numerical methods

Every result below comes from a numerical procedure of the package. This section states each
procedure, together with its library and its setting. The aim is to separate the numerical
error from the physical error.

### Fermi integrals by adaptive Gauss-Kronrod quadrature

The package needs the moments $\langle N\rangle$, $\langle E\rangle$, $\Delta N^2$,
$\Delta E^2$, and $S$. All five are one integral,

$$\langle \varepsilon^k\rangle = \int_0^\infty \varepsilon^{k}\, g(\varepsilon)\,
w\big(f(\varepsilon)\big)\, d\varepsilon,$$

with a weight $w$ of $1$ for the means, of $f(1-f)$ for the variances, and with
$k = 0, 1, 2$. The function `moment` in `src/grandcanonical.jl` evaluates this integral
with `QuadGK.quadgk`. QuadGK applies adaptive Gauss-Kronrod quadrature and refines the
mesh until two nested rules agree.

The upper limit is infinite. QuadGK maps $[0,\infty)$ onto a finite interval with a
variable change, and the tail does not need a cutoff. The Fermi function also varies on a
scale $T$ around $\varepsilon = \mu$. At low $T$ that scale is far narrower than the
adaptive mesh will find on $[0,\infty)$. The code splits the interval at $\mu$ and puts a
node at that point:

```julia
μ > 0 ? quadgk(g, 0, μ, Inf)[1] : quadgk(g, 0, Inf)[1]
```

The guard on $\mu > 0$ is necessary. At high $T$ the chemical potential goes negative, and
a split at a negative point would reverse the interval. The scan script in
`scripts/sommerfeld_scan.jl` uses a relative tolerance of $10^{-12}$ with `atol = 0`. The
package leaves the QuadGK defaults in place.

### Root find for the chemical potential

`chemical_potential` solves $\langle N\rangle(T,\mu) = N$ with `Roots.find_zero`. The
derivative of the residual is a delta function in the low-$T$ limit. A derivative-based
method would fail. The code uses a method that brackets the root instead.

A bad start is the main risk, and the code draws the start from physics. Below
$\varepsilon_F/2$ the gas is degenerate, and the Sommerfeld form is accurate to a few
percent. Above it the gas is dilute, and the classical form is accurate. The function
`chemical_potential_seed` switches between them at $T = \varepsilon_F/2$.

The code applies two further guards against a silent failure. For $T < 10^{-10}\varepsilon_F$
it returns $\varepsilon_F$ directly. At that point the Fermi edge is sharper than double
precision can resolve. Otherwise the code checks the residual after the solve and stops on a
value above $10^{-8} N$. This check matters because the solver can stop on a step-size test
before the residual is small.

### Temperature inversion

`microcanonical_temperature` solves $\langle E\rangle(T) = E$ for $T$ with the same
`find_zero`. The bracket is $(10^{-12},\ 20(E - E_0)/N + \varepsilon_F)$. The upper limit is
an estimate that grows with the excitation energy. It keeps the bracket valid far from
$T = 0$.

### Heat capacity by finite difference

The numeric $C_V$ is a derivative of $U(T)$, and the code forms it numerically. The scan
uses a five-point central difference with step $h = 10^{-4}\varepsilon_F$. On a smooth
function that formula has error $O(h^4)$. The small step keeps the truncation error below
the quadrature error. The figure script uses a three-point rule with $h = 10^{-3}\varepsilon_F$
and reaches the same accuracy at lower cost.

### Exact state counting

`omega_counts` computes $\Omega(N,E)$ with a table fill over the levels. Let
$Z_{n,e}$ count the ways to place $n$ particles with total energy $e$. Each new level
adds one update, $Z'_{n,e} = Z_{n,e} + Z_{n-1,e-\varepsilon_i}$. The cost is
$O(\text{levels} \times N \times E_{\max})$, which is polynomial. Direct enumeration is
exponential, and the code keeps it for cross-checks only. The counts use `BigInt`, because
they overflow `Float64` at the sizes in this report.

### Canonical sums and numerical range

`canonical_sums` evaluates $Z_N$ and $\langle E\rangle$ with a recurrence over the levels,
relative to the per-particle ground level. This keeps every weight at or below one. Partial
configurations can still leave the `Float64` range at very low $T$. The routine switches to
`BigFloat` when $N \times \text{level spread} / T$ exceeds 1000.

### Error hierarchy

The quadrature error is the smallest term. A relative tolerance of $10^{-12}$ on a double
gives about $10^{-14}$ after accumulation. The root find keeps its residual between
$10^{-16}N$ and $10^{-8}N$. These two terms are far below every effect this report discusses.

The Sommerfeld truncation is the largest term, and Section 1 measures it. It reaches 67
percent for $C_V$ at the operating points, and it sets the scale of Table 8. The report
quotes the closed forms only where they hold, and it marks the range on Figure 2.

One practical rule follows. A disagreement at the $10^{-16}$ level does not give evidence for
or against ensemble equivalence. It is the solver's own convergence report.

## Numerical result: continuum, $N = 1000$, box $V = 100$, trap $\hbar\omega = 1$

| case | $E$ | $T$ | $\mu$ | $S$ |
|---|---|---|---|---|
| $d = 3$ box | 39981.2630 | 17.788831 | 37.314588 | 1648.2730 |
| $d = 4$ box | 39738.3531 | 14.429613 | 30.697749 | 2003.5035 |
| $d = 5$ box | 41437.3117 | 12.778608 | 28.255549 | 2328.6330 |
| $d = 6$ box | 43927.4647 | 11.801457 | 27.496122 | 2633.0505 |
| trap, $d = 3$ | 16225.3077 | 4.359056 | 10.156130 | 2633.0505 |
| trap, $d = 4$ | 12559.6217 | 2.690088 | 7.090508 | 3200.2736 |
: microcanonical results at fixed $(N, E, V)$ for $N = 1000$ and $E = 1.5 E_0$.

The trap run also reports a canonical mean energy of 16225.307666 with residual 0.00e+00.
It also reports a grand canonical mean number of 1000.000000. The $d = 4$ trap reports
12559.621673 and 1000.000000, with residuals 0.00e+00 and 1.14e-16.

The $d = 6$ box and the $d = 3$ trap agree in entropy to every printed digit, 2633.0505.
Both have $\alpha = 2$, and $S$ depends on $(\alpha, A)$ through $g(\varepsilon_F)$ and
$T$. Their temperatures differ by a factor 2.7, so the agreement is not trivial.

The printed precision exceeds the solver tolerance. The value $T = 17.788831$ shows six
printed decimals. We do not know the inversion tolerance to that precision. Read the last
digits as representative only.

A second run uses the Fermi-integral route at fixed $T/\varepsilon_F = 0.05$, which
lies inside the asymptotic regime:

| case | $T$ | $\mu$ | $U$ | $S$ |
|---|---|---|---|---|
| $d = 3$ box | 2.221181 | 44.331938 | 26927.1740 | 246.1235 |
| $d = 4$ box | 1.986918 | 39.574598 | 26817.0495 | 327.6311 |
| $d = 5$ box | 1.933741 | 38.436067 | 28019.5631 | 409.2179 |
| $d = 6$ box | 1.952332 | 38.725497 | 29763.1838 | 491.0786 |
| trap, $d = 3$ | 0.721125 | 14.303878 | 10993.5053 | 491.0786 |
| trap, $d = 4$ | 0.523318 | 10.337282 | 8544.6210 | 656.3789 |
: results from the Fermi-integral route at fixed $N = 1000$ and $T/\varepsilon_F = 0.05$.

The closed forms agree with the integrals to better than 0.5 percent for $\mu$,
$U$, and $S$ at these temperatures. The heat capacity is the weakest case. Its
error is 0.8 percent for the $d = 3$ box and 1.3 percent for the $d = 4$ box.
For the $d = 5$ box it is 1.5 percent, and for the $d = 6$ box and the $d = 3$ trap it
is 1.5 percent. The $d = 4$ trap is best, at 0.7 percent.

### Operating points relative to $\varepsilon_F$

The closed forms above are asymptotic in $T/\varepsilon_F$. We evaluate $\varepsilon_F$ from
the DOS formulas of this report at the quoted operating points. Table 1 holds the values,
and the corresponding ratios are

$$\frac{T}{\varepsilon_F} = 0.400,\ 0.363,\ 0.330,\ 0.302,\ 0.302,\ 0.257$$

for the cases in the order of Table 1.

These values are not in the asymptotic regime. Table 8 compares the closed forms
with full Fermi-function integrals along the same $(T, \mu)$ pairs, with a relative
tolerance of $10^{-12}$.

| case | $T/\varepsilon_F$ | $\mu$ | $U$ | $S$ | $C_V$ |
|---|---|---|---|---|---|
| $d = 3$ box | 0.400 | 3.35% | 10.63% | 19.89% | 67.43% |
| $d = 4$ box | 0.363 | 1.37% | 10.04% | 19.25% | 60.33% |
| $d = 5$ box | 0.330 | 0.01% | 8.57% | 16.70% | 49.98% |
| $d = 6$ box | 0.302 | 0.67% | 6.74% | 13.29% | 38.89% |
| trap, $d = 3$ | 0.302 | 0.67% | 6.74% | 13.29% | 38.89% |
| trap, $d = 4$ | 0.257 | 0.51% | 2.89% | 5.69% | 18.14% |
: relative error of the Sommerfeld closed forms at the operating points of Table 1.

The error of $U$, $S$, and $C_V$ falls as $d$ grows. The $\mu$ error does not follow that
pattern. It is $3.35$ percent at $d = 3$ and $0.01$ percent at $d = 5$, then $0.67$ percent at
$d = 6$. The $\mu$ error also goes through zero, because the $T^2$ term has the sign
of $\alpha$. The $d = 5$ case sits near that zero.

Table 9 gives the range where each form reaches 1 percent and 5 percent. The errors grow
monotonically with $T/\varepsilon_F$, so a bisection on $T/\varepsilon_F$ finds each
threshold.

| case | $\mu$ 1% | $\mu$ 5% | $U$ 1% | $U$ 5% | $S$ 1% | $S$ 5% | $C_V$ 1% | $C_V$ 5% |
|---|---|---|---|---|---|---|---|---|
| $d = 3$ box | 0.282 | 0.453 | 0.198 | 0.312 | 0.097 | 0.200 | 0.057 | 0.118 |
| $d = 4$ box | 0.325 | >0.60 | 0.176 | 0.285 | 0.077 | 0.171 | 0.045 | 0.098 |
| $d = 5$ box | 0.427 | 0.516 | 0.166 | 0.273 | 0.071 | 0.163 | 0.041 | 0.092 |
| $d = 6$ box | 0.325 | 0.426 | 0.163 | 0.272 | 0.072 | 0.169 | 0.041 | 0.094 |
| trap, $d = 3$ | 0.325 | 0.426 | 0.163 | 0.272 | 0.072 | 0.169 | 0.041 | 0.094 |
| trap, $d = 4$ | 0.294 | 0.377 | 0.187 | 0.306 | 0.104 | 0.241 | 0.059 | 0.137 |
: the value of $T/\varepsilon_F$ where each closed form has a 1 percent and a 5 percent relative error. A value above 0.60 lies outside the scanned range.

The ordering of the four forms is the same for every case. $C_V$ is the strictest, then
$S$, then $U$, then $\mu$. The $T^2$ form is a poor guide for the heat capacity. It passes
1 percent only below $T/\varepsilon_F \approx 0.06$, and the operating points lie at $0.26$
to $0.40$. At the quoted operating points the heat capacity overestimates the exact value
by 18 to 67 percent.

The $d = 6$ box and the $d = 3$ trap give the same numbers in Table 9. Both have
$\alpha = 2$, and the $T^2$ forms depend on $d$ only through $\alpha$ and $g(\varepsilon_F)$.
The relative error depends on $\alpha$ alone.

The dashed curve of Figure 3 has the same problem. At the operating points it returns
$T = 15.490$, $12.649$, $11.397$, $10.764$, $3.976$, and $2.581$. The numeric values are
$17.789$, $14.430$, $12.779$, $11.801$, $4.359$, and $2.690$. The underestimate is 12.9,
12.3, 10.8, 8.8, 8.8, and 4.1 percent. Figure 2 shows how the error grows with $T/\varepsilon_F$.

![Relative error of the Sommerfeld closed forms for $\mu$, $U$, and
$C_V$ versus $T/\varepsilon_F$ for six operating cases at $N = 1000$, from
full Fermi-function integrals at relative tolerance $10^{-12}$. Gray dashed lines
mark 1 percent and 5 percent. The $d = 6$ box and the $d = 3$ trap panels are identical
because both have $\alpha = 2$. The $T^2$ forms fail for $C_V$ well below the
$T/\varepsilon_F \approx 0.26$ to $0.40$ operating points of Section 1.](../figures/sommerfeld_error.png)

## Caloric curves

The caloric curve $T(E)$ for $d = 1, \dots, 6$ shows the dimensional trend. The numeric
curve uses the inversion above. The dashed overlay uses
$T = \sqrt{6(E - E_0)/(\pi^2 g(\varepsilon_F))}$, which is the inversion of the Sommerfeld
$U(T)$.

![Microcanonical caloric curve $T(E)$ for $d = 1,\dots,6$ versus
$E/(N\varepsilon_F)$, with the Sommerfeld result (dashed) at low temperature. These
operating points have $T/\varepsilon_F$ of order 0.3 to 0.4, so the dashed curve is a
leading-order guide.](../figures/caloric_curve.png)

## Chemical potential versus temperature

Figure 4 plots $\mu(T)/\varepsilon_F$ for $d = 1, \dots, 6$. The slope sign follows the
mechanism above: $d = 1$ rises, $d = 2$ is flat, and $d \geq 3$ falls.

![Chemical potential versus temperature at $N = 1000$ and
$V = 100$. The sign of the slope changes with dimension: $d = 1$ rises, $d = 2$ is flat, $d \geq 3$
falls.](../figures/mu_vs_T.png)

# 2. Canonical ensemble: fixed $(N, T, V)$

We now place the gas in contact with a heat bath at the temperature $T = 17.7888$ from
Section 1. The partition function is

$$Z_N = \sum_{\{n_i\},\ \sum_i n_i = N} e^{-\beta \sum_i n_i \varepsilon_i}.$$

A fugacity construction with a saddle point handles $Z_N$, and the mean energy is

$$\langle E \rangle = \sum_i \varepsilon_i f(\varepsilon_i), \qquad
f(\varepsilon) = \frac{1}{e^{(\varepsilon - \mu)/T} + 1},$$

with $\mu$ fixed by $\sum_i f(\varepsilon_i) = N$.

## Canonical check

| case | $\langle E\rangle(T)$ | relative error |
|---|---|---|
| $d = 3$ box | 39981.263022 | 1.82e-16 |
| $d = 4$ box | 39738.353063 | 0.00e+00 |
| $d = 5$ box | 41437.311726 | 0.00e+00 |
| $d = 6$ box | 43927.464662 | 1.66e-16 |
| trap, $d = 3$ | 16225.307666 | 0.00e+00 |
| trap, $d = 4$ | 12559.621673 | 0.00e+00 |
: canonical mean energy at the temperature fixed by Section 1.

The canonical average energy reproduces the microcanonical energy. This happens by
construction, because Section 1 solved for the $(T, \mu)$ pair that satisfies $\langle E\rangle = E$.
The residual is at solver tolerance and it is not evidence of ensemble equivalence. The
evidence is in Section 4.

# 3. Grand canonical ensemble: fixed $(\mu, T, V)$

We open the system to a particle reservoir at the same $(T, \mu)$ from Section 1. With

$$\Xi = \prod_i \left(1 + e^{-\beta(\varepsilon_i - \mu)}\right), \qquad
\langle N \rangle = \sum_i f(\varepsilon_i) = \int_0^\infty g(\varepsilon) f(\varepsilon)\, d\varepsilon,$$

we find:

| case | $\langle N\rangle$ | residual | $\langle E\rangle$ |
|---|---|---|---|
| $d = 3$ box | 1000.000000 | 0.00e+00 | 39981.263022 |
| $d = 4$ box | 1000.000000 | 0.00e+00 | 39738.353063 |
| $d = 5$ box | 1000.000000 | 0.00e+00 | 41437.311726 |
| $d = 6$ box | 1000.000000 | 1.14e-16 | 43927.464662 |
| trap, $d = 3$ | 1000.000000 | 0.00e+00 | 16225.307666 |
| trap, $d = 4$ | 1000.000000 | 1.14e-16 | 12559.621673 |
: grand canonical mean number and mean energy at the $(\mu, T)$ pair fixed by Section 1.

The average particle number matches the microcanonical $N$ at solver tolerance. The same
caveat as in Section 2 applies. Section 1 fixed $\mu$ by the condition $\langle N\rangle = N$,
so this check closes the loop on the solver. The `1.14e-16` value is at the level of
double-precision round-off. It is not exactly zero, and it is not a physical measurement.

# 4. Finite-size differences between the ensembles

Equivalence is a statement about the limit $N \to \infty$ at fixed $n = N/V$. At finite size
the ensembles differ, and the size of the difference is measurable.

## Number fluctuations

In the grand canonical ensemble,

$$\Delta N^2 = \sum_i f_i(1 - f_i) \;\approx\; T\, g(\varepsilon_F)
\quad\Longrightarrow\quad
\frac{\Delta N}{N} \sim \frac{1}{\sqrt{N}} .$$

![Relative number fluctuation $\Delta N/N$ versus $N$ at fixed
$T/\varepsilon_F = 0.1$, for $d = 2, 3, 4, 5, 6$. All follow $N^{-1/2}$ (dashed
reference).](../figures/fluctuation_scaling.png)

A fixed $N$ (microcanonical, canonical) and a fluctuating $N$ (grand canonical) give the
same physics only at small relative fluctuation. The $N^{-1/2}$ suppression supplies that
condition.

## Exact enumeration: four-level 1D box

For a small discrete system we compute all three ensembles exactly with no approximations.
Take spinless fermions on the 1D box levels $\varepsilon \in \{1, 4, 9, 16\}$ with $N = 2$.
The exact microcanonical counts are $\Omega = 1$ for each of $E \in \{5, 10, 13, 17, 20, 25\}$.
Choose $T = 3$, so that $\langle E\rangle_{\text{can}} = 6.437$:

- canonical inversion gives $T = 3.000000$ and $\langle E \rangle = 6.4374$ exactly.
- grand canonical: $\mu = 7.0078$ gives $\langle N \rangle = 2$ exactly, but
  $\langle E \rangle_{\text{gc}} = 7.626 \neq 6.437$, an 18% discrepancy.

This enumeration drops the spin degeneracy $g_s$ for tractability. The counts are smaller
than for a spinful gas. That choice affects the counts. It does not affect the equivalence
question, which rests on the comparison of ensembles at the same $(N, T)$.

The grand canonical ensemble at this $(T, \mu)$ fluctuates into $N = 3, 4$ configurations
with much higher energies. Those states pull its mean energy up. This is **ensemble
non-equivalence at finite size**. The discrepancy decays as the system grows:

![Relative discrepancy between exact grand canonical and
canonical mean energies for 1D boxes with $L$ levels and $N = L/2$, decaying toward zero as
the system grows.](../figures/exact_convergence.png)

# 5. Conclusions

1. We started from fixed $(N, E, V)$ and computed $\Omega$,
   $T = (\partial S/\partial E)^{-1}$, and $\mu = -T\, \partial S/\partial N$
   for a $d$-dimensional Fermi gas up to $d = 6$. We did this numerically and,
   at low $T$, in closed Sommerfeld form for any $d$.
2. Section 1 defines the continuum microcanonical temperature by inversion of
   the canonical mean energy. The canonical and grand canonical results in
   Sections 2 and 3 confirm the operating point of that inversion.
   They show that the solver converges, and they do not show ensemble
   equivalence.
3. Equivalence in the thermodynamic limit rests on checks that stand outside
   that construction. Exact state counting gives $T$ from $\Omega$ alone. The
   exact grand canonical to canonical energy discrepancy decays with system
   size. The number fluctuation scales as $\Delta N/N \sim N^{-1/2}$.
4. The DOS exponent $\alpha$ sets $\varepsilon_F$, sets
   $C_V \propto g(\varepsilon_F)T$, and sets the sign of
   $\partial\mu/\partial T$. It equals $d/2 - 1$ for the box and $d - 1$ for the
   trap. The trap and box exponents coincide when $d_{\text{box}} = 2d$. The
   prefactors differ. The trap matches the power law only. The $d = 4, 5, 6$
   boxes behave qualitatively like $d = 3$ with different $T$, $\mu$, and heat
   capacity. We include them to exercise the general-$d$ forms at $\alpha = 1, 1.5, 2$.
5. The $d = 6$ box and the $d = 3$ trap share $\alpha = 2$. Their entropies agree
   to every printed digit, and their Sommerfeld error tables are identical. So
   the thermal ratios depend on $\alpha$ alone, and the dimension enters only
   through $\alpha$ and $A$.
6. Temperature follows from the state count alone. Exact $\Omega(N, E)$ comes from
   the generator function. It gives $T = (\partial\ln\Omega/\partial E)^{-1}$. At
   the sizes tabulated here that value is within a few percent of the canonical
   value. The Boltzmann and Gibbs entropy definitions differ measurably at finite
   $N$. Beyond $L = 60$ they bracket the canonical value. The energy-window
   estimator sets the offset, and that offset does not shrink with system size.
   These sizes do not demonstrate convergence to a limit.
7. The classical chemical potential is a check and a first value, and it is no
   answer on its own. Its error is 79 percent at $T/\varepsilon_F = 0.05$ and 49
   percent at $T/\varepsilon_F = 0.5$. It passes 1 percent only near
   $T/\varepsilon_F = 5$ at $d = 3$. Higher dimensions converge sooner, because the
   degeneracy parameter falls with $\alpha$.
8. The numerics do not limit any conclusion. Quadrature stays near $10^{-14}$, and
   the root find keeps its residual below $10^{-8}N$. The Sommerfeld truncation is
   the largest error in the report. It reaches 67 percent for $C_V$ at the
   operating points. The closed forms serve there only as a trend.

# Appendix: reproducibility

The Julia package in this repository produces all numbers quoted above. The file
`report/demo_output.txt` holds the transcript, and `report/sommerfeld_scan_output.txt`
holds the validity scan.

- `scripts/verify_equivalence.jl` produces Parts A, A2, A3, B, and C of the
  transcript quoted in Sections 1, 2, 3, and 4. Part A covers $d = 3, 4, 5, 6$.
- `scripts/figures.jl` produces Figures 1 to 6.
- `scripts/sommerfeld_scan.jl` produces the $T/\varepsilon_F$ scan behind the operating-point table,
  the threshold table of Table 9, and verifies $\varepsilon_F$ for each case. It also
  cross-checks every scan point against the package root find.
- `scripts/classical_check.jl` produces Tables 2 and 3, the classical against exact
  comparison.
- `scripts/entropy_conventions.jl` reproduces Part C and adds the extended and
  fixed-$\varepsilon_F$ variants.
- `test/runtests.jl` holds the test suite. It has 7 testsets and 38 executed
  assertions. The suite covers DOS normalization in $d = 1..4$ for box and trap,
  and Sommerfeld against numeric agreement. It also covers fluctuation scaling,
  generating-function against brute-force cross-checks, the exact microcanonical
  temperature, and exact-enumeration ensemble equivalence.

We commit the figures to the repository. Regenerate them, and the transcript,
with:

```
julia --project=. scripts/figures.jl
julia --project=. scripts/verify_equivalence.jl
julia --project=. scripts/sommerfeld_scan.jl
julia --project=. scripts/classical_check.jl
```

The committed `Manifest.toml` records Julia 1.12.7. Use that version or a compatible one.

Render this report from the `report/` directory:

```
pandoc report.md -o report.pdf --pdf-engine=xelatex
```

The repository does not contain a LICENSE file, so it states no license terms.
