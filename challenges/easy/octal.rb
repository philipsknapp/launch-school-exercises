class Octal
  def initialize(num)
    @num = num
  end

  def to_decimal
    return 0 if /[^0-7]/ =~ @num
    result = 0
    power = 0
    @num.reverse.each_char do |char|
      result += (char.to_i * (8**power))
      power += 1
    end
    result
  end
end
