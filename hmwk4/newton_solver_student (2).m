function newton_solver(p0,tol,N)

    % Note, you are supposed to go through and fill in various parts of the
    % code.  

    f = @(x) ; % You need to define the function
    fp = @(x) ; % You need to define the derivative of the function 
    pits = []; % This commands allows me to define a variable without assigning anything to it.  
    
    jj=0; %Initialize the iteration counter
    
    figure(1)
    
    plot((-pi:.1:pi),f((-pi:.1:pi))) % Plot your function over the interval [-pi,pi]
    
    while(abs(f(p0)) > tol && jj<=N)

        p0 = p0 - f(p0)/fp(p0); % Standard Newton iteration.  Nothing to see here.  
        
        pits = ; % Use pits to store each new iterate. Hint, remember we can always concantenate entries in Matlab, i.e. from array a and array b, we can build array [a b]
        
        jj = ; % You should probably update your iteration counter.
        
    end
    
    disp(['Total number of iterations was: ',num2str(jj)])
    
    if(jj==N+1)
        
        disp('Max no of iterations reached')
        
    else
       
        pback = log(abs(pits(1:jj-1) - p0*ones(1,jj-1))); % Take the log of the absolute value of the difference of the p_(n-1) iterates with the computed root
        pforward = ; % I leave this part for you to figure out.  
        
        figure(2)
        
        plot(pback,pforward)
        
    end
        
        
end

