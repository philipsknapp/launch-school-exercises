def star(int)
  puts
  (0...int).each do |row|
    if row == int / 2
      puts '*' * int
      next
    end
    border = (int / 2) - ((int / 2) - row).abs
    fill = (int - (border * 2) - 3) / 2
    puts ' ' * border + '*' + ' ' * fill + '*' + ' ' * fill + '*' + ' ' * border
  end  
end

def sine(length, amplitude, wavelength)
  puts
  midpoint = amplitude / 2
  (0...length).each do |position|
    sine = (Math.sin((position.to_f / wavelength) * (Math::PI / 2)) * (amplitude / 2)).to_i
    puts ' ' * (midpoint + sine) + '*'
  end  
end

def circle(int)
  radius = int / 2
  puts
  (0..int).each do |row|
    mid_space = Math.sqrt(radius ** 2 - ((row - radius) ** 2))
    mid_string = '*' + ' ' * (2 * mid_space.to_i) + '*'
    puts mid_string.center(80)
  end   
end


circle(80)