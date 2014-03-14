function newton_solver(p0,tol,N, i)

    % Note, you are supposed to go through and fill in various parts of the
    % code.  

    f = @(x) x-cos(x); % You need to define the function
    fp = @(x) 1+sin(x); % You need to define the derivative of the function 
    pits = []; % This commands allows me to define a variable without assigning anything to it.  
    
    jj=0; %Initialize the iteration counter
    
 
    %plot((-pi:.1:pi),f((-pi:.1:pi))) % Plot your function over the interval [-pi,pi]
    
    while(abs(f(p0)) > tol && jj<=N)

        p0 = p0 - f(p0)/fp(p0); % Standard Newton iteration.  Nothing to see here.  
        
        pits = [pits p0]; % Use pits to store each new iterate. Hint, remember we can always concantenate entries in Matlab, i.e. from array a and array b, we can build array [a b]
        
        jj = jj+1; % You should probably update your iteration counter.
        
    end
    
    disp(['Total number of iterations was: ',num2str(jj)])
    
    if(jj==N+1)
        
        disp('Max no of iterations reached')
        
    else
       pits
       p0
       diff=pits(1:jj-1)  - p0*ones(1,jj-1);
       absv=abs(diff);
       natlgd=log(absv);
       pback=natlgd % Take the log of the absolute value of the difference of the p_(n-1) iterates with the computed root
       
       fdiff=pits(2:jj) - p0*ones(1,jj-1);
       fabs=(abs(fdiff));
       flog=log(fabs);
       pforward = flog % I leave this part for you to figure out.  

       x=pback(1:end-1)
       y=pforward(1:end-1)

       
       alpha= pforward./pback
     
        
     %figure(i),plot(pback,pforward, '-o');
     figure(i+1), plot(absv, fabs, '-o');
        
    end
        
        
end




