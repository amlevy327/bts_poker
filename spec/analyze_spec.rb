require 'spec_helper.rb'
require 'analyze'
include Analyze

describe Analyze do
  context 'check user input' do
    it 'identifies no special characters' do
      user_input = 'AC 7D 2H 8D 3H'
      expect(no_special_characters?(user_input)).to eq(true)
    end

    it 'identifies special characters' do
      user_input = ['AC', '7D', '2H', '8D', '3H']
      expect(no_special_characters?(user_input)).to eq(false)
    end

    it 'identifies if hand is five cards' do
      user_input = ['AC', '7D', '2H', '8D', '3H']
      expect(five_cards?(user_input)).to eq(true)
    end

    it 'identifies if hand is not five cards' do
      user_input = ['AC', '7D', '2H', '8D']
      expect(five_cards?(user_input)).to eq(false)
    end

    it 'identifies duplicates in hand' do
      user_input = ['AC', '7D', '2H', '8D', 'AC']
      expect(no_duplicates?(user_input)).to eq(false)
    end

    it 'identifies if no duplicates in hand' do
      user_input = ['AC', '7D', '2H', '8D', '3H']
      expect(no_duplicates?(user_input)).to eq(true)
    end

    it 'identifies correct ranks for all cards in hand' do
      user_input = ['AC', '7D', '2H', '8D', 'AC']
      expect(valid_ranks?(user_input)).to eq(true)
    end

    it 'identifies if there is an incorrect ranked card in hand' do
      user_input = ['ZC', '7D', '2H', '8D', '3H']
      expect(valid_ranks?(user_input)).to eq(false)
    end

    it 'identifies correct suits for all cards in hand' do
      user_input = ['AC', '7D', '2H', '8D', 'AC']
      expect(valid_suits?(user_input)).to eq(true)
    end

    it 'identifies if there is an incorrect suited card in hand' do
      user_input = ['QA', '7D', '2H', '8D', '3H']
      expect(valid_suits?(user_input)).to eq(false)
    end
  end
end