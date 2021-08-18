require_relative "card_class"
require_relative "hand_class"

module Analyze
  def no_special_characters?(user_input)
    return !user_input.index(/[^:alnum:]/).nil?
  end

  def five_cards?(user_input)
    return user_input.length == 5
  end

  def no_duplicates?(user_input)
    return user_input.uniq.length == 5
  end

  def valid_ranks?(user_input)
    for card in user_input
      if !$RANKS.include?(card[0..-2])
        return false
      end
    end
    return true
  end

  def valid_suits?(user_input)
    for card in user_input
      if !$SUITS.include?(card[-1].capitalize)
        return false
      end
    end
    return true
  end

  def create_and_evaluate_hand(user_input)
    hand_array = []

    # create cards
    for card in user_input
      hand_array.push(Card.new(card))
    end

    # create hand
    hand = Hand.new(hand_array)

    # check hand pattern
    # return array: [name of hand, hand rank, high card (optional)]
    if hand.straight_flush?
      return ['Straight Flush', $HAND_SCORES['straight_flush']]
    elsif hand.four_of_a_kind?
      return ['Four Of A Kind', $HAND_SCORES['four_of_a_kind']]
    elsif hand.full_house?
      return ['Full House', $HAND_SCORES['full_house']]
    elsif hand.flush?
      return ['Flush', $HAND_SCORES['flush']]
    elsif hand.straight?
      return ['Straight', $HAND_SCORES['straight']]
    elsif hand.three_of_a_kind?
      return ['Three Of A Kind', $HAND_SCORES['three_of_a_kind']]
    elsif hand.two_pair?
      return ['Two Pair', $HAND_SCORES['two_pair']]
    elsif hand.one_pair?
      return ['One Pair', $HAND_SCORES['one_pair']]
    else
      return ['High Card', $HAND_SCORES['high_card'], hand.cards.last.to_s]
    end
  end
  
  def check_user_input(user_input)
    if !no_special_characters?(user_input)
      return ["ERROR!\nHand can't contain symbols.\nExample input: KC 10C QC 9C JC.", 0]
      puts("ERROR!\nHand can't contain symbols.\nExample input: KC 10C QC 9C JC.")
    elsif !five_cards?(user_input.split(" "))
      puts("ERROR!\nHand must have 5 cards.\nExample input: KC 10C QC 9C JC.")
    elsif !no_duplicates?(user_input.split(" "))
      puts("ERROR!\nHand can't have duplicates.\nExample input: KC 10C QC 9C JC.")
    elsif !valid_ranks?(user_input.split(" "))
      puts("ERROR!\nAll cards in hand must have a valid rank.\nValid ranks are #{$RANKS}.\nExample input: KC 10C QC AC JC.")
    elsif !valid_suits?(user_input.split(" "))
      puts("ERROR!\nAll cards in hand must have a valid suit.\nValid suits are #{$SUITS}.\nExample input: KC 10C QC AC JC.")
    else
      create_and_evaluate_hand(user_input.split(" "))
    end
  end
end