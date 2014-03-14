function [ hx ] = hermit_eval( coeffs, zpts, x )

%f[z0] * 1 + f[z0,z1](x-z0) + f[z0,z1,z2](x-z0)(x-z1)...
    
    hx=0; prod=1;
    
    for j = 1:length(zpts)
    
        hx = hx + coeffs(j).*prod;
        
        prod = prod * (x-zpts(j));
        
    end

end

