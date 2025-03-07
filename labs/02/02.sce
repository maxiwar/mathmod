n=4.9
s=19.5
fi = 3*%pi/4

function dr=f(tetha, r)
    dr = r/sqrt(n*n-1)
endfunction

r0=s/(n+1)
tetha0=0
tetha=0:0.01:2*%pi
r= ode(r0, tetha0, tetha, f)

function xt=f2(t)
    xt = cos(fi)*t
endfunction
t = 0:1:500

plot2d(t, f2(t), style = color('red'))
polarplot(tetha, r, style = color('green'))

r0=s/(n-1)
r= ode(r0, tetha0, tetha, f)
figure()
plot2d(t, f2(t), style = color('red'))
polarplot(tetha, r, style = color('green'))
