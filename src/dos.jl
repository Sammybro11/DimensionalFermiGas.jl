using SpecialFunctions: gamma

"""
    unit_ball_volume(d)

Volume of the unit ball in `d` dimensions, π^(d/2) / Γ(d/2 + 1).
"""
unit_ball_volume(d::Integer) = π^(d / 2) / gamma(d / 2 + 1)

"""
    dos_exponent(d; trap=false)

Exponent α of the density of states g(ε) ∝ ε^α: d/2 - 1 for a box,
d - 1 for a d-dimensional harmonic trap.
"""
dos_exponent(d::Integer; trap::Bool=false, kw...) = trap ? d - 1 : d / 2 - 1

"""
    dos_prefactor(d; V=1.0, spin=2, trap=false)

Prefactor A of the density of states g(ε) = A ε^α.

- Box: A = g_s V Ω_d (d/2) / (2π)^d, from N(ε) = g_s V Ω_d k(ε)^d / (2π)^d
  with k(ε) = √ε (natural units ħ²/2m = 1).
- Harmonic trap: A = g_s / (d-1)!, from N(ε) = g_s ε^d / (d! (ħω)^d)
  (natural units ħω = 1; V is ignored).
"""
function dos_prefactor(d::Integer; V::Real=1.0, spin::Integer=2, trap::Bool=false)
    trap && return spin / factorial(d - 1)
    return spin * V * unit_ball_volume(d) * (d / 2) / (2π)^d
end

"""
    dos(ε, d; V=1.0, spin=2, trap=false)

Density of states g(ε) = A ε^α.
"""
dos(ε::Real, d::Integer; kw...) = dos_prefactor(d; kw...) * ε^dos_exponent(d; kw...)

"""
    fermi_energy(N, d; V=1.0, spin=2, trap=false)

Fermi energy ε_F from N = ∫₀^ε_F g(ε) dε = A ε_F^(α+1) / (α+1).
"""
function fermi_energy(N::Real, d::Integer; kw...)
    α = dos_exponent(d; kw...)
    return (N * (α + 1) / dos_prefactor(d; kw...))^(1 / (α + 1))
end
