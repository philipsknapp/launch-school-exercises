def mult_3_5?(num)
  (num % 3 == 0) || (num % 5 == 0)
end

def multisum(num)
  total = 0
  (1..num).each { |i| total += i if mult_3_5?(i)}
  total
end


def fe(num)
  mult_arr = []
  1.upto(num) { |i| mult_arr.push(i) if mult_3_5?(i) }
  mult_arr.inject(:+)
end

p fe(1000)