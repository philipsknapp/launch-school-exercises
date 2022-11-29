def twice(int)
  digit_str = int.to_s
  digit_length = digit_str.size
  if digit_length.even?
    midpoint = digit_length/2
    if digit_str[0...midpoint] == digit_str[midpoint...digit_length]
      return int
    end
  end
  return int * 2
end


p twice(1)