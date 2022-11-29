def ordinalize(num)
  num_str = num.to_s
  if num >= 10 && num_str[-2] == '1'
    return num_str + 'th'
  else 
    case num_str[-1]
    when '1'
      return num_str + 'st'
    when '2'
      return num_str + 'nd'
    when '3'
      return num_str + 'rd'
    else
      return num_str + 'th'
    end
  end
end

def century(num)
  cent, mod = num.divmod(100)
  cent += 1 if mod != 0
  ordinalize(cent)
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'