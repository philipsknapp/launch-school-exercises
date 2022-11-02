name = ''
loop do
  print "Please enter your name: "
  name = gets.rstrip
  puts name
  break unless name.empty?
end

loud = false
while name.end_with?('!')
  loud = true
  name.delete_suffix!('!').rstrip!
end

if loud
  puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end
