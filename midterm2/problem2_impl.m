%running the quad approx for e^x w/ 3 spline points
%the arg to spline_quad is the step size in my mesh. The mesh is hard-coded
%to be the inteval [0, pi] with a variable step size. setting a step size
%of 1 equates to 3 spline points. e.g. 0 1 2 3

f = @(x) exp(x);

exp_rough_quad = spline_quad(0, pi, 1, f)


%this should give 19.5523, which is in agreement w/ the book (pg. 153).

%Now if we make the mesh finer, we can get a better approx, e.g.:

exp_fine_quad = spline_quad(0, pi, .0025, f)

%which comes out to: 22.1039 which aggee's w/ wolframa alpha's answer.


%To determine the error in our quadature we must compare the actual value:

actual=exp(pi)-1;

coarse_err=abs(actual- exp_rough_quad)

%now compare to the better quad. approx w/ the finer mesh:

fine_err=abs(actual - exp_fine_quad)

% coarse_err =
% 
%     2.5884
% 
% 
% fine_err =
% 
%     0.0368

%we could prob. even get better results w/ a clamped spline


%not sure what order of error is...


%now, lets compare how spline quad. compares to simposon composite 
%integration for the function:

%f=@(x) sin(lambda.*x) + cos(lambda.^2.*x); as we increase lambda from 1 5
%and 10


%first lets test how good simpson is:

simp_err=simpson_error

% error =
% 
%     0.0000
%     0.0004
%     0.0232

%as we can see simpson has NO error when lambda=1, but for some reason the 
%error skyrockets on lambda=10. I doubt
%our natural qubic spline can match that.

quad_err=spline_quad_error

% error =
% 
%    1.0e-06 *
% 
%     0.0001
%     0.4183
%     0.4031

%well as it turns out our spline IS more accurate.

figure
plot([1 5 10], simp_err,'o-', 'Color','b','DisplayName','homer simpson'); hold on;
plot([1 5 10], quad_err, 'x-', 'Color','r','DisplayName','spline');
title('simpson vs spline quad. over lambda=1,5,10');
legend(gca,'show');

