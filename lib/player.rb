require_relative '../lib/participant'
class Player < Participant
    attr_accessor :action, :player_message

    def initialize(deck)
        super(deck)
        @action = ""
        @player_message = "Your hand:"
    end
end
