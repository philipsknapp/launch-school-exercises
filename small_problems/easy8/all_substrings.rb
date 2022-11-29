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

p substrings('abcde')