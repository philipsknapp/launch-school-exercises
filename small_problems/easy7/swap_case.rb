def swapcase(str)
  result = ''
  str.chars.each do |char|
    if char =~ /[a-z]/
      result << char.upcase
    elsif char =~ /[A-Z]/
      result << char.downcase
    else result << char
    end
  end
  
  result
end

p swapcase('Tonight on XYZ-TV')