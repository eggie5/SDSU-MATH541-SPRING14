function [  ] = midterm_impl( lambda )

%lambda=5;
f = @(x) sin(lambda.*x) + cos(lambda.^2.*x);
a=0;
b=5;


%make a naive equi-spaced mesh for interp'.
coarse_mesh = a:.05:b
y_coarse = f(coarse_mesh); %f evaluated at the equi-spaced points -- used for interp.

%make a smart CJV-spaced mesh for interp'.
s=size(coarse_mesh);
N=s(2); %should be 11: 0 .1 .2 ... 1
cjv_mesh_proc=@(a, b, N, j) (a+b)/2 + (b-a)/2 * cos((j*pi)/N);
cjv_mesh=sort(cjv_mesh_proc(a, b, N-1, 0:N-1))
y_cjv=f(cjv_mesh);



%create fine mesh to test interpolation
fine_mesh=a:.025:b; 


%First test w/ coarse points
%evaluate lagranga at all the fine mesh points
ly = zeros(length(fine_mesh),1);

for j = 1:length(fine_mesh)
    ly(j) = neville_non_recurse(fine_mesh(j), coarse_mesh, y_coarse);
end



%Now test w/ CJV points
%evaluate lagrange at all the fine mesh points
cjly = zeros(length(fine_mesh),1);

for j = 1:length(fine_mesh)

    cjly(j) = neville_non_recurse(fine_mesh(j), cjv_mesh, y_cjv);

end



%plot the actual funtion
y_fine = f(fine_mesh);

figure(1)
subplot(1,2,2);
plot(fine_mesh, y_fine,'Color','r','DisplayName','f(x)'); hold on;
plot(fine_mesh(15:187),ly(15:187), 'Color', 'g','DisplayName','Equispaced'); hold on;
plot(fine_mesh, cjly, 'Color', 'b','DisplayName','Chekstev'); hold on;
title('eqi-spaced edges chopped for scale');
legend(gca,'show');

subplot(1,2,1);
plot(fine_mesh, y_fine,'Color','r','DisplayName','f(x)'); hold on;
plot(fine_mesh,ly, 'Color', 'g','DisplayName','Equispaced'); hold on;
plot(fine_mesh, cjly, 'Color', 'b','DisplayName','Chekstev'); hold on;
legend(gca,'show');

% figure
% plot(1:42, cjv_mesh, 'o')



%plot abs errror
cjv_abserr=abs(cjly-y_fine');
l_abserr=abs(ly-y_fine');

figure
plot(fine_mesh, cjv_abserr,'Color','r','DisplayName','CJV'); hold on;
plot(fine_mesh, l_abserr, 'Color', 'b','DisplayName','Legranga');
title('abs error');
legend(gca,'show');

eqs_mse=mean(l_abserr.^2)
cjv_mse=mean(cjv_abserr.^2)



end

