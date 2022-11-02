def palindrome_original?(str)
  (str.length/2).times do |i|
    if str[i] != str[-(1+i)]
      return false
    end
  end
  return true 
end

def palindrome?(string)
  string == string.reverse
end

p palindrome_original?([1, 2, 3, 2, 1])
