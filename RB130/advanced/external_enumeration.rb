factorials = Enumerator.new do |y|
  a = 1
  multiplier = 1
  loop do
    y << a
    a = a * multiplier
    multiplier += 1
  end
end

p factorials.take(7)
p factorials.take(3)
factorials.rewind
p factorials.take(7)