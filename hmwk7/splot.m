
f = @(x) exp(x);

for h=0:1:2
   est=simpson(0,2,2)
   actual=f(2*h)
   error=actual-est
end


