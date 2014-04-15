function error_points= spline_quad_error(  )

lambdas=[1 5 10];

% NN = length(Nvals);

len = length(lambdas);
error = zeros(len,1); % You will store the computed errors here.
emesh = lambdas; %log10(pi./Nvals); % This is log of all the mesh sizes h. 
h=.0025;%what should I use for step size?? i just chose really fine

for jj=1:len
    
   f=@(x) sin(lambdas(jj).*x) + cos(lambdas(jj).^2.*x);
   approx = spline_quad(0, 5, h, f)
   actual = integral(f, 0, 5, 'RelTol', 1e-16, 'AbsTol', 1e-16)
   
   error(jj)=abs(approx-actual)
   
   %error(jj) = log10(abs(approx - actual )); % Compute the error by calling your 'simpson' function and comparing it to the exact value.  
    
end

figure
plot(emesh,error, 'o-') % Generate the log plot of the error vs. step size.  

error_points=error;
end

