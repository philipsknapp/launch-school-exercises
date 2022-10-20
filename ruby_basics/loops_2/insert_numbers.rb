numbers = []

loop do
  puts 'Enter any number:'
  numbers << gets.chomp.to_i
  if numbers.size >= 5
    break
  end
end
puts numbers