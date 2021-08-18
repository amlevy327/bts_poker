require 'card_class'

# CARDS

CARD_7C = Card.new('7C')
CARD_7D = Card.new('7D')
CARD_7H = Card.new('7H')
CARD_7S = Card.new('7S')
CARD_8D = Card.new('8D')
CARD_9C = Card.new('9C')
CARD_9D = Card.new('9D')
CARD_10C = Card.new('10C')
CARD_JC = Card.new('JC')
CARD_JH = Card.new('JH')
CARD_QC = Card.new('QC')
CARD_KC = Card.new('KC')
CARD_AC = Card.new('AC')

# HANDS

STRAIGHT_FLUSH = "10C JC QC KC 9C"
FOUR_OF_A_KIND = "10C 10D 10S 10H 2S"
FULL_HOUSE = "10C 10D 10S 2H 2S"
FLUSH = "2C JC QC KC AC"
STRAIGHT = "9H 10H JC QC KC"
THREE_OF_A_KIND = "10C 10D 10S 2H 3S"
TWO_PAIR = "10C 10D 2S 2H 3S"
ONE_PAIR = "10C 10D 4S 2H 3S"
HIGH_CARD = "6C 10D 4S 2H 3S"