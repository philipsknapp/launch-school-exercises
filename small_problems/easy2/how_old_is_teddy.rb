def teddy_age()
  puts "Teddy is #{rand(20..200)} years old!"
end

def teddy_age_fe()
  puts ">> Enter a name! Or just hit Enter if you want the default."
  name = gets.chomp()
  name = "Teddy" if name == ""
  puts "#{name} is #{rand(20..200)} years old!"
end

teddy_age_fe
