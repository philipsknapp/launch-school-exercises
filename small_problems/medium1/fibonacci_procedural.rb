def fibonacci(num)
  sequence = [1, 1]
  while sequence.length < num
    sequence.push(sequence[-1] + sequence[-2])
  end
  sequence[-1]
end

p fibonacci(100001)