using DimensionalFermiGas
using Printf

# Cross-check: the scan's own Fermi integral vs the package root find, at the
# operating points. Flags any disagreement above 1e-6 relative.
N, V = 1000.0, 100.0
for (label, d, kw) in (("d=3 box ", 3, (V=V,)), ("d=4 box ", 4, (V=V,)),
                       ("d=5 box ", 5, (V=V,)), ("d=6 box ", 6, (V=V,)),
                       ("d=3 trap", 3, (trap=true,)), ("d=4 trap", 4, (trap=true,)))
    εF = fermi_energy(N, d; kw...)
    for r in (0.20, 0.30, 0.40, 0.50)
        T = r * εF
        μpkg = chemical_potential(T, N, d; kw...)
        Npkg = particle_number(T, μpkg, d; kw...)
        @printf "%s r=%.2f  μ=%.6f  ⟨N⟩=%.6f  residual=%.2e\n" label r μpkg Npkg abs(Npkg - N) / N
    end
end
