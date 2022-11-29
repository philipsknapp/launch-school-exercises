DIG_TO_INT = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, 
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_signed_integer(str)
  case str[0]
  when '-'
    positive = false
    str.slice!(0)
  when '+'
    positive = true
    str.slice!(0)
  else
    positive = true
  end
  
  digit_arr = str.chars.map { |el| DIG_TO_INT[el] }
  number = digit_arr.inject(0){|total, el| total * 10 + el}
  
  if positive == false
    return number *= -1
  else
    return number
  end
  
end

p string_to_signed_integer('21')