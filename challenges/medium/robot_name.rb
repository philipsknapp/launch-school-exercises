class Robot
  POTENTIAL_NAMES = ('AA111'..'ZZ999').to_a
  @@taken_names = []

  attr_reader :name

  def initialize
    assign_name
  end

  def reset
    @@taken_names.delete(@name)
    assign_name
  end

  private

  def assign_name
    loop do
      @name = POTENTIAL_NAMES.sample
      next if @@taken_names.include?(@name)
      @@taken_names << @name
      break
    end
  end
end
