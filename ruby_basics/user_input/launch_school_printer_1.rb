print_ct = nil

loop do
  puts "How many lines do you want me to print?"
  print_ct = gets.chomp.to_i
  
  break if print_ct >= 3
  
  puts "I insist that we print at least 3!"
end

print_ct.times {puts 'Launch School is the best!'}