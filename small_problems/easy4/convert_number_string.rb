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

p integer_to_string(14321)