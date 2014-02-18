function p = fibonacci(n)
     % FIBONACCI  Fibonacci sequence
     % f = FIBONACCI(n) generates the first n Fibonacci numbers.
    p = zeros(n,1);
    p = double(p); % i would use uint64 but u can't run log10 on a type uint, need double
    
    p(1) = 1;
    p(2) = 1;
    for k = 3:n
        p(k) = p(k-1) + p(k-2) ;
    end
    
   p(end)
end