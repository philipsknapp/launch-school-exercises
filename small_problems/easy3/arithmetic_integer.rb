def operate (num1, num2, operator)
  case operator
  when '+' then num1 + num2
  when '-' then num1 - num2
  when '*' then num1 * num2
  when '/' then num1 / num2 rescue "can't divide by 0"
  when '%' then num1 % num2 rescue "can't divide by 0"
  when '**' then num1 ** num2
  end
end

op_list = ['+', '-', '*', '/', '%', '**']


puts "==> Enter the first number:"
num1 = gets.to_i

puts "==> Enter the second number:"
num2 = gets.to_i

op_list.each do |operator|
  puts "==> #{num1} #{operator} #{num2} = #{operate(num1, num2, operator)}"
end