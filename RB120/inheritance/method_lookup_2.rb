class Animal
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new
cat1.color

#lookup path is Cat, Animal, Object, Kernel, BasicObject, and ultimately returns a NoMethodError