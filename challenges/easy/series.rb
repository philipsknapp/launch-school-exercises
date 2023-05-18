class Series
  def initialize(str)
    @digits = str.chars.map(&:to_i)
  end

  def slices(len)
    raise ArgumentError if len < 1 || len > @digits.size
    result = []
    0.upto(@digits.size - len) { |i| result << @digits.slice(i, len) }
    result
  end
end
