ENV["GKSwstype"] = "100"   # headless; avoids the gksqt connection errors

using DimensionalFermiGas
using Plots
using Roots: find_zero
using Printf

# ---------------------------------------------------------------------------
# Alpha convergence: the ensemble gap at fixed ABSOLUTE T, swept over alpha.
#
# Companion to fluctuation_scaling.png. That figure shows Delta N / N ~ N^(-1/2)
# at fixed T/eps_F. This one holds absolute T fixed, so eps_F drifts as N grows
# and the gap inherits the exponent of E(N):
#
#     ( <E>_gc - <E>_N ) / <E>  prop  N^(-p),   p = (alpha+2)/(alpha+1)
#
# Higher alpha means p closer to 1, so higher dimensions converge SLOWER.
#
# Both sides are independent, as in exact_convergence.png:
#   - canonical:  exact_canonical_energy via the many-body recurrence
#   - grand can.: exact_grand_energy at the mu that solves <N> = N
# ---------------------------------------------------------------------------

figdir = joinpath(@__DIR__, "..", "figures")
mkpath(figdir)

# A ladder with g(eps) ~ eps^alpha: the number of levels below eps grows as
# eps^(alpha+1), so level i sits at eps_i = scale * i^(1/(alpha+1)). This
# realizes any alpha on a discrete system, which a real d-dim box cannot do at
# sizes we can still enumerate exactly.
function power_law_levels(alpha::Real, L::Integer, epsF_first::Real, N_first::Integer)
    scale = epsF_first / N_first^(1 / (alpha + 1))
    return [scale * i^(1 / (alpha + 1)) for i in 1:L]
end

L = 1024
Ns = collect(8:2:128)
epsF_first = 20.0          # eps_F at the smallest N, so the gas stays degenerate
T = 0.1 * epsF_first       # ABSOLUTE temperature, identical for every alpha and N

alphas = (0.0, 1.0, 2.0, 3.0)
colors = palette(:viridis, length(alphas))

plt = plot(xlabel = "N", ylabel = "(⟨E⟩_gc − ⟨E⟩_N) / ⟨E⟩",
           title = "Gap at fixed absolute T: higher α, slower decay",
           xscale = :log10, yscale = :log10,
           legend = :bottomleft, legendfontsize = 8,
           left_margin = 12Plots.mm, bottom_margin = 9Plots.mm,
           guidefontsize = 10, tickfontsize = 8)

for (i, alpha) in enumerate(alphas)
    levels = power_law_levels(alpha, L, epsF_first, Ns[1])
    # Bracket mu from the ladder itself. A (0, upper) bracket fails because for
    # large alpha the levels are dense and <N>(mu = 0) already exceeds N.
    μ_lo = minimum(levels) - 40T
    μ_hi = maximum(levels) + 40T

    gaps = Float64[]
    for N in Ns
        Ec = exact_canonical_energy(levels, N, T)
        μ = find_zero(μ -> exact_grand_particle_number(levels, T, μ) - N, (μ_lo, μ_hi))
        push!(gaps, abs(exact_grand_energy(levels, T, μ) - Ec) / Ec)
    end

    p = (alpha + 2) / (alpha + 1)
    xs = log10.(Ns)
    ys = log10.(gaps)
    xbar = sum(xs) / length(xs)
    ybar = sum(ys) / length(ys)
    slope = sum((xs .- xbar) .* (ys .- ybar)) / sum((xs .- xbar) .^ 2)
    @printf "alpha = %.1f  predicted -p = %+.3f  fitted slope = %+.3f\n" alpha -p slope

    plot!(plt, Ns, gaps, marker = :circle, markersize = 3,
          color = colors[i], label = "α = $(alpha)   p = $(round(p, digits=3))")
    # dashed reference carrying the predicted slope, anchored at the smallest N
    plot!(plt, [Ns[1], Ns[end]],
          [gaps[1], gaps[1] * (Ns[end] / Ns[1])^(-p)],
          ls = :dash, color = colors[i], label = nothing)
end

savefig(plt, joinpath(figdir, "alpha_convergence.png"))
println("wrote ", joinpath(figdir, "alpha_convergence.png"))
