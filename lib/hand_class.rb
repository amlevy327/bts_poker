class Hand
  attr_reader :cards
  
  $HAND_RANK = %w(
    royal_flush
    straight_flush
    four_of_a_kind
    full_house
    flush
    straight
    three_of_a_kind
    two_pair
    one_pair
    high_card
  ).reverse_each.with_index(1).to_h.freeze

  def initialize(cards)
    # sort cards by rank score 
    @cards = cards.sort_by { |card| $RANK_SCORES[card.rank] }
  end

  # hash table of card rank scores and their corresponding count
  def hash_of_rank_count
    @rank_count = Hash.new
    @cards.each do |card|
      if @rank_count[card.rank]
        @rank_count[card.rank] += 1
      else
        @rank_count[card.rank] = 1
      end
    end
    return @rank_count
  end

  # example hand: 10S JS QS KS AS
  # rank pattern: 10, J, Q, K, A (exact 5 in a row)
  # suit pattern: 5 of same suit (flush)
  def royal_flush?
    required_straight = @cards[0].rank == '10' && @cards[1].rank == 'J' && @cards[2].rank == 'Q' && @cards[3].rank == 'K' && @cards[4].rank == 'A'
    return flush? && required_straight
  end

  # example hand: 2D 3D 4D 5D 6D
  # rank pattern: 5 in a row (straight)
  # suit pattern: 5 of same suit (flush)
  def straight_flush?
    return flush? && straight?
  end

  # example hand: 7H 7C 7D 7S 2S
  # rank pattern: 4 of the same rank
  # suit pattern: n/a
  def four_of_a_kind?
    return hash_of_rank_count.values.sort == [1,4]
  end

  # example hand: 7H 7C 7D 2S 2C
  # rank pattern: 3 of one rank, 2 of other rank
  # suit pattern: n/a
  def full_house?
    return hash_of_rank_count.values.sort == [2,3]
  end
  
  # example hand: 2D 3D 7D 8D 9D
  # rank pattern: n/a
  # suit pattern: 5 of the same suit
  def flush?
    return @cards.map(&:suit).uniq.length == 1
  end

  # example hand: 2H 3D 4D 5S 6D
  # rank pattern: 5 in a row
  # suit pattern: n/a
  def straight?
    return @cards.each_cons(2).map { |a,b| $RANK_SCORES[b.rank] - $RANK_SCORES[a.rank] }.uniq == [1]
  end

  # example hand: 7H 7C 7D 2S 9C
  # rank pattern: 3 of one rank, 1 of other rank, 1 of other rank
  # suit pattern: n/a
  def three_of_a_kind?
    # TODO: check this
    return hash_of_rank_count.values.sort == [1,1,3]
  end

  # example hand: 7H 7C 5D 5S 9C
  # rank pattern: 2 of one rank, 2 of other rank, 1 of other rank
  # suit pattern: n/a
  def two_pair?
    return hash_of_rank_count.values.sort == [1,2,2]
  end

  # example hand: 7H 7C 5D KS 9C
  # rank pattern: 2 of one rank, 1 of other rank, 1 of other rank, 1 of other rank
  # suit pattern: n/a
  def one_pair?
    return hash_of_rank_count.values.sort == [1,1,1,2]
  end
end