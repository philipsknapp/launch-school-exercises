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
  include Comparable
  
  HAND_VALUES = { 'High card' => 0, 'Pair' => 1, 'Two pair' => 23,
                  'Three of a kind' => 24, 'Straight' => 25, 'Flush' => 26,
                  'Full house' => 27, 'Four of a kind' => 28, 'Royal Flush' => 29}
  
  def initialize(deck)
    @cards = []
    5.times { @cards << deck.draw }
  end
  
  attr_reader :cards
  attr_writer :cards # testing only
  
  def print
    puts cards
  end
  
  def <=> other
    higher_ranking = score <=> other.score
    return higher_ranking if higher_ranking != 0
    self_sorted_hand, other_sorted_hand = [self, other].map do |hand|
      hand.cards.map { |card| Card::RANKING_VALUES[card.rank] }.sort.reverse
    end
    self_sorted_hand <=> other_sorted_hand
  end
  
  def ranking
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
  
  alias_method :evaluate, :ranking
  
  protected
  
  def score
    HAND_VALUES[ranking]
  end
  
  private
  
  def high_card_value
    Card::RANKING_VALUES[cards.max.rank]
  end
  
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


# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias_method :draw, :pop
end

# Test that we can identify each PokerHand type.
hand1 = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new(10,   'Hearts'),
  Card.new('Queen', 'Spades'),
  Card.new(10,  'Hearts'),
  Card.new('Queen',  'Hearts')
])

hand2 = PokerHand.new([
  Card.new(9,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Spades'),
  Card.new(9,      'Clubs'),
  Card.new('Queen',  'Clubs')
])

puts hand1 > hand2
