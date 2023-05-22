require_relative '../lib/participant'
class Dealer < Participant

    def initialize(deck)
        super(deck)
    end

    def show_dealer_one_hand
        visualized_hand = "Dealer's card: " + @hand[0].to_s + " | "
        puts visualized_hand
    end

    def show_dealer_all_hands
        visualized_hand = "Dealer's hand:"
        @hand.each do |card|
            visualized_hand += " " + card.to_s + " | "
        end
        puts visualized_hand
    end
end