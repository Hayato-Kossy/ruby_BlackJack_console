require_relative '../lib/participant'
class Player < Participant
    attr_accessor :score

    def initialize(deck)
        super(deck)
        @score = 0
    end

    def show_player_hands
        visualized_hand = "Your hand:"
        @hand.each do |card|
            visualized_hand += " " + card.to_s + " | "
        end
        visualized_hand
    end
end
