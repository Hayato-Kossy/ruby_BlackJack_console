require_relative '../lib/player'
require_relative '../lib/deck'
require_relative '../lib/dealer'

class TableBlackJack
    attr_accessor :player, :dealer, :deck

    def initialize
        @deck = Deck.new
        @player = Player.new(@deck)
        @dealer = Dealer.new(@deck)
    end

    def evaluate_winner
        message = ""
        if @player.status == "BlackJack" && @dealer.status != "BlackJack"
            message = "You Win"
        elsif @dealer.status == "BlackJack" && @player.status != "BlackJack"
            message = "Dealer Win"
        elsif @player.status != "Bust" && @dealer.status == "Bust"
            message = "You Win"
        elsif @player.status == "Bust" && @dealer.status != "Bust"
            message = "Dealer Win"
        elsif @player.score > @dealer.score
            message = "You Win"
        elsif @player.score < @dealer.score
            message = "Dealer Win"
        elsif @player.status == @dealer.status or @player.score == @dealer.score
            message = "Draw"
        end
        # @dealer.show_all_hands
        # puts @dealer.score
        # @player.show_all_hands
        # puts @player.score
        message
    end

    def game_process(action)
        if @player.status != "Bust"
            @player.action = action
        end

        if @player.action == "stand" or @player.status != "Bust"
            @player.calc_score
            # @player.status = "Player_Finished"
            while @dealer.calc_score < 16
                @dealer.draw(@deck)
                @dealer.calc_score
                @dealer.show_all_hands
                puts @dealer.score
                
                @player.show_all_hands
                puts @player.score
                
                status_process(@dealer)
            end
            evaluate_winner
        elsif action == "hit"
            @player.draw(@deck)
            @player.calc_score
            @dealer.calc_score
            status_process(@player)
            @dealer.show_one_hand
            puts @dealer.score 
            @player.show_all_hands
            puts @player.score
        end
    end

    def status_process(participant)
        if participant.calc_score == 21
            participant.status = "BlackJack"
        elsif participant.calc_score > 21
            participant.status = "Bust"
        end
    end
end


table = TableBlackJack.new
table.game_process("stand")