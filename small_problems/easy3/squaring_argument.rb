def multiply(num1, num2)
  num1 * num2
end

def square(num)
  multiply(num, num)
end

def exponentiate(num, power)
  total = 1
  power.times{ total = multiply(total, num) }
  return total
end

p exponentiate(2, 5)