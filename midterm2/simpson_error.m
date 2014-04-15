function error_points= simpson_error

% Nvals = (1e1:1e1:1e3)'; % All possible choices of N you will examine.  
% 

 

lambdas=[1 5 10];

% NN = length(Nvals);

len = length(lambdas);
error = zeros(len,1); % You will store the computed errors here.
emesh = lambdas; %log10(pi./Nvals); % This is log of all the mesh sizes h. 
nvals=100;%simpson nvals, ask teacher what to set for these

for jj=1:len
    
   f=@(x) sin(lambdas(jj).*x) + cos(lambdas(jj).^2.*x);
   approx = simpson(0, 5, nvals, f)
   actual = integral(f, 0, 5, 'RelTol', 1e-16, 'AbsTol', 1e-16)
   
   error(jj)=abs(approx-actual)
   
   %error(jj) = log10(abs(approx - actual )); % Compute the error by calling your 'simpson' function and comparing it to the exact value.  
    
end

figure
plot(emesh,error, 'o-') % Generate the log plot of the error vs. step size.  

error_points=error;

% 
% slopes = (error() - error())./( emesh()-emesh() ); % Add indices inorder to compute the slope of the error line.
% 
% display(max(slopes)); % display the maximum computed slope
% display(min(slopes)); % display the minimum computed slope
