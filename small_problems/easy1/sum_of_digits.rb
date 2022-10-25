def sum(num)
  num.to_s.split("").map(&:to_i).reduce(:+)
end

puts sum(123_456_789)