LETTER_BLOCKS = {
  'B' => 'O', 'X' => 'K', 'D' => 'Q', 'C' => 'P', 'N' => 'A',
  'G' => 'T', 'R' => 'E', 'F' => 'S', 'J' => 'W', 'H' => 'U',
  'V' => 'I', 'L' => 'Y', 'Z' => 'M'
}

LETTER_BLOCKS_FLIP = LETTER_BLOCKS.invert

def block_word?(word)
  letters = word.upcase.chars
  return true if letters.size < 2
  letters[0..-2].each_with_index do |current_letter, i|
    letters[i + 1..-1].each do |test_letter|
      return false if test_letter == current_letter \
      || test_letter == LETTER_BLOCKS[current_letter] \
      || test_letter == LETTER_BLOCKS_FLIP[current_letter]
    end
  end
  true
end

p block_word?('rest')