class Card
  attr_reader :rank, :suit

  # TODO: notes on how card is structured (8D)

  $RANKS = %w(2 3 4 5 6 7 8 9 10 J Q K A).freeze # TODO: change order?
  $RANK_SCORES = $RANKS.each_with_index.to_h
  $SUITS = %w(H D C S).freeze

  def initialize(card)
    @rank = card[0..-2]
    @suit = card[-1]
  end
  
  def to_s
    return "#{@rank}#{@suit}"
  end
end