function simpson_error

Hvals = (1e-3:1e-3:1e-1)'; % All possible choices of N you will examine.  

error = zeros(length(Hvals),1); % You will store the computed errors here. 
emesh = log10(Hvals); % This is log of all the mesh sizes h.  

NN = length(Hvals);

for jj=1:NN
   
    error(jj) = log10(abs(simpson(0, 2*Hvals(jj), 2) - (exp(2*Hvals(jj))-1) )); % Compute the error by calling your 'simpson' function and comparing it to the exact value.  
    %simpson(0,pi,Nvals(jj) .... exp(pi)-1
end

plot(emesh,error) % Generate the log plot of the error vs. step size.  

slopes = (error(2:NN) - error(1:NN-1))./( emesh(2:NN)-emesh(1:NN-1) ); % Add indices inorder to compute the slope of the error line.

display(max(slopes)); % display the maximum computed slope
display(min(slopes)); % display the minimum computed slope
