class Person
  def name=(full)
    @first_name, @last_name = full.split
  end
  
  def name
    "#{@first_name} #{@last_name}"
  end
end

person1 = Person.new
person1.name = 'John Doe'
puts person1.name