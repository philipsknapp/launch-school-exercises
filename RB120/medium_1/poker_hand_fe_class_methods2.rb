class Card
  include Comparable

  RANKING_VALUES = { 2 => 2, 3 => 3, 4 => 4, 5 => 5,
                     6 => 6, 7 => 7, 8 => 8, 9 => 9,
                     10 => 10, 'Jack' => 11, 'Queen' => 12,
                     'King' => 13, 'Ace' => 14
                    }

  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def <=>(other)
    RANKING_VALUES[rank] <=> RANKING_VALUES[other.rank]
  end
  
  def to_s
    "#{rank} of #{suit}"
  end
end

class Deck
  attr_reader :cards
  
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    @cards = []
    refresh
  end
  
  def draw
    card = cards.pop
    refresh if cards.empty?
    card
  end
  
  def refresh
    cards.concat(RANKS.product(SUITS).map {|el| Card.new(*el)}.shuffle)
  end
end

module PokerHand
  def self.royal_flush?(cards)
    cards.sort.map(&:rank) == [10, 'Jack', 'Queen', 'King', 'Ace'] && flush?(cards)
  end

  def self.straight_flush?(cards)
    straight?(cards) && flush?(cards)
  end

  def self.four_of_a_kind?(cards)
    Deck::RANKS.any? do |rank|
      cards.count { |card| card.rank == rank} == 4
    end
  end

  def self.full_house?(cards)
    return false unless three_of_a_kind?(cards)
    three_rank = Deck::RANKS.find do |rank|
      cards.count { |card| card.rank == rank } == 3
    end
    remaining_cards = cards.reject { |card| card.rank == three_rank }
    pair?(remaining_cards)
  end

  def self.flush?(cards)
    cards.all? { |card| card.suit == cards[0].suit }
  end

  def self.straight?(cards)
    card_ranks = cards.map { |card| Card::RANKING_VALUES[card.rank] }
    self.consecutive?(card_ranks)
  end

  def self.three_of_a_kind?(cards)
    Deck::RANKS.any? do |rank|
      cards.count { |card| card.rank == rank} == 3
    end
  end

  def self.two_pair?(cards)
    pair_ranks = Deck::RANKS.find_all do |rank|
      cards.count { |card| card.rank == rank } == 2
    end
    pair_ranks.size == 2
  end

  def self.pair?(cards)
    Deck::RANKS.any? do |rank|
      cards.count { |card| card.rank == rank} == 2
    end
  end
  
  def self.consecutive?(arr)
    raise ArgumentError, "argument to consecutive? must be an array of integers" \
      unless arr.all? { |el| el.class == Integer }
    return true if arr.empty?

    arr = arr.sort
    next_val = (arr.shift + 1)
    until arr.empty?
      return false unless arr.shift == next_val
      next_val += 1
    end
    true
  end
end


# Test that we can identify each PokerHand type.
hand = [
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
]
puts PokerHand.straight_flush?(hand)

# hand = PokerHand.new([
#   Card.new(8,       'Clubs'),
#   Card.new(9,       'Clubs'),
#   Card.new('Queen', 'Clubs'),
#   Card.new(10,      'Clubs'),
#   Card.new('Jack',  'Clubs')
# ])
# puts hand.evaluate == 'Straight flush'

# hand = PokerHand.new([
#   Card.new(3, 'Hearts'),
#   Card.new(3, 'Clubs'),
#   Card.new(5, 'Diamonds'),
#   Card.new(3, 'Spades'),
#   Card.new(3, 'Diamonds')
# ])
# puts hand.evaluate == 'Four of a kind'

# hand = PokerHand.new([
#   Card.new(3, 'Hearts'),
#   Card.new(3, 'Clubs'),
#   Card.new(5, 'Diamonds'),
#   Card.new(3, 'Spades'),
#   Card.new(5, 'Hearts')
# ])
# puts hand.evaluate == 'Full house'

# hand = PokerHand.new([
#   Card.new(10, 'Hearts'),
#   Card.new('Ace', 'Hearts'),
#   Card.new(2, 'Hearts'),
#   Card.new('King', 'Hearts'),
#   Card.new(3, 'Hearts')
# ])
# puts hand.evaluate == 'Flush'

# hand = PokerHand.new([
#   Card.new(8,      'Clubs'),
#   Card.new(9,      'Diamonds'),
#   Card.new(10,     'Clubs'),
#   Card.new(7,      'Hearts'),
#   Card.new('Jack', 'Clubs')
# ])
# puts hand.evaluate == 'Straight'

# hand = PokerHand.new([
#   Card.new('Queen', 'Clubs'),
#   Card.new('King',  'Diamonds'),
#   Card.new(10,      'Clubs'),
#   Card.new('Ace',   'Hearts'),
#   Card.new('Jack',  'Clubs')
# ])
# puts hand.evaluate == 'Straight'

# hand = PokerHand.new([
#   Card.new(3, 'Hearts'),
#   Card.new(3, 'Clubs'),
#   Card.new(5, 'Diamonds'),
#   Card.new(3, 'Spades'),
#   Card.new(6, 'Diamonds')
# ])
# puts hand.evaluate == 'Three of a kind'

# hand = PokerHand.new([
#   Card.new(9, 'Hearts'),
#   Card.new(9, 'Clubs'),
#   Card.new(5, 'Diamonds'),
#   Card.new(8, 'Spades'),
#   Card.new(5, 'Hearts')
# ])
# puts hand.evaluate == 'Two pair'

# hand = PokerHand.new([
#   Card.new(2, 'Hearts'),
#   Card.new(9, 'Clubs'),
#   Card.new(5, 'Diamonds'),
#   Card.new(9, 'Spades'),
#   Card.new(3, 'Diamonds')
# ])
# puts hand.evaluate == 'Pair'

# hand = PokerHand.new([
#   Card.new(2,      'Hearts'),
#   Card.new('King', 'Clubs'),
#   Card.new(5,      'Diamonds'),
#   Card.new(9,      'Spades'),
#   Card.new(3,      'Diamonds')
# ])
# puts hand.evaluate == 'High card'