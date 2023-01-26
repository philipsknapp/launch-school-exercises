class Transform < String
  def initialize(str)
    @contents = str
  end
  
  def uppercase
    @contents.upcase
  end
  
  def self.lowercase(text)
    text.downcase
  end
  
end

my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')