PASSWORD = "password123"

loop do
  puts "Please enter your password"
  pw = gets.chomp
  
  break if pw == PASSWORD
  
  puts "Invalid password!"
end

puts "Welcome!"