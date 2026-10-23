---
title: "Microcanonical, Canonical, and Grand Canonical Ensembles of an Ideal Fermi Gas in d Dimensions"
author: "Samyak Rai"
date: "October 2026"
geometry: margin=1in
---

# The system

We study a gas of $N$ non-interacting spin-$1/2$ fermions of mass $m$ in a $d$-dimensional
box of volume $V = L^d$, with single-particle energies

$$\varepsilon = \frac{\hbar^2 k^2}{2m}, \qquad k = \frac{2\pi}{L}(n_1, \dots, n_d).$$

## Units

Set $\hbar = 1$ and $m = 1/2$ in the expression above. Then $k = 2\pi n/L$ and $\varepsilon = k^2$.
The trap frequency $\omega$ stays dimensionful, so we measure trap energies in units of
$\hbar\omega$. Set also $k_B = 1$. Entropy is then dimensionless, and temperature carries
units of energy.

## Scope and assumptions

The gas is non-interacting and dilute, and it has one spin-$1/2$ species. Every equivalence
statement in this report holds in the thermodynamic limit. That limit is $N \to \infty$ and $V \to \infty$
at fixed density $n = N/V$.

The report treats a free gas only. Interactions, a magnetic field, a lattice, band
structure, and topology are all outside its scope. We also do not treat the discrete box
degeneracies in canonical or microcanonical form.

## The dimensionality as a parameter

We treat $d$ as a dial. The cases $d = 1, 2, 3$ appear in nanowires, 2DEGs, and ordinary 3D
gases. We include $d = 4$ to exercise the general-$d$ closed forms at $\alpha = 1$. The 3D
harmonic trap, where $\alpha = 2$, already covers the interesting range of $\alpha$
physically.

Synthetic-dimension experiments realize different models. They study lattice systems with
nontrivial topology, such as a quantized 4D Hall response. This report studies a free
continuum gas. Its thermodynamics depend only on $(\alpha, A)$, and topology does not enter.
So $d = 4$ here is not that system.

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

# 1. Microcanonical ensemble: fixed $(N, E, V)$

We *derive* temperature and chemical potential from the entropy:

$$\frac{1}{T} = \frac{\partial S}{\partial E}\bigg|_{N,V}, \qquad
\frac{\mu}{T} = -\frac{\partial S}{\partial N}\bigg|_{E,V}.$$

We use two routes. Exact state counting gives $T$ and $\mu$ from $\Omega$ with no canonical
input. Inversion of the canonical mean energy gives the same quantities as a
thermodynamic-limit convenience.

## Exact state counting from the generating function

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
through 9.5, 3.2, 6.4, 5.0, 1.4, and 1.7 percent. The pattern shows
bracketing in three of six, and no convergence.

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
equivalence. A residual of `0.00e+00` or `1.14e-16` comes from the solver. Construction
forces it to zero.

This report uses three independent checks of equivalence:

1. Exact enumeration of small discrete systems, where we compute all three
   ensembles without approximation (Sections 1 and 4).
2. The finite-size decay of the grand-canonical to canonical energy
   discrepancy (Section 4).
3. The scaling $\Delta N/N \sim N^{-1/2}$ of grand-canonical number
   fluctuations (Section 4).

## Numerical result: continuum, $N = 1000$, box $V = 100$, trap $\hbar\omega = 1$

| case | $E$ | $T$ | $\mu$ | $S$ |
|---|---|---|---|---|
| $d = 3$ box | 39981.2630 | 17.788831 | 37.314588 | 1648.2730 |
| $d = 4$ box | 39738.3531 | 14.429613 | 30.697749 | 2003.5035 |
| trap, $d = 3$ | 16225.3077 | 4.359056 | 10.156130 | n/a |
: microcanonical results at fixed $(N, E, V)$ for $N = 1000$, with no trap entropy in the transcript.

The trap run also reports a canonical mean energy of 16225.307666 with residual 0.00e+00. It also reports a grand canonical mean number of 1000.000000.

The printed precision exceeds the solver tolerance. The value $T = 17.788831$ shows six
printed decimals. We do not know the inversion tolerance to that precision. Read the last
digits as representative only.

A second run uses the Fermi-integral route at fixed $T/\varepsilon_F = 0.05$, which
lies inside the asymptotic regime:

| case | $T$ | $\mu$ | $U$ | $S$ |
|---|---|---|---|---|
| $d = 3$ box | 2.221181 | 44.331938 | 26927.1740 | 246.1235 |
| $d = 4$ box | 1.986918 | 39.574598 | 26817.0495 | 327.6311 |
| trap, $d = 3$ | 0.721125 | 14.303878 | 10993.5053 | 491.0786 |
: results from the Fermi-integral route at fixed $N = 1000$ and $T/\varepsilon_F = 0.05$.

The closed forms agree with the integrals to better than 0.5 percent for $\mu$,
$U$, and $S$ at these temperatures. The heat capacity is the weakest case. Its
error is 0.8 percent for the $d = 3$ box and 1.3 percent for the $d = 4$ box.
For the trap it is 1.5 percent.

### Operating points relative to $\varepsilon_F$

The closed forms above are asymptotic in $T/\varepsilon_F$. We evaluate $\varepsilon_F$ from
the DOS formulas of this report at the quoted operating points. The results are

$$\varepsilon_F = 44.42\ (d=3\ \text{box}), \qquad
\varepsilon_F = 39.74\ (d=4\ \text{box}), \qquad
\varepsilon_F = 14.42\ (\text{trap}, d=3),$$

in the same units as $T$. The corresponding ratios are

$$\frac{T}{\varepsilon_F} \approx 0.40\ (d=3\ \text{box}), \qquad
\frac{T}{\varepsilon_F} \approx 0.36\ (d=4\ \text{box}), \qquad
\frac{T}{\varepsilon_F} \approx 0.30\ (\text{trap}, d=3).$$

These values are not in the asymptotic regime. The table below compares the closed forms
with full Fermi-function integrals along the same $(T, \mu)$ pairs, with a relative
tolerance of $10^{-12}$.

| case | $T/\varepsilon_F$ | $\mu$ | $U$ | $S$ | $C_V$ |
|---|---|---|---|---|---|
| $d = 3$ box | 0.40 | 3.35% | 10.63% | 19.89% | 67.43% |
| $d = 4$ box | 0.36 | 1.37% | 10.04% | 19.25% | 60.33% |
| trap, $d = 3$ | 0.30 | 0.67% | 6.74% | 13.29% | 38.89% |

: relative error of the Sommerfeld closed forms at the operating points above.

The $T^2$ forms reach 1 percent only for $T/\varepsilon_F \lesssim 0.20$ for
$\mu$, $0.15$ for $U$, $0.05$ for $S$, and $0.02$ for $C_V$. They reach 5 percent
only for $0.4$, $0.2$, $0.15$, and $0.05$. At the quoted operating points the heat
capacity overestimates the exact value by more than 60 percent.

The dashed curve of Figure 3 has the same problem. At the three operating points
it returns $T = 15.490$, $12.649$, and $3.976$, against the numeric $T = 17.789$,
$14.430$, and $4.359$. That is 12.9, 12.3, and 8.8 percent low. Figure 2 shows how
the error grows with $T/\varepsilon_F$.

![Relative error of the Sommerfeld closed forms for $\mu$, $U$, and
$C_V$ versus $T/\varepsilon_F$ for the three operating cases at $N = 1000$, from
full Fermi-function integrals at relative tolerance $10^{-12}$. Gray dashed lines
mark 1 percent and 5 percent. The $T^2$ forms fail for $C_V$ well below the
$T/\varepsilon_F \approx 0.3$ to $0.4$ operating points of Section 1.](../figures/sommerfeld_error.png)

## Caloric curves

The caloric curve $T(E)$ for $d = 1, \dots, 4$ shows the dimensional trend. The numeric
curve uses the inversion above. The dashed overlay uses $T = \sqrt{6(E - E_0)/(\pi^2 g(\varepsilon_F))}$,
which is the inversion of the Sommerfeld $U(T)$.

![Microcanonical caloric curve $T(E)$ for $d = 1,\dots,4$ versus
$E/(N\varepsilon_F)$, with the Sommerfeld result (dashed) at low temperature. These
operating points have $T/\varepsilon_F$ of order 0.3 to 0.4, so the dashed curve is a
leading-order guide.](../figures/caloric_curve.png)

## Chemical potential versus temperature

Figure 4 plots $\mu(T)/\varepsilon_F$ for $d = 1, \dots, 4$. The slope sign follows the
mechanism above: $d = 1$ rises, $d = 2$ is flat, and $d \geq 3$ falls.

![Chemical potential versus temperature at $N = 1000$ and
$V = 100$. The sign of the slope changes with dimension: $d = 1$ rises, $d = 2$ is flat, $d \geq 3$
falls.](../figures/mu_vs_T.png)

# 2. Canonical ensemble: fixed $(N, T, V)$

We now place the gas in contact with a heat bath at the temperature $T = 17.7888$ (d=3) from
Section 1. The partition function is

$$Z_N = \sum_{\{n_i\},\ \sum_i n_i = N} e^{-\beta \sum_i n_i \varepsilon_i}.$$

A fugacity construction with a saddle point handles $Z_N$, and the mean energy is

$$\langle E \rangle = \sum_i \varepsilon_i f(\varepsilon_i), \qquad
f(\varepsilon) = \frac{1}{e^{(\varepsilon - \mu)/T} + 1},$$

with $\mu$ fixed by $\sum_i f(\varepsilon_i) = N$.

## Canonical check

| case | $\langle E\rangle(T)$ | relative error |
|---|---|---|
| $d = 3$ box | 39981.263022 | 0.00e+00 |
| $d = 4$ box | 39738.353063 | 0.00e+00 |
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
| $d = 3$ box | 1000.000000 | 1.14e-16 | 39981.263022 |
| $d = 4$ box | 1000.000000 | 1.14e-16 | 39738.353063 |
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
$T/\varepsilon_F = 0.1$, for $d = 2, 3, 4$. All follow $N^{-1/2}$ (dashed
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
   for a $d$-dimensional Fermi gas. We did this numerically and, at low $T$, in
   closed Sommerfeld form for any $d$.
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
   prefactors differ. The trap matches the power law only. The $d = 4$
   box behaves qualitatively like $d = 3$ with different $T$, $\mu$, and heat
   capacity. We include it to exercise the general-$d$ forms at $\alpha = 1$.
5. Temperature follows from state counting alone. Exact $\Omega(N, E)$ comes from
   the generating function. It gives $T = (\partial\ln\Omega/\partial E)^{-1}$. At
   the sizes tabulated here that value is within a few percent of the canonical
   value. The Boltzmann and Gibbs entropy definitions differ measurably at finite
   $N$. Beyond $L = 60$ they bracket the canonical value. The energy-window
   estimator sets the offset, and that offset does not shrink with system size.
   These sizes do not
   demonstrate convergence to a limit.

# Appendix: reproducibility

The Julia package in this repository produces all numbers quoted above. The file
`report/demo_output.txt` holds the transcript.

- `scripts/verify_equivalence.jl` produces Parts A, A2, A3, B, and C of the
  transcript quoted in Sections 1, 2, 3, and 4.
- `scripts/figures.jl` produces Figures 1 to 6.
- `scripts/sommerfeld_scan.jl` produces the $T/\varepsilon_F$ scan behind the operating-point table
  and the operating-point errors, and verifies $\varepsilon_F$ for each case.
- `scripts/entropy_conventions.jl` reproduces Part C and adds the extended and
  fixed-$\varepsilon_F$ variants.
- `test/runtests.jl` holds the test suite. It has 7 testsets and 28 `@test`
  declarations, which expand to 38 executed assertions. The suite covers DOS
  normalization in $d = 1..4$ for box and trap, and Sommerfeld against numeric
  agreement. It also covers fluctuation scaling, generating-function against
  brute-force cross-checks, the exact microcanonical temperature, and
  exact-enumeration ensemble equivalence.

We commit the figures to the repository. Regenerate them, and the transcript,
with:

```
julia --project=. scripts/figures.jl
julia --project=. scripts/verify_equivalence.jl
```

The committed `Manifest.toml` records Julia 1.12.7. Use that version or a compatible one.

Render this report from the `report/` directory:

```
pandoc report.md -o report.pdf --pdf-engine=xelatex
```

The repository does not contain a LICENSE file, so it states no license terms.
