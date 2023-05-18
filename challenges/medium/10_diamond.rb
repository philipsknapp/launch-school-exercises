class Diamond
  def self.make_diamond(letter)
    width = ((letter.ord - 'A'.ord) * 2) + 1
    rows = ('A'..letter).to_a + (('A'...letter).to_a.reverse)
    rows.map! { |row| char_line(row).center(width) + "\n" }
    rows.join
  end

  def self.char_line(char)
    return 'A' if char == 'A'
    spacing = ((char.ord - 'A'.ord) * 2) - 1
    char + (' ' * spacing) + char
  end
end
