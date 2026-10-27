using DimensionalFermiGas
using SpecialFunctions: gamma
using Printf

# Classical (Boltzmann) chemical potential vs the exact Fermi-Dirac value.
# The classical form mu = T ln[N / (A Γ(α+1) T^(α+1))] is exact only for
# T ≫ ε_F. Below that it is a seed for the root find, never an answer.
# This script measures how far off it is, in both regimes.

const N = 1000.0
const V = 100.0
const RATIOS = (0.05, 0.10, 0.30, 0.50, 1.0, 2.0, 5.0, 10.0)

const CASES = (
    ("d=3 box ", 3, (V=V,)),
    ("d=4 box ", 4, (V=V,)),
    ("d=5 box ", 5, (V=V,)),
    ("d=6 box ", 6, (V=V,)),
    ("d=3 trap", 3, (trap=true,)),
    ("d=4 trap", 4, (trap=true,)),
)

println("=== Fermi energy and prefactor at N = 1000 ===")
for (name, d, kw) in CASES
    @printf "%-9s d = %d:  α = %+.1f,  A = %.10g,  ε_F = %.10f,  E₀ = %.4f\n" name d dos_exponent(d; kw...) dos_prefactor(d; kw...) fermi_energy(N, d; kw...) ground_state_energy(N, d; kw...)
end
println()

println("=== Classical μ vs exact Fermi-Dirac μ ===")
println("(exact μ from chemical_potential, a QuadGK root find on ⟨N⟩ = N)")
println("case      T/εF     degeneracy   μ exact      μ classical   rel error")
for (name, d, kw) in CASES
    εF = fermi_energy(N, d; kw...)
    for r in RATIOS
        T = r * εF
        μ_exact = chemical_potential(T, N, d; kw...)
        μ_class = classical_chemical_potential(T, N, d; kw...)
        # degeneracy parameter n λ^d for a power-law DOS, from the classical N
        λd = N / (dos_prefactor(d; kw...) * gamma(dos_exponent(d; kw...) + 1) *
                  T^(dos_exponent(d; kw...) + 1))
        relerr = abs(μ_class - μ_exact) / abs(μ_exact)
        @printf "%-9s %6.2f %12.4e %12.4f %13.4f %10.4f%%\n" name r λd μ_exact μ_class 100 * relerr
    end
    println()
end
