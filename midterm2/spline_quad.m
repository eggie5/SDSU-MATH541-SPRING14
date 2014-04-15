function [ intf ] = spline_quad(aa,bb, dx ,f)

    interp_mesh = aa:dx:bb; % Interpolatory mesh
    %fine_mesh = 0:.05:1; % Fine mesh used for error analysis 

    %f = @(x) exp(x); % Put in the function you want to approximate here.  

    [a,b,c,d] = cubic_spline(interp_mesh,f(interp_mesh)); % Compute the coefficients used in the spline approximation.
    
    %iterate over spline interp. points
    
    running_sum =0;
    for j=1:length(interp_mesh)-1
        h= interp_mesh(j+1) - interp_mesh(j);
        sum=a(j)*h + b(j)/2 *h^2 + c(j)/3 *h^3 + d(j)/4 *h^4;
        running_sum=running_sum+sum;
    end

    intf=running_sum;
end

