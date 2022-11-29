def get_word(word_name)
  print "Enter a #{word_name}: "
  gets.chomp
end

noun = get_word("noun")
verb = get_word("verb")
adjective = get_word("adjective")
adverb = get_word("adverb")

puts "A fellow that #{verb}s his #{noun} #{adverb} \
- now that's a #{adjective} fellow."