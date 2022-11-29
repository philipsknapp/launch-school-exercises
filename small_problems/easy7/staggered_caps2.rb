def staggered_case(string, need_upper = true, nonalph = true)
  result = ''
  string.chars.each do |char|
    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper = !need_upper if char =~ /[a-zA-Z]/ || nonalph
  end
  result
end

p staggered_case('i7gn7o7r7e 7t7h7e numbers', false, true)