function gauss_integrator_legendre

% f = @(xx) (1+xx.^2).^(-1);
f = @(x)exp(x.^2).*cos(x).^2;

exact = .774294

Nvals = (0:.01:4)';
errors = zeros(length(Nvals),1);

for mm=1:length(Nvals)
    
    [nodes,weights] = gauss_legendre(Nvals(mm));
  
    approx=weights*f(nodes)
    errors(mm) = ( abs(  approx - exact ) );
    
end

plot(Nvals,errors)