require 'spec_helper.rb'
require 'hand_class'

describe Hand do
  context 'initialization' do
    it 'sorts hand' do
      new_hand = Hand.new([CARD_JC, CARD_7C, CARD_QC, CARD_10C, CARD_KC])
      expect(new_hand.cards).to eq([CARD_7C, CARD_10C, CARD_JC, CARD_QC, CARD_KC])
    end
  end

  context 'evaluating hand' do
    it 'calculates hash of rank count' do
      new_hand = Hand.new([CARD_7C, CARD_AC, CARD_7D, CARD_7S, CARD_JC])
      expect(new_hand.hash_of_rank_count['7']).to eq(3)
      expect(new_hand.hash_of_rank_count['J']).to eq(1)
      expect(new_hand.hash_of_rank_count['A']).to eq(1)
    end
    
    it 'identifies straight flush' do
      new_hand = Hand.new([CARD_JC, CARD_9C, CARD_KC, CARD_10C, CARD_QC])
      expect(new_hand.straight_flush?).to eq(true)
    end

    it 'identifies four of a kind' do
      new_hand = Hand.new([CARD_7C, CARD_7H, CARD_7D, CARD_7S, CARD_JC])
      expect(new_hand.four_of_a_kind?).to eq(true)
    end

    it 'identifies full house' do
      new_hand = Hand.new([CARD_7C, CARD_9C, CARD_7D, CARD_7S, CARD_9D])
      expect(new_hand.full_house?).to eq(true)
    end

    it 'identifies flush' do
      new_hand = Hand.new([CARD_7C, CARD_9C, CARD_9C, CARD_JC, CARD_QC])
      expect(new_hand.flush?).to eq(true)
    end

    it 'identifies straight' do
      new_hand = Hand.new([CARD_7S, CARD_8D, CARD_9D, CARD_10C, CARD_JH])
      expect(new_hand.straight?).to eq(true)
    end

    it 'identifies three of a kind' do
      new_hand = Hand.new([CARD_7S, CARD_7D, CARD_7S, CARD_10C, CARD_JH])
      expect(new_hand.three_of_a_kind?).to eq(true)
    end

    it 'identifies two pair' do
      new_hand = Hand.new([CARD_7S, CARD_7D, CARD_9C, CARD_9D, CARD_JH])
      expect(new_hand.two_pair?).to eq(true)
    end

    it 'identifies one pair' do
      new_hand = Hand.new([CARD_7S, CARD_7D, CARD_10C, CARD_9D, CARD_JH])
      expect(new_hand.one_pair?).to eq(true)
    end
  end
end