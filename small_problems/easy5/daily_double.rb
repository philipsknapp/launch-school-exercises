def crunch(str)
  str.gsub!(/(.)\1{1,}/, "\\1")
  str
end

p crunch('')