require 'card_class'

describe Card do
  new_card = Card.new("7S")
  
  context 'new card' do
    it 'tracks rank at init' do
      expect(new_card.rank).to eq("7")
    end

    it 'tracks suit at init' do
      expect(new_card.suit).to eq("S")
    end

    it 'returns correct string' do
      expect(new_card.to_s).to eq("7S")
    end
  end
end