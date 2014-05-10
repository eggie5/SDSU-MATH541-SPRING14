function [ output ] = romberg(a,b,n )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

R = zeros(n,n);

R(1,1) = double(((b-a)/2)*(exp((-(a.^2))) + exp(-(b.^2))));

for k = 2: n
    h = (b-a)/(2^(k-1));
    
    R(k,1) = double(1/2 * (R(k-1,1) + 2*h * sum(exp(-(a+(2*(1:(2^(k-2))-1) -1) *h).^2))));
    
end

for j = 2 : n
    for k = j : n
        R(k,j) = double(R(k,j-1) + (R(k,j-1) - R(k-1,j-1))/(4^(j-1) - 1));
    end
end

output = double(2/(sqrt(pi)) * R)


end

