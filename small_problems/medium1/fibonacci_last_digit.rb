def fibonacci_last(nth)
  first, last = 1, 1
  return last if [1, 2].include?(nth)
  3.upto(nth) do
    first, last = last, (first + last) % 10
  end
  last
end

FIB_LAST_DIGITS = (1..60).map do |n|
  fibonacci_last(n)
end

def fibonacci_last_fe(nth)
  FIB_LAST_DIGITS[(nth-1) % 60]
end

p fibonacci_last_fe(123456789987745)