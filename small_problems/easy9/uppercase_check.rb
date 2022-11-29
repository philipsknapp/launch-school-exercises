UPPERS = /[A-Z]/

def uppercase?(str)
  str.chars.select { |char| char =~ /[a-zA-Z]/ }.all?(UPPERS)
end

p uppercase?('')