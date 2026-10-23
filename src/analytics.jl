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
