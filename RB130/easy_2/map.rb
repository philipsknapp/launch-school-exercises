def map(arr)
  arr.each_with_object([]) { |el, result| result << yield(el) }
end

p map(a:1, b:2, c:3) { |k, v| v + 5 }