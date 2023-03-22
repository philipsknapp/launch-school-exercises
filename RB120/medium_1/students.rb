class Student
  def initialize(name, year)
    @name = name
    @year = year
  end
  
  def to_s # further exploration
    "#{@name}, class of #{@year}"
  end
end

class Graduate < Student
  def initialize(name, year, parking)
    super(name, year)
    @parking = parking
  end
  
  def to_s(field) # further exploration - this doesn't really work because
                  # you wouldn't call to_s with an argument in your code
    super() + " in the field of #{field}."
  end
end

class Undergraduate < Student
  def initialize(name, year)
    super
  end
end

philip = Graduate.new('philip', 2023, 'ok then')
p philip.to_s('dancing')