function [ pn ] = newtonm(f, fp, po, N, TOL )
  
    pn=[];
    i=1;
    while(i<N)
        p = po - f(po)/fp(po);
        pn = [pn p];
        i;
        f(p);
        
        if(abs(p-po) < TOL)
            disp('Found root');
            return
        end
        
       
        i=i+1;
        po=p;
    end
    
    error('The method failed after N iterations');
    N
   

end

