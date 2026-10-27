using DimensionalFermiGas
using Printf

println("=== Part A: continuum ideal Fermi gas ===")
for d in (3, 4)
    N = 1000.0
    V = 100.0
    εF = fermi_energy(N, d; V=V)
    E_micro = 1.5 * ground_state_energy(N, d; V=V)

    T_micro = microcanonical_temperature(E_micro, N, d; V=V)
    μ_micro = microcanonical_chemical_potential(E_micro, N, d; V=V)
    S_micro = microcanonical_entropy(E_micro, N, d; V=V)
    @printf "d = %d  Microcanonical:  E = %.4f  ->  T = %.6f,  μ = %.6f,  S = %.4f\n" d E_micro T_micro μ_micro S_micro

    E_can = canonical_average_energy(T_micro, N, d; V=V)
    @printf "d = %d  Canonical:       ⟨E⟩(T) = %.6f   (match: %.2e relative error)\n" d E_can abs(E_can - E_micro) / E_micro

    N_gc = particle_number(T_micro, μ_micro, d; V=V)
    E_gc = energy_gc(T_micro, μ_micro, d; V=V)
    @printf "d = %d  Grand canonical: ⟨N⟩ = %.6f (match: %.2e),  ⟨E⟩ = %.6f\n" d N_gc abs(N_gc - N) / N E_gc
    println()
end

println("=== Part A2: 3D harmonic trap (N = 1000, ħω = 1) ===")
d, N = 3, 1000.0
E_micro = 1.5 * ground_state_energy(N, d; trap=true)
T_micro = microcanonical_temperature(E_micro, N, d; trap=true)
μ_micro = microcanonical_chemical_potential(E_micro, N, d; trap=true)
@printf "trap d = %d  Microcanonical:  E = %.4f  ->  T = %.6f,  μ = %.6f\n" d E_micro T_micro μ_micro
E_can = canonical_average_energy(T_micro, N, d; trap=true)
N_gc = particle_number(T_micro, μ_micro, d; trap=true)
@printf "trap d = %d  Canonical: ⟨E⟩ = %.6f (match: %.2e),  Grand canonical: ⟨N⟩ = %.6f (match: %.2e)\n" d E_can abs(E_can - E_micro) / E_micro N_gc abs(N_gc - N) / N

println()
println("=== Part A3: low-temperature Fermi-integral point (T/εF = 0.05) ===")
for (label, dd, kw) in (("d = 3", 3, (V=100.0,)), ("d = 4", 4, (V=100.0,)), ("trap d = 3", 3, (trap=true,)))
    εF = fermi_energy(N, dd; kw...)
    T = 0.05 * εF
    μ = chemical_potential(T, N, dd; kw...)
    U = energy_gc(T, μ, dd; kw...)
    S = entropy(T, μ, dd; kw...)
    @printf "%s  Fermi integrals:  T/εF = 0.05  ->  T = %.6f,  μ = %.6f,  U = %.4f,  S = %.4f\n" label T μ U S
end

println()
println("=== Part B: exact small discrete system (1D box, spinless fermions) ===")
levels = box_levels(1, 4)          # 1, 4, 9, 16
Nex = 2
T0 = 3.0
E0 = exact_canonical_energy(levels, Nex, T0)
@printf "Chosen (N, E) = (%d, %.4f) at T = %.3f\n" Nex E0 T0

# microcanonical side: which discrete E values are populated?
for E in sort(unique(configurations(levels, Nex)))
    @printf "  Ω(N=%d, E=%2d) = %d\n" Nex E omega(levels, Nex, E)
end

# canonical check: invert T from E, then recompute ⟨E⟩
using Roots: find_zero
T_back = find_zero(T -> exact_canonical_energy(levels, Nex, T) - E0, (1e-6, 100.0))
E_back = exact_canonical_energy(levels, Nex, T_back)
@printf "Canonical:  T(E) = %.6f,  ⟨E⟩ = %.6f  (match: %.2e)\n" T_back E_back abs(E_back - E0)

# grand canonical check: choose μ so ⟨N⟩ = N, then compare ⟨E⟩
μ_back = find_zero(μ -> exact_grand_particle_number(levels, T_back, μ) - Nex, (0.0, 20.0))
N_gc2 = exact_grand_particle_number(levels, T_back, μ_back)
E_gc2 = exact_grand_energy(levels, T_back, μ_back)
@printf "Grand canonical: μ = %.6f -> ⟨N⟩ = %.6f (match: %.2e),  ⟨E⟩ = %.6f vs canonical %.6f\n" μ_back N_gc2 abs(N_gc2 - Nex) E_gc2 E_back

println()
println("=== Part C: exact microcanonical T from pure state counting (1D trap, ħω = 1) ===")
println("(T from the slope of ln Ω alone, no canonical input; canonical T0 = 4.0)")
T0 = 4.0
for L in (10, 16, 22, 30, 40, 60)
    levels = collect(0:L)
    Nex = (L + 1) ÷ 2
    counts = omega_counts(levels, Nex)
    Ec = exact_canonical_energy(levels, Nex, T0)
    Estar = argmax(e -> log(Float64(counts[e])) - e / T0, collect(keys(counts)))
    Tb = microcanonical_temperature_exact(levels, Nex, Estar; window=10)
    Tg = microcanonical_temperature_exact(levels, Nex, round(Int, Ec); window=10, entropy=:gibbs)
    @printf "L = %2d, N = %2d:  T_boltzmann = %.3f (%+5.1f%%)   T_gibbs = %.3f (%+5.1f%%)\n" L Nex Tb 100 * (Tb - T0) / T0 Tg 100 * (Tg - T0) / T0
end
