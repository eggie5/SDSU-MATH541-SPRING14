function [px] = neville_non_recurse(x, pts, fpts)

len = length(pts);

for kk=1:len-1
    
    for jj=1:(len-kk)
    
        fpts(jj) = (fpts(jj+1)*(x-pts(jj)) - fpts(jj)*(x-pts(jj+kk)))/(pts(jj+kk) - pts(jj));
            
    end
    
end

px = fpts(1);