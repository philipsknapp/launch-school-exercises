class PerfectNumber
  def self.classify(num)
    aliquot = find_divisors(num).sum
    result = if aliquot > num
               "abundant"
             elsif aliquot == num
               "perfect"
             else
               "deficient"
             end
    result
  end

  def self.find_divisors(num)
    divisors = [1]
    largest_candidate = Math.sqrt(num).to_i
    2.upto(largest_candidate) do |candidate|
      divisors << candidate << (num / candidate) if num % candidate == 0
    end
    divisors
  end
end
