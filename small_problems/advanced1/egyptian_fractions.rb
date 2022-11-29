def egyptian(rat)
  denom_list = []
  remainder = rat
  denom = 0

  until remainder == 0
    loop do # find smallest int denominator
      denom += 1
      break if remainder >= Rational(1, denom)
    end
    denom_list << denom
    remainder -= Rational(1, denom)
  end

  denom_list
end

def unegyptian(arr)
  arr.map { |int| Rational(1, int) }.reduce(:+)
end

p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)