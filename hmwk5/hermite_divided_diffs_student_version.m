function [zvec, coeffs] = hermite_divided_diffs_student_version(xvec,fvec,fvecp)

len = 2*length(fvec);
coeffs = zeros(len,1);
coeffs(1) = fvec(1);

zvec = zeros(len,1); % Extended mesh
fvecz = zeros(len,1); % Extended function values 

% Build new mesh and extended fvec 

for kk = 1:length(xvec)
   
    %odds & evens to xvec
    zvec(2*(kk-1)+1) = xvec(kk) ; % You need to put a value of xvec here
    zvec(2*(kk-1)+2) = xvec(kk); % You need to put a value of xvec here

    
    %need to interleave fvec & fvecp into fvecz 
    %odds
    fvecz(2*(kk-1)+1) = fvec(kk);% ( fvec(kk) - fvec(kk-1) ) / ( xvec(kk) - xvec(kk-1) ); % You need to put a value of fvec here
    
    %evens
    fvecz(2*(kk-1)+2) = fvec(kk); % You need to put a value of fvec here
    
end

count = 2;

for kk=1:len-1
    
    for jj=1:(len-kk)
    
        if(kk >1)  % You need to add logic that determines where we are in the divided difference tree
                % and therefore when we need to proceed as usual or worry
                % about using the derivatives of f(x) in order to build the
                % divided difference tree. 
        
            fvecz(jj) = (fvecz(jj + 1) - fvecz(jj))/(zvec(jj + kk) - zvec(jj)); % You need to figure out which values of fvecz and zvec you need.
        
            if(jj == 1) % Add logic that ensures we only save the leftmost members of the divided difference tree. 
            
                coeffs(count) = fvecz(jj);
            
            end
            
        else
           
            if(mod(jj,2)==0) % You need to add logic which determines when you need to use the derivative or use divided differences as usual.  
                          % Remember, mod(jj,2) = 1 or 0 depending on whether jj is odd or even. 
               
                fvecz(jj) = (fvecz(jj +1 ) - fvecz(jj))/(zvec(jj + kk) - zvec(jj)); % You need to figure out which values of fvecz and zvec you need.
        
            else
        
                fvecz(jj) = fvecp((jj + 1)/2); % This is where you need to add your derivative values.  
                                     % Note, you cannot just use fvecp(jj) here since the way you step 
                                     % through fvecz is not the same as you would step through fvecp.  
                                     % You need to take into account that you move
                                     % through two values of jj for every value of
                                     % fvecp you use.  
                
            end
            
            if(jj==1) % Add logic that ensures we only save the leftmost members of the divided difference tree. 
                
                coeffs(count) = fvecz(jj);
                
            end
            
        end
        
    end
    
    count = count + 1;
    
end

