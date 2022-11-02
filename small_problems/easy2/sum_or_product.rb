print "Please enter an integer greater than 0: "
int = gets.to_i

sum_or_product = ''
loop do
  puts "Enter 's' to compute the sum, 'p' to compute the product."
  sum_or_product = gets.downcase[0]
  break if ['s', 'p'].include?(sum_or_product)
  puts "Input must start with 's' or 'p' to proceed! Try again."
end

print "The #{sum_or_product == 's' ? 'sum' : 'product'} "
print "of the integers between 1 and #{int} is "

puts "#{sum_or_product == 's' ?  (1..int).reduce(:+) : (1..int).reduce(:*)}."
