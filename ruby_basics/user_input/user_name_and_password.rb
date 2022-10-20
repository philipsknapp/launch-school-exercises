USERNAME = "me"
PASSWORD = "password123"

loop do
  puts "Please enter user name:"
  name = gets.chomp
  puts "Please enter your password:"
  pw = gets.chomp
  
  break if name == USERNAME && pw == PASSWORD
  
  puts "Authorization failed!"
end

puts "Welcome!"