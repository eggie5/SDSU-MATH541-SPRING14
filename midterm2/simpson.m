function [intf] = simpson(a,b,Ntot, proc)

% Note, you need to choose Ntot to be even.  

h = (b-a)/Ntot; % Step size.


xmesh = (a:h:b); % Mesh. 

f = proc; % Function you want ot evaluate. 

intf = f(a) + f(b); % Take care of endpoints.  

for kk=2:length(xmesh)-1
    
    if(mod(kk-1,2)==0) % Add logic to determine whether kk-1 is even or odd.  
         % Remember, we need to take one away to start counting relative to zero. 
    
        intf = intf +  2 * f(xmesh(kk)) ;% When kk-1 is even, we do one thing...
        
    else
       
        intf = intf + 4 * f(xmesh(kk)) ; % and when kk-1 is odd, we do another 
        
    end
    
end


intf = h*intf/3;
