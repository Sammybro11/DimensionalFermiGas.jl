"""
    ground_state_energy(N, d; V=1.0, spin=2, trap=false)

E₀ = ((α+1)/(α+2)) N ε_F for the T = 0 Fermi sea: d/(d+2) in a box,
d/(d+1) in a harmonic trap.
"""
function ground_state_energy(N::Real, d::Integer; kw...)
    α = dos_exponent(d; kw...)
    return ((α + 1) / (α + 2)) * N * fermi_energy(N, d; kw...)
end

"""
    sommerfeld_chemical_potential(T, N, d; V=1.0, spin=2, trap=false)

Low-T chemical potential, second order in T/ε_F:
μ ≈ ε_F [1 - (π²/6) α (T/ε_F)²], where α is the DOS exponent.
μ is exactly constant to this order whenever the DOS is flat (α = 0: d = 2 box,
d = 1 trap); it rises for α < 0 (d = 1 box) and falls for α > 0.
"""
function sommerfeld_chemical_potential(T::Real, N::Real, d::Integer; kw...)
    εF = fermi_energy(N, d; kw...)
    α = dos_exponent(d; kw...)
    return εF * (1 - (π^2 / 6) * α * (T / εF)^2)
end

"""
    classical_chemical_potential(T, N, d; V=1.0, spin=2, trap=false)

Chemical potential of the *classical* (Boltzmann) ideal gas in `d` dimensions,
from N = A exp(μ/T) T^(α+1) Γ(α+1):

    μ = T ln[ N / (A Γ(α+1) T^(α+1)) ]

Valid only for T ≫ ε_F, where the degeneracy parameter is ≪ 1; there it is large
and negative, and agrees with the true Fermi-Dirac μ. At low T it is wrong by
factors of order ε_F/T, so it must never be used as an answer, only as a seed.
"""
function classical_chemical_potential(T::Real, N::Real, d::Integer; kw...)
    T <= 0 && return fermi_energy(N, d; kw...)
    A = dos_prefactor(d; kw...)
    α = dos_exponent(d; kw...)
    return T * log(N / (A * gamma(α + 1) * T^(α + 1)))
end

"""
    chemical_potential_seed(T, N, d; V=1.0, spin=2, trap=false)

Physics starting guess for the `chemical_potential` root find. Below ε_F/2 the
gas is degenerate and the Sommerfeld expansion applies; above it the gas is
dilute and the classical Boltzmann result applies. Either way the seed is only
a starting point for the solver, not the answer.
"""
function chemical_potential_seed(T::Real, N::Real, d::Integer; kw...)
    εF = fermi_energy(N, d; kw...)
    return T < 0.5 * εF ? sommerfeld_chemical_potential(T, N, d; kw...) :
                          classical_chemical_potential(T, N, d; kw...)
end

"""
    sommerfeld_energy(T, N, d; V=1.0, spin=2, trap=false)

Low-T internal energy: U ≈ E₀ + (π²/6) g(ε_F) T² (valid for any power-law DOS).
"""
function sommerfeld_energy(T::Real, N::Real, d::Integer; kw...)
    εF = fermi_energy(N, d; kw...)
    gF = dos(εF, d; kw...)
    return ground_state_energy(N, d; kw...) + (π^2 / 6) * gF * T^2
end

"""
    sommerfeld_temperature(E, N, d; V=1.0, spin=2, trap=false)

Analytic microcanonical temperature from inverting the Sommerfeld E(T):
T ≈ sqrt(6(E - E₀) / (π² g(ε_F))).
"""
function sommerfeld_temperature(E::Real, N::Real, d::Integer; kw...)
    εF = fermi_energy(N, d; kw...)
    gF = dos(εF, d; kw...)
    E0 = ground_state_energy(N, d; kw...)
    E <= E0 && return 0.0
    return sqrt(6 * (E - E0) / (π^2 * gF))
end

"""
    sommerfeld_entropy(T, N, d; V=1.0, spin=2, trap=false)

S ≈ (π²/3) g(ε_F) T, from C_V = (π²/3) g(ε_F) T with S(0) = 0.
"""
sommerfeld_entropy(T::Real, N::Real, d::Integer; kw...) =
    (π^2 / 3) * dos(fermi_energy(N, d; kw...), d; kw...) * T

"""
    heat_capacity(T, N, d; V=1.0, spin=2, trap=false)

C_V ≈ (π²/3) g(ε_F) T, linear in T for any power-law DOS.
"""
heat_capacity(T::Real, N::Real, d::Integer; kw...) = sommerfeld_entropy(T, N, d; kw...)
