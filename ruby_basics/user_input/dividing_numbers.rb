def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

num = nil
denom = nil 

loop do
  puts "Please enter the numerator:"
  num = gets.chomp
  
  break if valid_number?(num)
  
  puts "Invalid input. Only integers allowed."
end

loop do
  puts "Please enter the denominator:"
  denom = gets.chomp 
  
  break if valid_number?(denom) && denom.to_i != 0
  
  puts "Invalid input. Only non-zero integers are allowed."
end

dividend = num.to_i/denom.to_i

puts "#{num} / #{denom} is #{dividend}"