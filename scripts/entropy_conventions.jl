using EnsemblesQuantumGas
using Printf

# Task 2: Boltzmann S = ln Ω(E*) vs Gibbs S = ln Σ_{E'≤E} Ω(E') for a 1D
# harmonic trap with levels 0..L. Reproduces the table in report.md Part C and
# extends it, then repeats it at fixed N (fixed ε_F), where "relative to T0"
# is a fixed baseline.

const T0 = 4.0
const WINDOW = 10

function row(L, N)
    levels = collect(0:L)
    counts = omega_counts(levels, N)
    Ec = exact_canonical_energy(levels, N, T0)
    Es = sort!(collect(keys(counts)))
    Estar = argmax(e -> log(Float64(counts[e])) - e / T0, Es)
    Tb = microcanonical_temperature_exact(levels, N, Estar; window=WINDOW)
    Tg = microcanonical_temperature_exact(levels, N, round(Int, Ec); window=WINDOW,
                                           entropy=:gibbs)
    return Tb, Tg, Ec, Estar
end

function table(Ls; fixed_N=nothing)
    n_bracket = 0
    for L in Ls
        N = fixed_N === nothing ? (L + 1) ÷ 2 : fixed_N
        Tb, Tg, Ec, Estar = row(L, N)
        # strict bracketing: one convention above T0, the other below
        sign((Tb - T0)) != sign((Tg - T0)) && (n_bracket += 1)
        @printf "L = %2d, N = %2d:  T_boltzmann = %.3f (%+5.1f%%)   T_gibbs = %.3f (%+5.1f%%)\n" L N Tb 100 * (Tb - T0) / T0 Tg 100 * (Tg - T0) / T0
    end
    @printf "straddles T0 in %d of %d rows\n" n_bracket length(Ls)
end

println("=== Variant A (as in report.md): N = (L+1)/2, T0 = 4, ε_F ≈ N varies ===")
tA = @elapsed table((10, 16, 22, 30, 40, 60))
println()

function table_extended(Ls)
    n = 0
    for L in Ls
        N = (L + 1) ÷ 2
        Tb, Tg, Ec, Estar = row(L, N)
        sign((Tb - T0)) != sign((Tg - T0)) && (n += 1)
        εF = fermi_energy(N, 1; trap=true, spin=1)  # spinless levels 0..L
        @printf "L = %3d, N = %3d:  ε_F = %5.1f  T0/ε_F = %.3f  T_boltzmann = %.4f (%+6.2f%%)  T_gibbs = %.4f (%+6.2f%%)  E* = %d, ⟨E⟩ = %.2f\n" L N εF T0 / εF Tb 100 * (Tb - T0) / T0 Tg 100 * (Tg - T0) / T0 Estar Ec
    end
    @printf "straddles T0 in %d of %d rows\n" n length(Ls)
end

println("=== Variant A extended: L to 120, with ε_F = N and T0/ε_F per row ===")
LsExt = (10, 16, 22, 30, 40, 60, 80, 100, 120)
tA2 = @elapsed table_extended(LsExt)
println()

println("=== Variant B (clean): N = 30 fixed, so ε_F = 30 and T0/ε_F = 0.133; vary L ===")
# L = 30 is skipped: with N = L there is one hole and ln Ω has zero slope.
tB = @elapsed table((40, 60, 80, 100, 120); fixed_N=30)
println()

@printf "runtime: variant A (6 rows) %.2f s, extended (9 rows) %.2f s, fixed-N (5 rows) %.2f s\n" tA tA2 tB