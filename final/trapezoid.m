function [intf] = trapezoid(a,b,Ntot)

h = (b-a)/Ntot;

xmesh = (a:h:b);

f = @(x)exp(-x^2)

intf = f(a) + f(b);

for kk=2:length(xmesh)-1
    
    intf = intf + 2*f(xmesh(kk));
    
end

intf = h*intf/2;