function [ val ] = cubic_poly_eval(xvec,fvec, xindex, x)
%CUBLIC_POLY_EVAL Summary of this function goes here
%   Detailed explanation goes here

[a b c d]=cubic_spline(xvec, fvec);

%x needs to be an index in xvec

a=a(xindex)
b=b(xindex)
c=c(xindex)
d=d(xindex)
xk=xvec(xindex)

sk=a + b*(x-xk) + c*(x-xk)^2 + d*(x-xk)^3


val=0;

end

