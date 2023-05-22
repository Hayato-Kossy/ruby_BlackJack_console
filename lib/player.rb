require_relative '../lib/participant'
class Player < Participant
    attr_accessor :action

    def initialize(deck)
        super(deck)
        @action = ""
    end

    def show_player_hands
        visualized_hand = "Your hand:"
        @hand.each do |card|
            visualized_hand += " " + card.to_s + " | "
        end
        puts visualized_hand
    end
end
