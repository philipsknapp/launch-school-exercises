def is_odd?(int)
  int = int.abs
  int % 2 != 0
end

def is_odd_rem?(int)
  int = int.abs
  int.remainder(2) != 0
end

puts is_odd_rem?(-2)    # => false
puts is_odd_rem?(-5)    # => true