1032206558%70+1

using DifferentialEquations
using Plots

n=4.9
s=19.5
fi = 3*pi/4

function f(r,p,t)
    dr=r/sqrt(n^2-1)
    return dr
end

function f2(t)
    xt = tan(fi+pi)*t
    return xt
end

r0 = s/(n+1)

tetha0 = collect(LinRange(0, 2*pi, 1000))
prob = ODEProblem(f, r0, (0, 2*pi))
sol = solve(prob, saveat=tetha0)

t = collect(LinRange(0, 15, 1000))
r1=[]
tetha1=[]
for i in t
    push!(r1, sqrt(i^2+f2(i)^2))
    push!(tetha1, atan(f2(i)/i))
end

plot(sol, proj=:polar, label="катер")
plot!(tetha1, r1, proj=:polar, label="лодка")

savefig("01jl.png")

r0 = s/(n-1)

tetha0 = collect(LinRange(0, 2*pi, 1000))
prob = ODEProblem(f, r0, (0, 2*pi))
sol = solve(prob, saveat=tetha0)

t = collect(LinRange(0, 13, 1000))
r1=[]
tetha1=[]
for i in t
    push!(r1, sqrt(i^2+f2(i)^2))
    push!(tetha1, atan(f2(i)/i))
end

plot(sol, proj=:polar, label="катер")
plot!(tetha1, r1, proj=:polar, label="лодка")

savefig("02jl.png")


