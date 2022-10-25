def reverse_words(str)
  str.split.map{ |word| word.length >= 5 ? word.reverse() : word }.join(" ")
end

puts reverse_words('Walk around the block')