def digit_list_1(num)
  num_str = num.to_s
  str_arr = num_str.split("")
  num_arr = str_arr.map { |dig| dig.to_i}
  return num_arr
end

def digit_list_2(num)
  digits_to_convert = num
  digit_array = []
  
  while digits_to_convert > 0
    digit_array.unshift(digits_to_convert % 10)
    digits_to_convert /= 10
  end
  
  return digit_array
end
