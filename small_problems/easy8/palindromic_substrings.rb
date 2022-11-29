def leading_substrings(str)
  sub_arr = []
  (0...str.size).each do |i|
    sub_arr.push(str[0..i])
  end
  sub_arr
end

def substrings(str)
  full_sub_arr = []
  0.upto(str.size - 1) do |i|
    full_sub_arr << leading_substrings(str[i..-1])
  end
  full_sub_arr.flatten
end

def palindrome_filter(str)
  str.size >= 2 && str == str.reverse
end

def palindromes(str)
  subs = substrings(str)
  subs.select! do |substr|
    palindrome_filter(substr)
  end
end

def palindromes_fe(str)
  subs = substrings(str)
  subs.select! do |substr| 
    alpha_only = substr.delete "^a-z", "^A-Z", "^0-9"
    alpha_only.downcase!
    palindrome_filter(alpha_only)
  end
end

p palindromes('HeLlo-maDAM-DId-madam-goodBYe')
