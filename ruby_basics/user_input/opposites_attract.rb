def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

loop do
  num1 = nil
  loop do
    puts ">> Enter your first positive or negative integer"
    num1 = gets.chomp
    if !valid_number?(num1)
      puts "Invalid input. Please enter a nonzero integer."
    else
      num1 = num1.to_i
      break
    end
  end
  
  num2 = nil
  loop do
    puts ">> Enter your second positive or negative integer"
    num2 = gets.chomp
    if !valid_number?(num2)
      puts "Invalid input. Please enter a nonzero integer."
    else
      num2 = num2.to_i
      break
    end
  end
  
  if (num1 > 0 && num2 < 0) || (num1 < 0 && num2 > 0)
    puts "#{num1} + #{num2} = #{num1 + num2}" 
    break
  else 
    puts "Sorry. One integer must be positive, one must be negative. \n Please start over."
  end
  
end