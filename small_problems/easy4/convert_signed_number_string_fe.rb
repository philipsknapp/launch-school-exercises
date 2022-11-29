INT_TO_DIG = {
  1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5',
  6 => '6', 7 => '7', 8 => '8', 9 => '9', 0 => '0'
}

def integer_to_string(int)
  str = ''
  str = '0' if int == 0 #special case
  while int > 0
    str.prepend(INT_TO_DIG[int.remainder(10)])
    int /= 10
  end
  str
end

def signed_integer_to_string(int)
  sign = '+'
  case int <=> 0
  when -1 
    int *= -1
    sign = '-'
  when 0
    return '0'
  end
  sign + integer_to_string(int)
end
