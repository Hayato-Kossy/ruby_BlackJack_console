require_relative '../lib/participant'
class Dealer < Participant
    attr_accessor :score

    def initialize(deck)
        super(deck)
        @score = 0
    end

    def show_one_hand
        visualized_hand = "Dealer's hand: " + @hand[0].to_s + " | "
        visualized_hand
    end

    def show_all_hands
        visualized_hand = "Dealer's hand:"
        @hand.each do |card|
            visualized_hand += " " + card.to_s + " | "
        end
        visualized_hand
    end
end