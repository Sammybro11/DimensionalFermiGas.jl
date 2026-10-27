using DimensionalFermiGas
using Test
using Combinatorics: binomial

@testset "density of states" begin
    @test unit_ball_volume(2) ≈ π
    @test unit_ball_volume(3) ≈ 4π / 3
    # T = 0 limit: N = A ε_F^(d/2) / (d/2)
    for d in (1, 2, 3, 4)
        N = 500.0
        εF = fermi_energy(N, d)
        @test particle_number(0.0, εF, d) ≈ N rtol = 1e-8
    end
end

@testset "microcanonical-canonical matching (continuum)" begin
    d, N, V = 3, 800.0, 100.0
    εF = fermi_energy(N, d; V=V)
    E = 1.4 * (d / (d + 2)) * N * εF
    T = microcanonical_temperature(E, N, d; V=V)
    μ = microcanonical_chemical_potential(E, N, d; V=V)
    @test canonical_average_energy(T, N, d; V=V) ≈ E rtol = 1e-6
    @test particle_number(T, μ, d; V=V) ≈ N rtol = 1e-6
end

@testset "sommerfeld analytics vs numerics" begin
    d, N, V = 3, 2000.0, 100.0
    εF = fermi_energy(N, d; V=V)
    T = 0.05 * εF   # deep in the degenerate regime
    μ_num = chemical_potential(T, N, d; V=V)
    E_num = energy_gc(T, μ_num, d; V=V)
    @test sommerfeld_chemical_potential(T, N, d; V=V) ≈ μ_num rtol = 1e-3
    @test sommerfeld_energy(T, N, d; V=V) ≈ E_num rtol = 1e-3
    E = 1.05 * ground_state_energy(N, d; V=V)
    @test sommerfeld_temperature(E, N, d; V=V) ≈ microcanonical_temperature(E, N, d; V=V) rtol = 5e-2
end

@testset "fluctuations" begin
    d, N, V = 3, 1000.0, 100.0
    εF = fermi_energy(N, d; V=V)
    T = 0.1 * εF
    μ = chemical_potential(T, N, d; V=V)
    ΔN2 = particle_number_variance(T, μ, d; V=V)
    # low-T result: ΔN² ≈ T g(ε_F)
    @test ΔN2 ≈ T * dos(εF, d; V=V) rtol = 5e-2
    # relative fluctuation vanishes like 1/√N
    @test sqrt(ΔN2) / N < 0.02
    @test energy_variance(T, μ, d; V=V) > 0
end

@testset "harmonic trap" begin
    # trap in d dims has DOS exponent α = d-1, matching a box in 2d dims
    for d in (2, 3)
        ε = 2.5
        @test dos_exponent(d; trap=true) == dos_exponent(2d)
    end
    # T = 0 limit: N = A ε_F^(α+1)/(α+1)
    for d in (1, 2, 3, 4)
        N = 500.0
        εF = fermi_energy(N, d; trap=true)
        @test particle_number(0.0, εF, d; trap=true) ≈ N rtol = 1e-6
        @test ground_state_energy(N, d; trap=true) ≈ (d / (d + 1)) * N * εF
    end
    # Sommerfeld analytics vs numerics in a 3D trap
    d, N = 3, 2000.0
    εF = fermi_energy(N, d; trap=true)
    T = 0.05 * εF
    μ_num = chemical_potential(T, N, d; trap=true)
    @test sommerfeld_chemical_potential(T, N, d; trap=true) ≈ μ_num rtol = 1e-3
    @test sommerfeld_energy(T, N, d; trap=true) ≈ energy_gc(T, μ_num, d; trap=true) rtol = 1e-3
    # three-ensemble matching in the trap
    E = 1.4 * ground_state_energy(N, d; trap=true)
    Tm = microcanonical_temperature(E, N, d; trap=true)
    μm = microcanonical_chemical_potential(E, N, d; trap=true)
    @test canonical_average_energy(Tm, N, d; trap=true) ≈ E rtol = 1e-6
    @test particle_number(Tm, μm, d; trap=true) ≈ N rtol = 1e-6
end

@testset "exact enumeration" begin
    levels = box_levels(1, 4)      # 1, 4, 9, 16
    N = 2
    cfgs = configurations(levels, N)
    @test length(cfgs) == binomial(4, 2)

    # generating-function DP matches brute-force enumeration
    brute = Dict{Int,Int}()
    for E in cfgs
        brute[E] = get(brute, E, 0) + 1
    end
    dp = omega_counts(levels, N)
    @test all(brute[e] == dp[e] for e in keys(brute))
    @test sum(values(dp)) == binomial(4, 2)
    @test omega(levels, N, 5) == 1

    T = 3.0
    # DP canonical energy matches brute-force weighted sum
    brute_E = sum(E -> E * exp(-E / T), cfgs) / sum(E -> exp(-E / T), cfgs)
    @test exact_canonical_energy(levels, N, T) ≈ brute_E rtol = 1e-12
    E = exact_canonical_energy(levels, N, T)
    @test exact_partition(levels, N, T) > 0

    # grand canonical: there exists μ with ⟨N⟩ = N, and ⟨E⟩ is close to canonical
    using Roots: find_zero
    μ = find_zero(μ -> exact_grand_particle_number(levels, T, μ) - N, (0.0, 20.0))
    @test exact_grand_particle_number(levels, T, μ) ≈ N atol = 1e-10
    Egc = exact_grand_energy(levels, T, μ)
    @test abs(Egc - E) / E < 0.25   # O(1) ensemble discrepancy for a 4-level toy
end

@testset "exact microcanonical temperature" begin
    # 1D trap levels 0:L, canonical T0 = 4
    T0 = 4.0
    L, N = 30, 15
    levels = collect(0:L)
    counts = omega_counts(levels, N)
    Ec = exact_canonical_energy(levels, N, T0)
    Estar = argmax(e -> log(Float64(counts[e])) - e / T0, collect(keys(counts)))
    Tb = microcanonical_temperature_exact(levels, N, Estar; window=10)
    Tg = microcanonical_temperature_exact(levels, N, round(Int, Ec); window=10, entropy=:gibbs)
    @test Tb ≈ T0 rtol = 0.05   # Boltzmann, evaluated at the canonical mode E*
    @test Tg ≈ T0 rtol = 0.05   # Gibbs, evaluated at the canonical mean
end
