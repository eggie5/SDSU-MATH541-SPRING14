function simpson_error

Nvals = (1e1:1e1:1e3)'; % All possible choices of N you will examine.  

error = zeros(length(Nvals),1); % You will store the computed errors here. 
emesh = log10(pi./Nvals); % This is log of all the mesh sizes h.  

NN = length(Nvals);

for jj=1:NN
   
    error(jj) = log10(abs(simpson(0, pi, Nvals(jj)) - (exp(pi)-1) )); % Compute the error by calling your 'simpson' function and comparing it to the exact value.  
    
end

plot(emesh,error) % Generate the log plot of the error vs. step size.  

slopes = (error() - error())./( emesh()-emesh() ); % Add indices inorder to compute the slope of the error line.

display(max(slopes)); % display the maximum computed slope
display(min(slopes)); % display the minimum computed slope
