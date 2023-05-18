class SumOfMultiples
  def initialize(*factors)
    @factors = factors
  end

  def to(num)
    multiples = []
    @factors.each do |factor|
      (factor...num).step(factor) { |multiple| multiples << multiple }
    end
    multiples.uniq.sum
  end

  def self.to(num)
    new(3, 5).to(num)
  end
end
