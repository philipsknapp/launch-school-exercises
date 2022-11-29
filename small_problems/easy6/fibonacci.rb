def find_fibonacci_index_by_length(len)
  fib = [1, 1]
  loop do
    fib.push(fib[-1] + fib[-2])
    return fib.size if fib[-1].to_s.size >= len
  end
end

p find_fibonacci_index_by_length(10000)