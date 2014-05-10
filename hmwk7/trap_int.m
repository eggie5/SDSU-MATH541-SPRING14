function [ intf ] = trap_int(a, b, f)

    
    h = (b-a); % Step size.
    
    intf = f(a) + f(b);
    
    intf = h*intf/2;

end

