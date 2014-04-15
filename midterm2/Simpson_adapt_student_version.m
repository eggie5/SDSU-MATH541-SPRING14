function [intf] = Simpson_adapt_student_version(a,b,tol,count,Nmax,s0,f)

    global meshpts 
    
    
   
    if(count <= Nmax)
        
        s1 = simpson(a,b,2,f); %s0 
        s2 = simpson(a,(a+b)/2,2,f) + simpson((a+b)/2,b,2,f) ; % Compute next values 
        
        %do I need 1/15 here????
        err = 1/15 * abs(s2-s1); % Compare new to old 
        
        if(err < tol) % Determine if we need to keep going down the tree
            
            intf = s2; % We do not need to go further 
            
            meshpts = [meshpts a (a+b)/2];
            
        else
        
            intf = Simpson_adapt_student_version(a, (a+b)/2, tol/2, count+1, Nmax, s2, f) + ...
                   Simpson_adapt_student_version((a+b)/2, b, tol/2, count+1, Nmax, s2, f); % We do need to go further 
               
        end
        
        
    else
       
        disp('Method did not converge in allowed number of iterations') % Sometimes things don't work out. 
        intf = NaN;
        
    end