say_hello = true
num_hellos = 0

while say_hello
  puts 'Hello!'
  num_hellos += 1
  say_hello = false if num_hellos > 4
end