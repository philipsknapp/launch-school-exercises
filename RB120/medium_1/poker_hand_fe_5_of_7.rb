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

class Hand
  include Comparable
  
  HAND_VALUES = { 'High card' => 1, 'Pair' => 2, 'Two pair' => 3,
                  'Three of a kind' => 4, 'Straight' => 5, 'Flush' => 6,
                  'Full house' => 7, 'Four of a kind' => 8,
                  'Straight flush' => 9, 'Royal flush' => 10 }

  attr_reader :cards
  
  def initialize(cards)
    @cards = cards
  end

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
  
  protected
  
  def score
    HAND_VALUES[ranking]
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

class PokerHand
  attr_reader :cards, :hands
  attr_writer :cards # testing only
  
  def initialize(deck)
    @cards = []
    7.times { @cards << deck.draw }
    generate_hands
  end

  def print
    puts cards
  end
  
  def best_hand
    highest_hand = hands[0]
    
    hands.each do |hand|
      if hand > highest_hand
        highest_hand = hand
      end
    end
    highest_hand
  end
  
  private
  
  def generate_hands
    @hands = []
    ignored_indices = unique_pairs((0...7).to_a)
    ignored_indices.each do |i1, i2|
      new_card_set = cards.dup
      new_card_set.delete_at(i2)
      new_card_set.delete_at(i1)
      hands << Hand.new(new_card_set)
    end
  end
  
  def unique_pairs(arr)
    arr.product(arr).map(&:sort).uniq.reject { |subarr| subarr[0] == subarr[1] }
  end
end

hand = PokerHand.new(Deck.new)
hand.print
puts ' '
hand.best_hand.print
p hand.best_hand.ranking