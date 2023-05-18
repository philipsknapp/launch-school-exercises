class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other_strand)
    differences = 0
    position = 0
    while position < [@strand.length, other_strand.length].min
      differences += 1 if @strand[position] != other_strand[position]
      position += 1
    end
    differences
  end
end
