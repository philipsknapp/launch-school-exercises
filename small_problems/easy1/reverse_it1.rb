def reverse_sentence(str)
  str.split(' ').reverse().join(' ')
end



puts reverse_sentence('Reverse these words')