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

class PokerHand
  attr_reader :cards
  attr_writer :cards # testing only
  
  def initialize(deck)
    @cards = []
    5.times { @cards << deck.draw }
  end

  def print
    puts cards
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  def royal_flush?
    @cards.sort.map(&:rank) == [10, 'Jack', 'Queen', 'King', 'Ace'] && flush?
  end

  def straight_flush?
    straight? && flush?
  end

  def four_of_a_kind?
    Deck::RANKS.any? do |rank|
      cards.count { |card| card.rank == rank} == 4
    end
  end

  def full_house?
    return false unless three_of_a_kind?
    three_rank = Deck::RANKS.find do |rank|
      cards.count { |card| card.rank == rank } == 3
    end
    remaining_cards = cards.reject { |card| card.rank == three_rank }
    pair?(remaining_cards)
  end

  def flush?
    cards.all? { |card| card.suit == cards[0].suit }
  end

  def straight?
    card_ranks = cards.map { |card| Card::RANKING_VALUES[card.rank] }
    consecutive?(card_ranks)
  end

  def three_of_a_kind?
    Deck::RANKS.any? do |rank|
      cards.count { |card| card.rank == rank} == 3
    end
  end

  def two_pair?
    pair_ranks = Deck::RANKS.find_all do |rank|
      cards.count { |card| card.rank == rank } == 2
    end
    pair_ranks.size == 2
  end

  def pair?(card_set = cards)
    Deck::RANKS.any? do |rank|
      card_set.count { |card| card.rank == rank} == 2
    end
  end
  
  def consecutive?(arr)
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

hand = PokerHand.new(Deck.new)
hand.print
puts hand.evaluate

# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias_method :draw, :pop
end

# Test that we can identify each PokerHand type.
hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new('Queen', 'Clubs'),
  Card.new('King',  'Diamonds'),
  Card.new(10,      'Clubs'),
  Card.new('Ace',   'Hearts'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate == 'High card'