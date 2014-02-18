function [ p ] = secantm( f, p0, p1, N, TOL)
%SECANTM Summary of this function goes here
%   Detailed explanation goes here

    i=2;
    q0=f(p0)
    q1=f(p1)
    
    while(i<=N)
        i
        p=p1-(q1*(p1-p0))/(q1-q0)
        
        if(abs(p-p1) < TOL)
            disp('found root');
            i
            return;
        end
        
        i=i+1;
        
        p0=p1;
        q0=q1;
        p1=p;
        q1=f(p)
    end
    
    error('The method fialed after N iterations');
    N
    return;
end

