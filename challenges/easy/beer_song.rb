class BeerSong
  def self.verse(num)
    raise ArgumentError unless valid_num?(num)
    case num
    when 0 then zero_verse
    when 1 then one_verse
    when 2 then two_verse
    else standard_verse(num)
    end
  end

  def self.verses(num1, num2)
    raise ArgumentError unless valid_num?(num1) && valid_num?(num2)
    higher = [num1, num2].max
    lower = [num1, num2].min
    (lower..higher).map { |num| verse(num) }.reverse.join("\n")
  end

  def self.lyrics
    verses(99, 0)
  end

  def self.valid_num?(num)
    (0..99).cover?(num)
  end

  def self.zero_verse
    "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end

  def self.one_verse
    "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
  end

  def self.two_verse
    "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
  end

  def self.standard_verse(num)
    "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
      "Take one down and pass it around, " \
      "#{num - 1} bottles of beer on the wall.\n"
  end
end
