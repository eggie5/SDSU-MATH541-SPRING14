f=@(t) cos(pi+t^3) + 1;
f(10e-6)

%=0

%because w/ machine percission we only have about 15 digits of percission.
%in this case we need to deal w/ 6*3 = 18 digits of percission so the
%number is intrepreted as 0, so we have cos(pi + 0) and cos(pi)=0;

f2=@(t) -(sin(pi+t^3)^2)/(cos(pi+t^3)-1)
f2(10e-6)

% ans =
% 
%    2.9316e-31

%which agrees roughly w/ wolfram's answer: http://www.wolframalpha.com/input/?i=cos(pi%2Bt%5E3)+%2B+1+where+t%3D10e-6


%approximating ft w/ taylor series: t^6/2-t^12/24+t^18/720+O(t^21

ft=@(t) t^6/2-t^12/24+t^18/720
% 
% f(10e-6)
% 
% ans =
% 
%    5.0000e-31

% and 5e-37 according to the wolfram