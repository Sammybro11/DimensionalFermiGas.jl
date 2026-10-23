"""
    canonical_average_energy(T, N, d; V=1.0, spin=2, trap=false)

Canonical ⟨E⟩ at fixed (N, T, V). In the continuum limit this equals the grand
canonical energy evaluated at μ(T, N); exact finite-N canonical sums live in
`exact_counting.jl`.
"""
function canonical_average_energy(T::Real, N::Real, d::Integer; kw...)
    μ = chemical_potential(T, N, d; kw...)
    return energy_gc(T, μ, d; kw...)
end
