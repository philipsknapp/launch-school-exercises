def swap(sentence)
  sentence.split(' ').map do |word| 
    word[0], word[-1] = word[-1], word[0]
    word
    end.join(' ')
end

p swap('Oh what a wonderful day it is')