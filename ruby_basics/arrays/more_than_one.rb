pets = ['cat', 'dog', 'fish', 'lizard']

my_pets = pets[2..3]

print "I have a "
for i in 0...my_pets.size do
  print "pet #{my_pets[i]}"
  if i < my_pets.size-1
    print " and a "
  else
    puts "!"
  end
end