def word_cap(str)
  str.split.map(&:capitalize).join(' ')
end

def word_cap_fe1(str)
  str.split.each do |word| 
    word[0] = word[0].upcase
    if word.size > 1
      word[1..-1] = word[1..-1].downcase
    end
  end.join(' ')
end

def word_cap_fe2(str)
  word_arr = str.split
  new_arr = []
  word_arr.each do |word|
    capped_word = ''
    
    word.size.times do |i|
      capped_word << (i == 0 ? word[i].upcase : word[i].downcase)
    end
    
    new_arr << capped_word
  end
  
  new_arr.join(' ')
end

p word_cap_fe2('this is a "quoted" word')