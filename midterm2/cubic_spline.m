function [a,b,c,d] = cubic_spline(xvec,fvec)

    xvec = xvec'; fvec = fvec'; % Store everything in column format. 

    len = length(xvec);

    a = fvec(1:len-1);
    
    steps = xvec(2:len) - xvec(1:len-1);
    
    fdif = 3.*( ( fvec(3:len) - fvec(2:len-1) )./steps(2:len-1) - ...
                ( fvec(2:len-1) - fvec(1:len-2) )./steps(1:len-2) );
            
    Hmat = spdiags(steps(1:len-2)+steps(2:len-1),0,len-2,len-2) + ...
           spdiags(steps(1:len-2),1,len-2,len-2);
       
    Hmat = Hmat + Hmat';
    
    c = Hmat\fdif; % Find c_1 through c_(n-1)
    c = [0;c]; % Append c_0 = 0
    
    d = (c(2:len-1)-c(1:len-2))./(3.*steps(1:len-2));  % Find d_0 through d_(n-2)
    d = [d; -c(len-1)/(3*steps(len-1))]; % Append d_(n-1)
    
    b = (fvec(2:len-1)-fvec(1:len-2))./steps(1:len-2) - steps(1:len-2).*c(1:len-2) - steps(1:len-2).^2.*d(1:len-2); % Find b_0 through b_(n-2)
    b = [b; b(len-2) + 2*c(len-2)*steps(len-2) + 3*d(len-2)*steps(len-2)^2]; % Append b_(n-1)

end

