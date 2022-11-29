def center_of(str)
  str[(str.size - 1) / 2, 2 - (str.size % 2)]
end

p center_of('')