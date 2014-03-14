function [coeffs] = divided_diffs(xvec,fvec)

len = length(fvec);

coeffs = zeros(len,1);
table = zeros(len,1);
coeffs(1) = fvec(1);

count = 2;

for i=1:len-1
    
    for j=1:(len-i)
    
        fvec(j) = (fvec(j + 1) - fvec(j))/(xvec(j + i) - xvec(j));
        
        if(j ==1)  
            
            coeffs(count) = fvec(j);
            count=count+1;
        end
        
    end
    
    %count = count + 1;
    
end
