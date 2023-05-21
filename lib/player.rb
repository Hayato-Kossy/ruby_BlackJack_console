class Player  
    attr_accessor :hand

    def initialize(deck)
        @hand = []
        2.times do
            draw(deck)
        end
    end

    def draw(deck)
        @hand << deck.cards.pop
    end

    def show_hand
        visualized_hand = "Your hand:"
        @hand.each do |card|
            visualized_hand += " " + card.to_s + " | "
        end
        visualized_hand
    end
end
