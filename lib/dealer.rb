require_relative '../lib/participant'
class Dealer < Participant
    attr_accessor :player_message

    def initialize(deck)
        super(deck)
        @player_message = "Dealer's hand: "
    end
end