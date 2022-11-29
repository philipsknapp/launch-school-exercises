DIGIT_WORDS = {
  'zero' => 0, 'one' => 1, 'two' => 2, 'three' => 3, 
  'four' => 4, 'five' => 5, 'six' => 6, 'seven' => 7, 
  'eight' => 8, 'nine' => 9
}

def word_to_digit(str)
  DIGIT_WORDS.each do |k, v|
    str.gsub!(/\b#{k}\b/i, v.to_s)
  end
  str
end

def word_to_digit_nospace(str) 
  DIGIT_WORDS.each do |k, v|
    str.gsub!(/\b#{k}\b/i, v.to_s)
  end
  while str =~ /(\d+)\s(\d+)/
    str.gsub!(/(\d+)\s(\d+)/, '\1\2')
  end
  str
end

def word_to_digit_format_phone(str)
  DIGIT_WORDS.each do |k, v|
    str.gsub!(/\b#{k}\b/i, v.to_s)
  end
  while str =~ /(\d+)\s(\d+)/
    str.gsub!(/(\d+)\s(\d+)/, '\1\2')
  end
  str.gsub!(/(\d{3})(\d{3})(\d{4})/, '(\1) \2-\3')
str
end

def word_to_digit_nospace_selection(str)
  DIGIT_WORDS.each do |k, v|
    str.gsub!(/\b#{k}\b/i, "~gsub~#{v.to_s}~gsub~")
  end
  while str =~ /~gsub~(\d+)~gsub~\s~gsub~(\d+)~gsub~/
    str.gsub!(/~gsub~(\d+)~gsub~\s~gsub~(\d+)~gsub~/, '~gsub~\1\2~gsub~')
  end
  str.gsub!(/~gsub~(\d+)~gsub~/, '\1')
  str
end

p word_to_digit_nospace_selection('Please call me at 5 2 3 nine one five three nine nine one. Thanks.')