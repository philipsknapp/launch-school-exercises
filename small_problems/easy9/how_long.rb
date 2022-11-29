def word_lengths(str)
  str.split.map { |word| word + ' ' + word.length.to_s }
end

p word_lengths("")