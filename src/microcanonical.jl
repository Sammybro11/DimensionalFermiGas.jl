using Roots: find_zero

"""
    microcanonical_temperature(E, N, d; V=1.0, spin=2, trap=false)

Temperature of an isolated (N, E, V) Fermi gas. In the thermodynamic limit the
microcanonical T = (∂S/∂E)⁻¹ equals the T for which the equilibrium energy is E
(saddle-point equivalence); we invert ⟨E⟩(T, μ(T, N)) = E numerically.
"""
function microcanonical_temperature(E::Real, N::Real, d::Integer; kw...)
    εF = fermi_energy(N, d; kw...)
    E0 = ground_state_energy(N, d; kw...)
    E <= E0 && return 0.0
    find_zero(T -> energy_gc(T, chemical_potential(T, N, d; kw...), d; kw...) - E,
              (1e-12, 20 * (E - E0) / N + εF))
end

"""
    microcanonical_chemical_potential(E, N, d; V=1.0, spin=2, trap=false)

μ = -T ∂S/∂N for the isolated gas, obtained as μ(T(E,N), N).
"""
function microcanonical_chemical_potential(E::Real, N::Real, d::Integer; kw...)
    T = microcanonical_temperature(E, N, d; kw...)
    return chemical_potential(T, N, d; kw...)
end

"""
    microcanonical_entropy(E, N, d; V=1.0, spin=2, trap=false)

S(E, N) at the microcanonical equilibrium point.
"""
function microcanonical_entropy(E::Real, N::Real, d::Integer; kw...)
    T = microcanonical_temperature(E, N, d; kw...)
    μ = chemical_potential(T, N, d; kw...)
    return entropy(T, μ, d; kw...)
end
