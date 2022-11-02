print "Please write a word or multiple words: "
input = gets.chomp
char_count = input.split(" ").join.length
puts "There are #{char_count} characters in \"#{input}\"."