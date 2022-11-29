def leading_substrings(str)
  sub_arr = []
  (0...str.size).each do |i|
    sub_arr.push(str[0..i])
  end
  sub_arr
end

p leading_substrings('')