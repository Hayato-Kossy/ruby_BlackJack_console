require_relative '../lib/player'
require_relative '../lib/deck'
require_relative '../lib/dealer'

class TableBlackJack
    attr_accessor :player, :dealer, :deck

    def initialize
        @deck = Deck.new
        @player = Player.new(@deck)
        # @dealer = Dealer.new(@deck) # assume Dealer class is implemented similarly to Player
    end
end


table = TableBlackJack.new
puts table.player.show_hand