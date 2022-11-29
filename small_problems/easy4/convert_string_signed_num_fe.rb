DIG_TO_INT = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, 
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_integer(str)
  digit_arr = str.chars.map { |el| DIG_TO_INT[el] }
  digit_arr.inject(0){|total, el| total * 10 + el}
end

def string_to_signed_integer(string)
  sign = 1
  lead = string[0]
  if !DIG_TO_INT.key?(lead)
    string.slice!(0)
    sign = -1 if lead == '-'
  end
  sign * string_to_integer(string)
end

p string_to_signed_integer('+21')