using QuadGK: quadgk
using Roots: find_zero

"""
    fermi(ε, μ, T)

Fermi-Dirac occupation number. Handles T = 0 as a step function.
"""
function fermi(ε::Real, μ::Real, T::Real)
    T == 0 && return ε < μ ? 1.0 : (ε == μ ? 0.5 : 0.0)
    x = (ε - μ) / T
    x > 40 && return exp(-x)
    return 1 / (exp(x) + 1)
end

"""
    moment(k, T, μ, d; V=1.0, spin=2, trap=false, weight=identity)

Generalized grand canonical moment ∫ ε^k g(ε) w(f(ε)) dε. All grand canonical
averages and variances are special cases.
"""
function moment(k::Real, T::Real, μ::Real, d::Integer;
                V::Real=1.0, spin::Integer=2, trap::Bool=false, weight::Function=identity)
    A = dos_prefactor(d; V=V, spin=spin, trap=trap)
    α = dos_exponent(d; trap=trap)
    g = ε -> A * ε^(α + k) * weight(fermi(ε, μ, T))
    # The Fermi factor varies on a scale ~T around ε = μ. At low T that is far
    # narrower than quadgk's adaptive refinement will find on [0, ∞), so put an
    # explicit node on the Fermi surface; otherwise the integral skips the step.
    μ > 0 ? quadgk(g, 0, μ, Inf)[1] : quadgk(g, 0, Inf)[1]
end

"""Grand canonical ⟨N⟩ = ∫ g(ε) f(ε) dε."""
particle_number(T::Real, μ::Real, d::Integer; kw...) = moment(0, T, μ, d; kw...)

"""Grand canonical ⟨E⟩ = ∫ ε g(ε) f(ε) dε."""
energy_gc(T::Real, μ::Real, d::Integer; kw...) = moment(1, T, μ, d; kw...)

"""Grand canonical variance ΔN² = ∫ g(ε) f(1-f) dε (≈ T g(ε_F) at low T)."""
particle_number_variance(T::Real, μ::Real, d::Integer; kw...) =
    moment(0, T, μ, d; weight=f -> f * (1 - f), kw...)

"""Grand canonical energy variance ΔE² = ∫ ε² g(ε) f(1-f) dε."""
energy_variance(T::Real, μ::Real, d::Integer; kw...) =
    moment(2, T, μ, d; weight=f -> f * (1 - f), kw...)

"""
    chemical_potential(T, N, d; V=1.0, spin=2, trap=false)

Solve ⟨N⟩(T, μ) = N. Seeded from a physics approximation
(`chemical_potential_seed`: Sommerfeld at low T, classical at high T) so the
solver starts near the answer at any temperature and dimension.
"""
function chemical_potential(T::Real, N::Real, d::Integer; kw...)
    εF = fermi_energy(N, d; kw...)

    # Degenerate limit: for T ≪ ε_F the Fermi surface is sharper than float
    # resolution in μ, so ⟨N⟩(μ) is effectively a step and no μ can satisfy the
    # residual tolerance. The exact T → 0 answer is μ = ε_F, so return it.
    T < 1e-10 * εF && return εF

    residual = μ -> particle_number(T, μ, d; kw...) - N
    μ = find_zero(residual, chemical_potential_seed(T, N, d; kw...))

    # Order0 can stop on an x-tolerance before the residual is actually small,
    # so check the physics we care about rather than trusting the solver.
    abs(residual(μ)) <= 1e-8 * N ||
        error("chemical_potential: seed solve did not converge for T=$T, N=$N, d=$d " *
              "(μ=$μ, residual=$(residual(μ)))")
    return μ
end

"""
    entropy(T, μ, d; V=1.0, spin=2, trap=false)

Entropy from S = (U - μN - Ω_gc)/T with the power-law-DOS identity
Ω_gc = -U/(α+1) (for a box α+1 = d/2, recovering PV = 2U/d).
"""
function entropy(T::Real, μ::Real, d::Integer; kw...)
    α = dos_exponent(d; kw...)
    U = energy_gc(T, μ, d; kw...)
    N = particle_number(T, μ, d; kw...)
    return ((1 + 1 / (α + 1)) * U - μ * N) / T
end
