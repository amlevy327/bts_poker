class Card
  attr_reader :rank, :suit

  # Example card: 8D (8 of diamonds)
  # Card is made of 2 components, rank (first) and suit (second)

  # This feels wrong (I think A should be high), but is how it was listed in the spec
  $RANKS = %w(A 2 3 4 5 6 7 8 9 10 J Q K).freeze
  # Hash table of rank to score
  $RANK_SCORES = $RANKS.each_with_index.to_h
  $SUITS = %w(H D C S).freeze

  def initialize(card)
    # Just be 0..-2 to account for the rank of 10
    @rank = card[0..-2]
    @suit = card[-1]
  end
  
  def to_s
    return "#{@rank}#{@suit}"
  end
end