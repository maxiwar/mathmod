1032206558%70+1

using Plots
using DifferentialEquations

x0=23450
y0=11250
t0=0
tmax=1

a=0.312
b=0.741
c=0.36
h=0.591

a2=0.355
b2=0.799
c2=0.299
h2=0.566

function P(t)
    return abs(cos(t+2))
end
    
function Q(t)
    return abs(sin(t+2))
end
        
function P2(t)
    return cos(2*t)+1
end

function Q2(t)
    return sin(10*t)+1
end

function syst(dy, y, p, t)
    dy[1] = -a*y[1] - b*y[2] + P(t)
    dy[2] = -c*y[1] - h*y[2] + Q(t)
end

function syst2(dy, y, p, t)
    dy[1] = -a2*y[1] - b2*y[2] + P2(t)
    dy[2] = -c2*y[1]*y[2] - h2*y[2] + Q2(t)
end

u0 = [x0; y0]
tspan = (t0; tmax)
t=collect(LinRange(0, 1, 100))
prob = ODEProblem(syst, u0, tspan)
sol = solve(prob, saveat=t)

prob2 = ODEProblem(syst2, u0, tspan)
sol2 = solve(prob2, saveat=t)

plot(sol)

plot(sol2)


