ORIENTATIONS = ['nw', 'ne', 'sw', 'se']

def triangle(len)
  puts ' '
  (1..len).each do |count|
    puts ' ' * (len - count) + '*' * count + ' '
  end
end

def triangle_upside_down(len)
  puts ' '
  (1..len).each do |count|
    puts ' ' * (count-1) + '*' * (len - (count-1)) + ' '
  end
end

def triangle_rotatable(len, orient  = 'se')
  
  orient.downcase!
  if !ORIENTATIONS.include?(orient)
    puts "not a valid orientation! please use nw, ne, sw, se"
    puts "defaulting to se"
  end
  
  vertical = orient[0]
  horizontal = orient[1]
  
  puts ' '
  
  (1..len).each do |row|
    stars = '*' * (vertical == 'n' ? len - (row-1) : row)
    spaces = ' ' * (len - stars.size)
    puts horizontal == 'w' ? stars + spaces : spaces + stars
  end
end

triangle_rotatable(9, 'se')