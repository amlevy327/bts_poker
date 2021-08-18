require_relative 'spec_helper.rb'
require 'main'

describe 'main' do
  context 'check and analyze user input' do
    it 'identifies straight flush' do
      expect(check_user_input(STRAIGHT_FLUSH)).to eq(['Straight Flush', 9])
    end

    it 'identifies four of a kind' do
      expect(check_user_input(FOUR_OF_A_KIND)).to eq(['Four Of A Kind', 8])
    end

    it 'identifies full house' do
      expect(check_user_input(FULL_HOUSE)).to eq(['Full House', 7])
    end

    it 'identifies flush' do
      expect(check_user_input(FLUSH)).to eq(['Flush', 6])
    end

    it 'identifies straight' do
      expect(check_user_input(STRAIGHT)).to eq(['Straight', 5])
    end

    it 'identifies three of a kind' do
      expect(check_user_input(THREE_OF_A_KIND)).to eq(['Three Of A Kind', 4])
    end

    it 'identifies two pair' do
      expect(check_user_input(TWO_PAIR)).to eq(['Two Pair', 3])
    end

    it 'identifies one pair' do
      expect(check_user_input(ONE_PAIR)).to eq(['One Pair', 2])
    end

    it 'identifies high card' do
      expect(check_user_input(HIGH_CARD)).to eq(['High Card', 1, "10D"])
    end
  end
end