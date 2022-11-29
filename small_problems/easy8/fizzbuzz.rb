def fizzbuzz(num1, num2)
  start_end = num1 < num2 ? [num1, num2] : [num2, num1]
  start_end[0].upto(start_end[1]) do |num|
    if num % 3 == 0
      if num % 5 == 0
        puts "FizzBuzz"
      else
        puts "Fizz"
      end
      
    elsif num % 5 == 0
      puts "Buzz"
    else
      puts num
    end
  end
end

fizzbuzz(28, 20)