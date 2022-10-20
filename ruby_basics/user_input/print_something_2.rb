puts ">> Do you want me to print something? (y/n)"
choice = ""

loop do
  choice =  gets.chomp.downcase
  break if choice == "y" || choice == "n"
  puts "Invalid input! Please enter y or n"
end

puts "something" if choice == "y"