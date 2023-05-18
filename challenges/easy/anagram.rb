class Anagram
  def initialize(word)
    @word = word
  end

  def match(candidates)
    candidates.select { |candidate| anagram?(candidate) }
  end

  def anagram?(candidate)
    pair = [@word, candidate].map(&:downcase)
    return false if pair[0] == pair[1]
    pair.map! { |str| str.chars.sort }
    pair[0] == pair[1]
  end
end
