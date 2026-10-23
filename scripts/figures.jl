using EnsemblesQuantumGas
using Plots
using Roots: find_zero

figdir = joinpath(@__DIR__, "..", "figures")
mkpath(figdir)

N, V = 1000.0, 100.0

# 1. Caloric curves T(E) for d = 1..4, numeric + Sommerfeld overlay
plt = plot(xlabel="E / N ε_F", ylabel="T / ε_F", title="Microcanonical caloric curve",
           legend=:topleft)
for d in 1:4
    εF = fermi_energy(N, d; V=V)
    E0 = ground_state_energy(N, d; V=V)
    Es = range(1.002 * E0, 3 * E0, length=60)
    Ts_num = [microcanonical_temperature(E, N, d; V=V) for E in Es]
    plot!(plt, Es ./ (N * εF), Ts_num ./ εF, label="d = $d (numeric)")
    Es_low = range(1.002 * E0, 1.3 * E0, length=30)
    Ts_an = [sommerfeld_temperature(E, N, d; V=V) for E in Es_low]
    plot!(plt, Es_low ./ (N * εF), Ts_an ./ εF, ls=:dash, color=:black,
          label=(d == 1 ? "Sommerfeld (all d)" : nothing))
end
savefig(plt, joinpath(figdir, "caloric_curve.png"))

# 2. Chemical potential μ(T) for d = 1..4
plt = plot(xlabel="T / ε_F", ylabel="μ / ε_F", title="Chemical potential", legend=:bottomleft)
for d in 1:4
    εF = fermi_energy(N, d; V=V)
    Tvals = range(0.01, 0.8, length=60) .* εF
    μs = [chemical_potential(T, N, d; V=V) for T in Tvals]
    plot!(plt, Tvals ./ εF, μs ./ εF, label="d = $d")
end
savefig(plt, joinpath(figdir, "mu_vs_T.png"))

# 3. Fluctuation scaling: relative rms ΔN/N vs N at fixed T/ε_F (log-log)
plt = plot(xlabel="N", ylabel="ΔN / N", title="Grand canonical number fluctuations",
           xscale=:log10, yscale=:log10, legend=:bottomleft)
for d in (2, 3, 4)
    Ns = [50.0, 100.0, 300.0, 1000.0, 3000.0, 10000.0]
    fracs = map(Ns) do n
        εF = fermi_energy(n, d; V=V)
        T = 0.1 * εF
        μ = chemical_potential(T, n, d; V=V)
        sqrt(particle_number_variance(T, μ, d; V=V)) / n
    end
    plot!(plt, Ns, fracs, marker=:circle, label="d = $d")
end
plot!(plt, [50.0, 10000.0], 0.03 .* (50.0 ./ [50.0, 10000.0]) .^ 0.5,
      ls=:dash, color=:black, label="∝ N^{-1/2}")
savefig(plt, joinpath(figdir, "fluctuation_scaling.png"))

# 4. Exact enumeration: canonical vs grand canonical discrepancy vs system size
sizes = [4, 6, 8, 10, 12, 14, 16]
discs = map(sizes) do L
    levels = box_levels(1, L)
    Nex = L ÷ 2
    T = 0.5 * L                       # scale T with the level spacing scale
    Ec = exact_canonical_energy(levels, Nex, T)
    μ = find_zero(μ -> exact_grand_particle_number(levels, T, μ) - Nex, (0.0, 3 * L^2))
    Egc = exact_grand_energy(levels, T, μ)
    abs(Egc - Ec) / Ec
end
plt = plot(sizes, discs, marker=:circle, xlabel="number of levels L (N = L/2)",
           ylabel="|⟨E⟩_GC - ⟨E⟩_C| / ⟨E⟩_C", legend=false,
           title="Exact ensemble discrepancy vs system size")
savefig(plt, joinpath(figdir, "exact_convergence.png"))

# 5. Exact microcanonical T from state counting vs canonical T0 (1D trap)
T0 = 4.0
Ls = [10, 16, 22, 30, 40, 60]
Tb_ratio = Float64[]
Tg_ratio = Float64[]
for L in Ls
    levels = collect(0:L)
    Nex = (L + 1) ÷ 2
    counts = omega_counts(levels, Nex)
    Ec = exact_canonical_energy(levels, Nex, T0)
    Estar = argmax(e -> log(Float64(counts[e])) - e / T0, collect(keys(counts)))
    push!(Tb_ratio, microcanonical_temperature_exact(levels, Nex, Estar; window=10) / T0)
    push!(Tg_ratio, microcanonical_temperature_exact(levels, Nex, round(Int, Ec);
                                                     window=10, entropy=:gibbs) / T0)
end
plt = plot(Ls, Tb_ratio, marker=:circle, label="Boltzmann S = ln Ω(E) (at mode E*)",
           xlabel="levels L (N = (L+1)/2)", ylabel="T_micro / T_canonical",
           title="Exact microcanonical temperature vs canonical",
           ylims=(0.7, 1.4), legend=:bottomright)
plot!(plt, Ls, Tg_ratio, marker=:square, label="Gibbs S = ln Σ_{E'≤E} Ω (at mean ⟨E⟩)")
hline!(plt, [1.0], ls=:dash, color=:black, label=nothing)
savefig(plt, joinpath(figdir, "microcanonical_T_convergence.png"))
# 6. Sommerfeld relative error vs T/ε_F for the three operating cases
plt = plot(layout=(1, 3), size=(1500, 430), yscale=:log10,
           xlabel="T / ε_F", ylabel="relative error", legend=:bottomright,
           margin=6Plots.mm, left_margin=12Plots.mm, bottom_margin=10Plots.mm,
           top_margin=6Plots.mm, right_margin=4Plots.mm,
           guidefontsize=10, tickfontsize=8, legendfontsize=8, titlefontsize=11)
cases = (("d = 3 box", 3, (V=V,)), ("d = 4 box", 4, (V=V,)), ("d = 3 trap", 3, (trap=true,)))
for (i, (label, d, kw)) in enumerate(cases)
    εF = fermi_energy(N, d; kw...)
    rs = 10 .^ range(log10(0.01), log10(0.5), length=30)
    errμ, errU, errCV = Float64[], Float64[], Float64[]
    for r in rs
        T = r * εF
        μ = chemical_potential(T, N, d; kw...)
        U = energy_gc(T, μ, d; kw...)
        h = 1e-3 * εF
        CV = (canonical_average_energy(T + h, N, d; kw...) -
              canonical_average_energy(T - h, N, d; kw...)) / (2h)
        push!(errμ, abs(sommerfeld_chemical_potential(T, N, d; kw...) - μ) / abs(μ))
        push!(errU, abs(sommerfeld_energy(T, N, d; kw...) - U) / abs(U))
        push!(errCV, abs(heat_capacity(T, N, d; kw...) - CV) / abs(CV))
    end
    plot!(plt[i], rs, errμ, label="μ", color=1, title=label)
    plot!(plt[i], rs, errU, label="U", color=2, ls=:dash)
    plot!(plt[i], rs, errCV, label="C_V", color=3, ls=:dot)
    hline!(plt[i], [0.01, 0.05], ls=:dash, color=:gray, label=nothing)
end
savefig(plt, joinpath(figdir, "sommerfeld_error.png"))

println("figures written to $figdir")
