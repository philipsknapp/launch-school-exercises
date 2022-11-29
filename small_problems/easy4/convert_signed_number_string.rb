INT_TO_DIG = {
  1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5',
  6 => '6', 7 => '7', 8 => '8', 9 => '9', 0 => '0'
}

def integer_to_string(int)
  str = ''
  
  case int <=> 0
  when -1
    sign = '-'
    int *= -1
  when 0
    sign = ''
    str = '0'
  when 1
    sign = '+'
  end
  
  while int > 0
    str.prepend(INT_TO_DIG[int.remainder(10)])
    int /= 10
  end
  
  sign + str

end

p integer_to_string(-0)