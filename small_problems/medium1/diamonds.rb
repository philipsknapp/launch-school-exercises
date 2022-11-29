def diamond(width)
  puts
  width.times do |line|
    spaces = ((width / 2) - line).abs
    stars = width - (spaces * 2)
    puts (' ' * spaces) + ('*' * stars) + (' ' * spaces)
  end
end

def diamond_outline(width)
  puts
  width.times do |line|
    spaces = ((width / 2) - line).abs
    stars = width - (spaces * 2)
    space_str = ' ' * spaces
    star_str = ''
    stars.times do |num|
      star_str << (num == 0 || num == stars - 1 ? '*' : ' ')
    end
    puts space_str + star_str + space_str
  end
end

diamond_outline 9