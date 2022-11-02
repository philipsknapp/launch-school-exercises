print "What is your age? "
age = gets.chomp.to_i
print "At what age would you like to retire? "
ret_age = gets.chomp.to_i
current_year = Time.now.year
years_remaining = ret_age - age
ret_year = current_year + years_remaining

case years_remaining <=> 0
when 1
  puts "It's #{current_year}. You will retire in #{ret_year}."
  puts "You have only #{years_remaining} years of work to go!"
when 0
  puts "It's #{current_year}. You will retire this year!"
  puts "Less than a year of work to go!"
else
  puts "It's #{current_year}. Presumably, you retired in #{ret_year}."
  puts "Enjoy your retirement!"
end
