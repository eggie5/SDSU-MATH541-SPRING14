%run the c freznal equation though our composite simpsone adaptive
%quadature routine w/ integration limits of .1:.1:7


integrals1=[]
figure
limits1=.1:.1:1;
for limit=limits1
    intval = adaptive_plotter_student_version(0,limit,10e-4,100);
    hold on;
    
    integrals1=[integrals1 intval];
end

integrals2=[]
figure
%now show it up to 7, beyond 8 it whacks out...
limits2=1:1:7;
for limit=limits2
    intval = adaptive_plotter_student_version(0,limit,10e-4,100);
    hold on;
    
    integrals2=[integrals2 intval];
end

integrals3=[]
figure
limits3=.1:.1:7;
for limit=limits3
    intval = adaptive_plotter_student_version(0,limit,10e-4,100);
    hold on;
    
    integrals3=[integrals3 intval];
end

figure
plot(limits1, integrals1);
figure
plot(limits2, integrals2);

figure
plot(limits3, integrals3);

%now lets integrate up to 20 using a combination of ACSR and non-adaptive 
% composite simpsons rule

c1 = @(x) cos(pi/2*x.^2)
cint1=Simpson_adapt_student_version(0,1,10e-4,0,1000,c1,c1);

% cint1 =
% 
%    0.779880036870763

%Now, lets use composite simpson to integrate the second integral

c2=@(x) 1/sqrt(x) * cos(pi/2 * x)
cint2=1/2 * simpson(1,400,1000,c2)

% cint2 =
% 
%   -0.279960507308404

cint = cint1+cint2

% cint =
% 
%    0.499919529562359

%which agree's with all other approximations

%now build the plot for t->20
%we already have the first part, c1, which is integrals 3 which has the
%inegral vaules from .1:.1:7, i want to contine this up to 20 w/ the
%non-adaptive CSR
c1p = integrals3

integrals4=[]
limits4=7.1:.1:20;
for limit=limits4
    intval = 1/2 * simpson(1,limit^2,1000,c2);
    
    integrals4=[integrals4 intval];
end

%now concat c1 + c2 to get the inteval from 0 to 20 
c2=cint1+integrals4;
cint=[c1p c2];

figure
plot(.1:.1:20, cint);

