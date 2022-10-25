def stringy(len)
  str = ""
  (len / 2).times {str << "10"}
  (str << "1") if len.odd?
  str
end

def stringy_fe(size, start_dig = 1)
  numbers = []

  size.times do |index|
    number = index.even? ? start_dig : 1-start_dig
    numbers << number
  end

  numbers.join
end

puts stringy_fe(6, 0)
