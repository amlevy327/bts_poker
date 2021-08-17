require_relative "card_class"
require_relative "hand_class"

module Analyze
  def no_special_characters?(user_input_hand)
    return !user_input_hand.index(/[^:alnum:]/).nil?
  end

  def five_cards?(user_input_hand)
    return user_input_hand.length == 5
  end

  def no_duplicates?(user_input_hand)
    return user_input_hand.uniq.length == 5
  end

  # TODO: more efficient
  def valid_ranks?(user_input_hand)
    for card in user_input_hand
      if !$RANKS.include?(card[0..-2])
        return false
      end
    end
    return true
  end

  # TODO: more efficient
  def valid_suits?(user_input_hand)
    for card in user_input_hand
      if !$SUITS.include?(card[-1].capitalize)
        return false
      end
    end
    return true
  end

  def create_and_evaluate_hand(hand_input)
    hand_temp = []

    # create cards
    for card in hand_input
      hand_temp.push(Card.new(card))
    end

    # create hand
    hand = Hand.new(hand_temp)

    # check hand pattern
    # return array: [name of hand, hand rank, high card (optional)]
    if hand.royal_flush?
      return ['Royal Flush', $HAND_RANK['royal_flush']]
    elsif hand.straight_flush?
      return ['Straight Flush', $HAND_RANK['straight_flush']]
    elsif hand.four_of_a_kind?
      return ['Four Of A Kind', $HAND_RANK['four_of_a_kind']]
    elsif hand.full_house?
      return ['Full House', $HAND_RANK['full_house']]
    elsif hand.flush?
      return ['Flush', $HAND_RANK['flush']]
    elsif hand.straight?
      return ['Straight', $HAND_RANK['straight']]
    elsif hand.three_of_a_kind?
      return ['Three Of A Kind', $HAND_RANK['three_of_a_kind']]
    elsif hand.two_pair?
      return ['Two Pair', $HAND_RANK['two_pair']]
    elsif hand.one_pair?
      return ['One Pair', $HAND_RANK['one_pair']]
    else
      return ['High Card', $HAND_RANK['high_card'], hand.cards.last.to_s]
    end
  end
  
  def check_user_input(user_input_hand)
    if !no_special_characters?(user_input_hand)
      return ["ERROR!\nHand can't contain symbols.\nExample input: KC 10C QC AC JC.", 0]
      puts("ERROR!\nHand can't contain symbols.\nExample input: KC 10C QC AC JC.")
    elsif !five_cards?(user_input_hand.split(" "))
      puts("ERROR!\nHand must have 5 cards.\nExample input: KC 10C QC AC JC.")
    elsif !no_duplicates?(user_input_hand.split(" "))
      puts("ERROR!\nHand can't have duplicates.\nExample input: KC 10C QC AC JC.")
    elsif !valid_ranks?(user_input_hand.split(" "))
      puts("ERROR!\nAll cards in hand must have a valid rank.\nValid ranks are #{$RANKS}.\nExample input: KC 10C QC AC JC.")
    elsif !valid_suits?(user_input_hand.split(" "))
      puts("ERROR!\nAll cards in hand must have a valid suit.\nValid suits are #{$SUITS}.\nExample input: KC 10C QC AC JC.")
    else
      create_and_evaluate_hand(user_input_hand.split(" "))
    end
  end
end