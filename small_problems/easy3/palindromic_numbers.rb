def palindromic_number?(num)
  p num 
  num == num.to_s.reverse.to_i
end

p palindromic_number?(005)