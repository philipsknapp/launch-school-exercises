def sum_square_difference(n)
  (((1..n).reduce(:+)) ** 2) - (1..n).reduce{ |total, int| total + int ** 2 }
end

p sum_square_difference(100)