function hmwk_impl(lambda)


f = @(x) sin(lambda.*x) + cos(lambda.^2.*x);

df = @(x) lambda.*cos(lambda.*x) - lambda.^2.*sin(lambda.^2.*x);

x = 0:.1:1;

y = f(x);
yp = df(x);


[zvec, coeffs] = hermite_divided_diffs_student_version(x,y,yp);

xx=0:.025:1; 

yy = zeros(length(xx),1);

for jj = 1:length(xx)

    yy(jj) = hermit_eval(coeffs, zvec, xx(jj));

end

%get lagrange coeffs and poly
ly = zeros(length(xx),1);

for j = 1:length(xx)

    ly(j) = neville_non_recurse(xx(j), x, y);

end

figure
%reeval y over new interval & plot function 
y = f(xx);
plot(xx, y,'Color','b','DisplayName','f(x)'); hold on;
title('Approximations Vs Function');


plot(xx,ly, 'Color', 'g','DisplayName','Legranga'); hold on;

%plot hermite approx
plot(xx,yy,'Color','r','DisplayName','Hermite'); hold on;



legend(gca,'show');

%plot hermite abs errror
hermite_abserr=abs(yy-y');
l_abserr=abs(ly-y');

figure
plot(xx, hermite_abserr,'Color','r','DisplayName','Hermite'); hold on;
plot(xx, l_abserr, 'Color', 'b','DisplayName','Legranga');
title('abs error');
legend(gca,'show');
