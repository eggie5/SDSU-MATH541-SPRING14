function intf = quick_simpson(a,b,Ntot)

% Note, you need to choose Ntot to be even.  
h = (b-a)/Ntot;

xmesh = (a:h:b); % Mesh. 

f = @(x)exp(-x.^2) % Function you want to evaluate. 

intf = h*(f(a) + f(b) + 4*sum(f(xmesh(2:2:Ntot))) + 2*sum(f(xmesh(3:2:Ntot-1))))/3;