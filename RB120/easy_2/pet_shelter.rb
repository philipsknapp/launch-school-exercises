class Pet
  attr_reader :species, :name
  
  def initialize(species, name)
    @species = species
    @name = name
  end
end

class Owner
  attr_reader :name, :number_of_pets

  def initialize(name)
    @name = name
    @number_of_pets = 0
  end
  
  def increase_pets
    @number_of_pets += 1
  end
end

class Shelter
  attr_reader :unadopted
  
  def initialize
    @unadopted = []
    @adoptions = Hash.new { |hash, key| hash[key] = [] }
  end
  
  def take_in(pet_list)
    @unadopted.concat(pet_list)
  end

  def adopt(owner, pet)
    if @unadopted.include?(pet)
      @adoptions[owner].push(@unadopted.delete(pet))
      owner.increase_pets
    else
      put "There's no pet named #{pet.name} up for adoption!"
    end
  end
  
  def print_adoptions
    puts "The Animal Shelter has the following unadopted pets:"
    @unadopted.each do |pet|
      puts "a #{pet.species} named #{pet.name}"
    end
    puts
    @adoptions.each do |owner, pets|
      puts "#{owner.name} has adopted the following pets:"
      pets.each do |pet|
        puts "a #{pet.species} named #{pet.name}"
      end
      puts
    end
  end
end

asta         = Pet.new('dog', 'Asta')
laddie       = Pet.new('dog', 'Laddie')
fluffy       = Pet.new('dog', 'Fluffy')
kat          = Pet.new('cat', 'Kat')
ben          = Pet.new('cat', 'Ben')
chatterbox   = Pet.new('parakeet', 'Chatterbox')
bluebell     = Pet.new('parakeet', 'Bluebell')
butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

all_pets = [asta, laddie, fluffy, kat, ben, chatterbox, bluebell, 
            butterscotch, pudding, darwin, kennedy, sweetie, molly,
            chester]

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.take_in(all_pets)

shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
puts "The Animal shelter has #{shelter.unadopted.length} unadopted pets."