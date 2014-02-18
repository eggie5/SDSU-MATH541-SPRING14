function [ c ] = bisection_s( f, a, b, NMAX, TOL )
%BISECTION_S Summary of this function goes here
%   Detailed explanation goes here

N=1;

while(N <= NMAX)
    c=(a+b)/2; %new midpoint
    if((f(c) == 0) || ((b-a)/2 < TOL))
        N
        return;
    end
    
    N=N+1;
    
    if(f(a) * f(b) >0)
        a=c;
    else
        b=c; %new interval
    end
end

error('method failed, too many iterations');

end
