require_relative '../lib/card'
class Deck 
    SUITS = ['Hearts', 'Diamonds', 'Clubs', 'Spades']
    VALUES = ['Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eignt', 'Nine', 'Ten', 'Jack', 'Queen', 'King', 'Ace']

    attr_accessor :cards

    def initialize
        @cards = []
        SUITS.each do |suit|
        VALUES.each do |value|
            card = Card.new(suit, value)
            @cards << card.to_s
            end
        end
        # ここにシャッフルを入れるかは考え中
        @cards.shuffle!
    end
end

