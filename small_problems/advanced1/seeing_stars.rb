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

def circle(int, squash = 2.5)
  radius = int / 2
  puts
  (0..int).each do |row|
    mid_space = Math.sqrt((2 * radius * row) - (row ** 2))
    mid_string = '*' + ' ' * ((2 * squash * mid_space).to_i) + '*'
    # squash is a fudge factor adjusting for how printed characters are taller
    puts mid_string.center((int * squash) + 10) # slight border padding
  end   
end


circle(30)