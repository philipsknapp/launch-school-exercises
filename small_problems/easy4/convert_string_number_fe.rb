HEX_TO_INT = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, 
  '7' => 7, '8' => 8, '9' => 9, 'a' => 10, 'b' => 11, 
  'c' => 12, 'd' => 13, 'e' => 14, 'f' => 15
}

def hexadecimal_to_integer(str)
  digit_arr = str.downcase.chars.map { |el| HEX_TO_INT[el] }
  digit_arr.inject(0){|total, el| total * 16 + el}
end

p hexadecimal_to_integer('4D9f')