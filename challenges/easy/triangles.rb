class Triangle
  def initialize(side1, side2, side3)
    valid?(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind
    unique_lengths = [@side1, @side2, @side3].uniq.size
    case unique_lengths
    when 1 then "equilateral"
    when 2 then "isosceles"
    when 3 then "scalene"
    end
  end

  private

  def valid?(side1, side2, side3)
    sides = [side1, side2, side3]
    valid_types?(sides)
    valid_lengths?(sides)
  end

  def valid_types?(sides)
    return if sides.all? { |side| [Integer, Float].include?(side.class) }
    raise ArgumentError, "Sides must be integers or floats"
  end

  def valid_lengths?(sides)
    sides = sides.sort
    raise ArgumentError, "Sides cannot be negative or zero" if sides[0] <= 0
    return if sides[0] + sides[1] > sides[2]
    raise ArgumentError, "Sum of shorter sides cannot be less than or \n
      equal to the longer side"
  end
end
