class Card
  include Comparable

  RANKING_VALUES = { 2 => 2, 3 => 3, 4 => 4, 5 => 5,
                     6 => 6, 7 => 7, 8 => 8, 9 => 9,
                     10 => 10, 'Jack' => 11, 'Queen' => 12,
                     'King' => 13, 'Ace' => 14
                    }
  
  SUIT_VALUES = { 'Diamonds' => 1, 'Clubs' => 2, 'Hearts' => 3, 'Spades' => 4 }
  
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def <=>(other)
    case RANKING_VALUES[rank] <=> RANKING_VALUES[other.rank]
    when 1 then 1
    when -1 then -1
    when 0
      SUIT_VALUES[suit] <=> SUIT_VALUES[other.suit]
    end
  end
  
  # def ==(other)
  #   other.class == Card && rank == other.rank && suit == other.suit
  # end
  
  def to_s
    "#{rank} of #{suit}"
  end
end

cards = [Card.new(2, 'Hearts'),
         Card.new(10, 'Diamonds'),
         Card.new(10, 'Clubs')]
puts cards
puts cards.min == Card.new(2, 'Hearts')
puts cards.max == Card.new(10, 'Clubs')