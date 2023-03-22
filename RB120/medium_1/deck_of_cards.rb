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

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
p 52.times { drawn2 << deck.draw }
p drawn != drawn2 # Almost always.