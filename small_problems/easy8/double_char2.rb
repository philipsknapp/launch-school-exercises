CONSONANTS = /[bcdfghjklmnpqrstvwxyz]/

def double_consonants(str)
  result = ''
  str.chars.each do |char|
    result << char
    result << char if char.downcase =~ CONSONANTS
  end
result
end

p double_consonants('Hello There!')