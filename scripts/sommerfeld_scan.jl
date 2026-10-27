using DimensionalFermiGas
using QuadGK: quadgk
using Roots: find_zero
using Printf

# Sommerfeld validity scan: full Fermi-function integrals vs the closed forms
# in src/analytics.jl, for the operating cases quoted in the report.
# Integrals use QuadGK with rtol = 1e-12, atol = 0 (state: rtol=1e-12).
# C_V is a 5-point central difference of the numeric U(T) at fixed N, step h = 1e-4 εF.

const RTOL = 1e-12
const HSTEP = 1e-4

function n_particles(T, μ, d; kw...)
    A = dos_prefactor(d; kw...)
    α = dos_exponent(d; kw...)
    g(ε) = A * ε^α / (exp((ε - μ) / T) + 1)
    # Split at μ so the Fermi edge is resolved; state tolerance rtol=1e-12.
    # Only split when μ > 0, the same guard as src/grandcanonical.jl: for
    # μ < 0 the split point lies outside [0, ∞) and reverses the interval.
    μ > 0 ? quadgk(g, 0, μ, Inf; rtol=RTOL, atol=0)[1] :
             quadgk(g, 0, Inf; rtol=RTOL, atol=0)[1]
end

function u_energy(T, μ, d; kw...)
    A = dos_prefactor(d; kw...)
    α = dos_exponent(d; kw...)
    g(ε) = A * ε^(α + 1) / (exp((ε - μ) / T) + 1)
    μ > 0 ? quadgk(g, 0, μ, Inf; rtol=RTOL, atol=0)[1] :
             quadgk(g, 0, Inf; rtol=RTOL, atol=0)[1]
end

chemical_potential_num(T, N, d; kw...) = find_zero(μ -> n_particles(T, μ, d; kw...) - N,
                                                bracket_n_particles(T, N, d; kw...))

# Bracket for ⟨N⟩(μ) = N. The bracket must reach negative μ: at high T the
# classical result μ = T ln(...) is large and negative. Start at μ = 0 and
# double the lower limit until the residual changes sign.
function bracket_n_particles(T, N, d; kw...)
    f = μ -> n_particles(T, μ, d; kw...) - N
    εF = fermi_energy(N, d; kw...)
    hi = 2 * εF + 10 * T
    lo = 0.0
    for _ in 1:80
        f(lo) < 0 && return (lo, hi)
        lo = lo == 0.0 ? -εF : 2 * lo
    end
    error("bracket_n_particles: no bracket found for T=$T, N=$N, d=$d")
end

# S = (U - μN + PV)/T with PV = U/(α+1) for a power-law DOS
function entropy_num(T, μ, N, d; kw...)
    α = dos_exponent(d; kw...)
    U = u_energy(T, μ, d; kw...)
    return ((1 + 1 / (α + 1)) * U - μ * N) / T
end

function u_of_T(T, N, d; kw...)
    μ = chemical_potential_num(T, N, d; kw...)
    return u_energy(T, μ, d; kw...)
end

const CASES = (
    ("d=3 box ", 3, (V=100.0,)),
    ("d=4 box ", 4, (V=100.0,)),
    ("d=5 box ", 5, (V=100.0,)),
    ("d=6 box ", 6, (V=100.0,)),
    ("d=3 trap", 3, (trap=true,)),
    ("d=4 trap", 4, (trap=true,)),
)
const RATIOS = (0.02, 0.05, 0.10, 0.15, 0.20, 0.30, 0.40)

N = 1000.0
println("=== Fermi energies from dos_prefactor / fermi_energy (N = 1000) ===")
for (name, d, kw) in CASES
    @printf "%-9s d = %d:  α = %.1f,  A = %.10g,  ε_F = %.10f\n" name d dos_exponent(d; kw...) dos_prefactor(d; kw...) fermi_energy(N, d; kw...)
end
println()

for (name, d, kw) in CASES
    εF = fermi_energy(N, d; kw...)
    α = dos_exponent(d; kw...)
    E0 = ground_state_energy(N, d; kw...)
    gF = dos(εF, d; kw...)
    @printf "=== %s  ε_F = %.6f,  E₀ = %.4f,  g(ε_F) = %.6f ===\n" name εF E0 gF
    @printf "%6s %12s %12s %9s %12s %12s %9s %12s %12s %9s %12s %12s %9s\n" "T/εF" "μ num" "μ Som" "rel err" "U num" "U Som" "rel err" "S num" "S Som" "rel err" "C_V num" "C_V Som" "rel err"
    for r in RATIOS
        T = r * εF
        μ = chemical_potential_num(T, N, d; kw...)
        U = u_energy(T, μ, d; kw...)
        S = entropy_num(T, μ, N, d; kw...)
        h = HSTEP * εF
        CV = (-u_of_T(T + 2h, N, d; kw...) + 8u_of_T(T + h, N, d; kw...) -
              8u_of_T(T - h, N, d; kw...) + u_of_T(T - 2h, N, d; kw...)) / (12h)

        μs = sommerfeld_chemical_potential(T, N, d; kw...)
        Us = sommerfeld_energy(T, N, d; kw...)
        Ss = sommerfeld_entropy(T, N, d; kw...)
        CVs = heat_capacity(T, N, d; kw...)

        @printf "%6.2f %12.6f %12.6f %8.2f%% %12.4f %12.4f %8.2f%% %12.4f %12.4f %8.2f%% %12.5f %12.5f %8.2f%%\n" r μ μs 100*abs(μs-μ)/abs(μ) U Us 100*abs(Us-U)/abs(U) S Ss 100*abs(Ss-S)/abs(S) CV CVs 100*abs(CVs-CV)/abs(CV)
    end
    println()
end

# Operating points quoted in the report: T from the microcanonical inversion at
# E = 1.5 E0, compared with the Sommerfeld closed forms at that same T.
println("=== Sommerfeld error at the report's quoted operating points ===")
println("(T = microcanonical_temperature(1.5 E0, N, d))")
println("case        T/εF      μ num      μ Som   rel err     U num     U Som   rel err     S num     S Som   rel err   C_V num   C_V Som   rel err")
for (name, d, kw) in CASES
    εF = fermi_energy(N, d; kw...)
    T = microcanonical_temperature(1.5 * ground_state_energy(N, d; kw...), N, d; kw...)
    μ = chemical_potential_num(T, N, d; kw...)
    U = u_energy(T, μ, d; kw...)
    S = entropy_num(T, μ, N, d; kw...)
    h = HSTEP * εF
    CV = (-u_of_T(T + 2h, N, d; kw...) + 8u_of_T(T + h, N, d; kw...) -
          8u_of_T(T - h, N, d; kw...) + u_of_T(T - 2h, N, d; kw...)) / (12h)
    μs = sommerfeld_chemical_potential(T, N, d; kw...)
    Us = sommerfeld_energy(T, N, d; kw...)
    Ss = sommerfeld_entropy(T, N, d; kw...)
    CVs = heat_capacity(T, N, d; kw...)
    @printf "%-9s %8.4f %10.5f %10.5f %8.2f%% %10.3f %10.3f %8.2f%% %9.3f %9.3f %8.2f%% %9.4f %9.4f %8.2f%%\n" name T/εF μ μs 100*abs(μs-μ)/abs(μ) U Us 100*abs(Us-U)/abs(U) S Ss 100*abs(Ss-S)/abs(S) CV CVs 100*abs(CVs-CV)/abs(CV)
end

# Where does each closed form cross a given relative-error level? The errors are
# monotonic in T/εF, so a bisection finds the crossing. This quotes the regime
# where the T^2 forms hold to 1 percent and to 5 percent.
function errors_at(r, N, d; kw...)
    T = r * fermi_energy(N, d; kw...)
    h = HSTEP * fermi_energy(N, d; kw...)
    μ = chemical_potential_num(T, N, d; kw...)
    U = u_energy(T, μ, d; kw...)
    S = entropy_num(T, μ, N, d; kw...)
    CV = (-u_of_T(T + 2h, N, d; kw...) + 8u_of_T(T + h, N, d; kw...) -
          8u_of_T(T - h, N, d; kw...) + u_of_T(T - 2h, N, d; kw...)) / (12h)
    return (
        μ = abs(sommerfeld_chemical_potential(T, N, d; kw...) - μ) / abs(μ),
        U = abs(sommerfeld_energy(T, N, d; kw...) - U) / abs(U),
        S = abs(sommerfeld_entropy(T, N, d; kw...) - S) / abs(S),
        CV = abs(heat_capacity(T, N, d; kw...) - CV) / abs(CV),
    )
end

function crossing(key, level, N, d; kw...)
    f = r -> getproperty(errors_at(r, N, d; kw...), key) - level
    lo, hi = 0.005, 0.60
    f(hi) < 0 && return "    >0.60"
    for _ in 1:40
        mid = (lo + hi) / 2
        f(mid) < 0 ? (lo = mid) : (hi = mid)
    end
    return @sprintf "%8.3f" (lo + hi) / 2
end

println("=== T/εF where each closed form reaches 1 percent and 5 percent ===")
println("case        μ 1%     μ 5%     U 1%     U 5%     S 1%     S 5%   C_V 1%   C_V 5%")
for (name, d, kw) in CASES
    println(join([@sprintf("%-9s", name),
                  crossing(:μ, 0.01, N, d; kw...), crossing(:μ, 0.05, N, d; kw...),
                  crossing(:U, 0.01, N, d; kw...), crossing(:U, 0.05, N, d; kw...),
                  crossing(:S, 0.01, N, d; kw...), crossing(:S, 0.05, N, d; kw...),
                  crossing(:CV, 0.01, N, d; kw...), crossing(:CV, 0.05, N, d; kw...)], " "))
end
