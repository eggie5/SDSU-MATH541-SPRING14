trap_sig1 = 1/sqrt(pi) * trapezoid(-1/sqrt(2), 1/sqrt(2), 10)

% f = 
% 
%     @(x)exp(-x^2)
% 
% 
% ans =
% 
%     0.6811

trap_sig2 = 1/sqrt(pi) * trapezoid(-2/sqrt(2), 2/sqrt(2), 10)

% f = 
% 
%     @(x)exp(-x^2)
% 
% 
% ans =
% 
%     0.9516

trap_sig3 = 1/sqrt(pi) * trapezoid(-3/sqrt(2), 3/sqrt(2), 10)

% f = 
% 
%     @(x)exp(-x^2)
% 
% 
% ans =
% 
%     0.9965



%now w/ simpson
%%%%%%%%%%%%%%%%

simp_sig1= 1/sqrt(pi) * quick_simpson(-1/sqrt(2), 1/sqrt(2), 10)
% 
% f = 
% 
%     @(x)exp(-x.^2)
% 
% 
% ans =
% 
%     0.6827


simp_sig2 =1/sqrt(pi) * quick_simpson(-2/sqrt(2), 2/sqrt(2), 10)

% f = 
% 
%     @(x)exp(-x.^2)
% 
% 
% ans =
% 
%     0.9545


simp_sig3 = 1/sqrt(pi) * quick_simpson(-3/sqrt(2), 3/sqrt(2), 10)

% f = 
% 
%     @(x)exp(-x.^2)
% 
% 
% ans =
% 
%     0.9972


%%now the matlab baseline to compare against
f=@(x)exp(-x.^2)

mat_sig1= 1/sqrt(pi) * integral(f, -1/sqrt(2), 1/sqrt(2), 'RelTol', 1e-16, 'AbsTol', 1e-16)

% mat_sig1 =
% 
%     0.6827

    
mat_sig2= 1/sqrt(pi) * integral(f, -2/sqrt(2), 2/sqrt(2), 'RelTol', 1e-16, 'AbsTol', 1e-16)

% mat_sig2 =
% 
%     0.9545
    

mat_sig3= 1/sqrt(pi) * integral(f, -3/sqrt(2), 3/sqrt(2), 'RelTol', 1e-16, 'AbsTol', 1e-16)
% 
% mat_sig3 =
% 
%     0.9973


trap_sig1_err = abs(mat_sig1 - trap_sig1)
trap_sig2_err = abs(mat_sig2 - trap_sig2)
trap_sig3_err = abs(mat_sig3 - trap_sig3)

simp_sig1_err = abs(mat_sig1 - simp_sig1)
simp_sig2_err = abs(mat_sig2 - simp_sig2)
simp_sig3_err = abs(mat_sig3 - simp_sig3)

x=1:3;
trap_err=[trap_sig1_err, trap_sig2_err, trap_sig3_err]
simp_err=[simp_sig1_err, simp_sig2_err, simp_sig3_err]

plot(x, trap_err ,'Color','r','DisplayName','trap err');hold on;
plot(x, simp_err,'Color','b','DisplayName','simp err');
title('trap err v. simp. err');
legend(gca,'show');

