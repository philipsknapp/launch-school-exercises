def staggered_case(str)
  result = ''
  str.chars.each_with_index do |char, i|
    if i.even? && char =~ /[a-z]/
      result << char.upcase
    elsif i.odd? && char =~ /[A-Z]/
      result << char.downcase
    else 
      result << char
    end
  end
  result
end

def staggered_case_fe(string, need_upper)
  result = ''
  string.chars.each do |char|
    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper = !need_upper
  end
  result
end


p  staggered_case_fe('ignore 77 the 444 numbers', true)