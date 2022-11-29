def include?(arr, val)
  test_arr = arr.select{ |el| el == val }
  return !test_arr.empty?
end

p include?([], nil)