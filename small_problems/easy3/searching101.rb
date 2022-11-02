def ordinalize(num)
  num_str = num.to_s
  if num >= 10 && num_str[-2] == '1'
    return num_str + 'th'
  else 
    case num_str[-1]
    when '1'
      return num_str + 'st'
    when '2'
      return num_str + 'nd'
    when '3'
      return num_str + 'rd'
    else
      return num_str + 'th'
    end
  end
end

search_population = []
5.times do |i|
  puts "Enter the #{ordinalize(i+1)} number:"
  search_population << gets.to_i
end

puts "Enter the last number:"
search_num = gets.to_i
if search_population.include?(search_num)
  puts "The number #{search_num} appears in #{search_population}."
else
  puts "The number #{search_num} does not appear in #{search_population}."
end