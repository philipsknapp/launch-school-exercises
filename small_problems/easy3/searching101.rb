
puts "Enter the last number:"
search_num = gets.to_i
if search_population.include?(search_num)
  puts "The number #{search_num} appears in #{search_population}."
else
  puts "The number #{search_num} does not appear in #{search_population}."
end