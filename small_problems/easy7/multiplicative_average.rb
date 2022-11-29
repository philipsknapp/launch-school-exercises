def show_multiplicative_average(arr)
  average = (arr.inject(:*)) / (arr.size.to_f)
  puts "The result is #{format("%.3f", average)}"
end

show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) 