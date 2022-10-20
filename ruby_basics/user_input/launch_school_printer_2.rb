loop do
  
  number_of_lines = nil
  quitting = nil
  
  loop do
    puts '>> How many output lines do you want? Enter a number >= 3. Enter Q to quit'
    number_of_lines = gets.chomp
    
    if number_of_lines.downcase == "q"
      quitting = true
      break
    end
    
    number_of_lines = number_of_lines.to_i
    
    break if number_of_lines >= 3
    puts ">> That's not enough lines."
  end
  
  break if quitting 
    
  while number_of_lines > 0
    puts 'Launch School is the best!'
    number_of_lines -= 1
  end
  
end