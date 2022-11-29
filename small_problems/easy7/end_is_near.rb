def penultimate(sentence)
  sentence.split[-2]
end

def middle_fe(sentence)
  if sentence.empty?
    return ''
  end
  word_arr = sentence.split
  middle_index = (word_arr.size - 1) / 2 
  word_arr[middle_index]
end