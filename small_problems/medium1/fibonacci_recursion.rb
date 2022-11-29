def fibonacci(num)
  if num == 1 || num == 2
    1
  else
    fibonacci(num-1) + fibonacci(num-2)
  end
end

p fibonacci(20)