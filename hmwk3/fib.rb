def fib(n)
  1/Math.sqrt(5) * (  ((1+Math.sqrt(5))/2)**n -  ((1-Math.sqrt(5))/2)**n  ) 
end

N=45

p fib(40).class

(3..N).each do |n|
  puts "#{n} #{fib(n)}"
end



