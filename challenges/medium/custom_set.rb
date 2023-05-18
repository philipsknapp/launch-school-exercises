class CustomSet
  def initialize(set = [])
    @set = set.uniq
  end
  
  def empty?
    set.empty?
  end
  
  def contains?(val)
    set.include?(val)
  end
  
  def subset?(other)
    set.all? { |el| other.contains?(el) }
  end
  
  def disjoint?(other)
    set.all? { |el| !other.contains?(el) }
  end
  
  def eql?(other)
    subset?(other) && other.subset?(self)
  end
  
  alias_method :==, :eql?
  
  def add(val)
    set << val unless contains?(val)
    self
  end
  
  def intersection(other)
    shared_els = []
    set.each { |el| shared_els << el if other.contains?(el) }
    CustomSet.new(shared_els)
  end

  def difference(other)
    CustomSet.new(set - other.set)
  end
  
  def union(other)
    CustomSet.new(set | other.set)
  end

  protected
  
  attr_reader :set
end