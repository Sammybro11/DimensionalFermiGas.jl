using Combinatorics: combinations
using Base.Iterators: product

"""
    box_levels(d, nmax; spin=1)

Single-particle levels ε = n₁² + ⋯ + n_d² (n_i = 1..nmax) of a d-dimensional box,
one entry per state including degeneracies. `spin` copies each orbital level.
Keep this small if used with `configurations`: enumeration is exponential in N.
"""
function box_levels(d::Integer, nmax::Integer; spin::Integer=1)
    orbitals = [sum(abs2, n) for n in product(ntuple(_ -> 1:nmax, d)...)]
    return repeat(sort(vec(orbitals)), spin)
end

"""
    configurations(levels, N)

All ways to occupy N of the given levels (spinless fermions), as energy sums.
Enumeration is exponential in N; use it only for tiny systems and for
cross-checking the generating-function routines below.
"""
function configurations(levels::AbstractVector, N::Integer)
    return [sum(c) for c in combinations(levels, N)]
end

"""
    omega_counts(levels, N)

Dict mapping total energy E to the exact microcanonical count Ω(N, E), computed
with the generating function ∏ᵢ (1 + z x^εᵢ): exact for any system size.
"""
function omega_counts(levels::AbstractVector, N::Integer)
    sorted = sort(levels)
    Emax = sum(last(sorted, N))
    dp = zeros(BigInt, N + 1, Emax + 1)
    dp[1, 1] = 1
    for ε in sorted
        for n in N:-1:1
            for e in 0:(Emax - ε)
                dp[n + 1, e + ε + 1] += dp[n, e + 1]
            end
        end
    end
    return Dict(e - 1 => dp[N + 1, e] for e in 1:(Emax + 1) if dp[N + 1, e] > 0)
end

"""
    omega(levels, N, E)

Exact microcanonical count Ω(N, E).
"""
omega(levels::AbstractVector, N::Integer, E::Real) =
    get(omega_counts(levels, N), Int(E), zero(BigInt))

"""
    exact_partition(levels, N, T)

Exact canonical partition function Z_N(T) via the generating-function
recurrence: stable at low T and polynomial in the number of levels.
"""
function exact_partition(levels::AbstractVector, N::Integer, T::Real)
    Z, _ = canonical_sums(levels, N, T)
    return Z
end

"""
    exact_canonical_energy(levels, N, T)

Exact canonical ⟨E⟩ = Σ E e^{-E/T} / Z_N via the same recurrence.
"""
function exact_canonical_energy(levels::AbstractVector, N::Integer, T::Real)
    _, Eavg = canonical_sums(levels, N, T)
    return Eavg
end

# Recurrence over levels: Z'_n = Z_n + w Z_{n-1} and likewise for the
# energy-weighted sum EZ, with w = exp(-(ε-ε̄)/T) relative to the per-particle
# ground level ε̄, so full N-particle weights stay ≤ 1. Partial configurations
# can still exceed Float64 range at ultra-low T, so we switch to BigFloat when
# the dynamic range N·(level spread)/T demands it.
function canonical_sums(levels::AbstractVector, N::Integer, T::Real)
    ε̄ = sum(partialsort(levels, 1:N)) / N
    spread = maximum(levels) - minimum(levels)
    F = N * spread / T > 1000 ? BigFloat : Float64
    Z = zeros(F, N + 1)
    EZ = zeros(F, N + 1)
    Z[1] = 1
    for ε in levels
        w = exp((ε̄ - ε) / F(T))
        for n in N:-1:1
            EZ[n + 1] += w * (EZ[n] + (ε - ε̄) * Z[n])
            Z[n + 1] += w * Z[n]
        end
    end
    Eavg = Float64(EZ[N + 1] / Z[N + 1]) + N * ε̄
    Ztrue = Float64(Z[N + 1] * exp(-N * ε̄ / F(T)))
    return Ztrue, Eavg
end

"""
    exact_grand_particle_number(levels, T, μ)

Exact grand canonical ⟨N⟩ = Σᵢ f(εᵢ) over the discrete levels.
"""
exact_grand_particle_number(levels::AbstractVector, T::Real, μ::Real) =
    sum(ε -> fermi(ε, μ, T), levels)

"""
    exact_grand_energy(levels, T, μ)

Exact grand canonical ⟨E⟩ = Σᵢ εᵢ f(εᵢ) over the discrete levels.
"""
exact_grand_energy(levels::AbstractVector, T::Real, μ::Real) =
    sum(ε -> ε * fermi(ε, μ, T), levels)

"""
    microcanonical_temperature_exact(levels, N, E; window=4, entropy=:boltzmann)

Microcanonical temperature of a small discrete system, 1/T = ∂S/∂E, estimated
by a local least-squares fit of the entropy over the `window` nearest occupied
energies on each side of E. `entropy = :boltzmann` uses S = ln Ω(E);
`:gibbs` uses S = ln Σ_{E'≤E} Ω(E'). The two agree only for large systems.
"""
function microcanonical_temperature_exact(levels::AbstractVector, N::Integer, E::Real;
                                          window::Integer=4, entropy::Symbol=:boltzmann)
    counts = omega_counts(levels, N)
    Es = sort!(collect(keys(counts)))
    S = entropy === :gibbs ? cumsum([counts[e] for e in Es]) : [counts[e] for e in Es]
    i = argmin(abs.(Es .- E))
    lo = max(1, i - window)
    hi = min(length(Es), i + window)
    xs = Float64.(Es[lo:hi])
    ys = log.(Float64.(S[lo:hi]))
    x̄ = sum(xs) / length(xs)
    ȳ = sum(ys) / length(ys)
    β = sum((xs .- x̄) .* (ys .- ȳ)) / sum((xs .- x̄) .^ 2)
    return 1 / β
end
