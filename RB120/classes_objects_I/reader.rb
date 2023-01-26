class Cat
  def initialize(n)
    @name = n
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
  
  def name
    @name
  end
  
end

kitty = Cat.new("Sophie")
kitty.greet