require_relative '../lib/player'
require_relative '../lib/deck'
require_relative '../lib/dealer'

class TableBlackJack
    attr_accessor :player, :dealer, :deck

    def initialize
        @deck = Deck.new
        @player = Player.new(@deck)
        @dealer = Dealer.new(@deck)
        @dealer.calc_score
        @player.calc_score
    end

    def evaluate_winner
        @dealer.calc_score
        @player.calc_score
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
        puts message
    end

    def game_process(action)
        @player.action = action
        if action == "stand"
            @player.status = "Player_Finished"
            while @dealer.score < 17
                @dealer.draw(@deck)
                @dealer.calc_score
                @dealer.show_dealer_all_hands
                puts @dealer.score
                @player.show_player_hands
                puts @player.score
                status_process(@dealer)
            end
        elsif action == "hit"
            @player.draw(@deck)
            status_process(@player)
            @dealer.show_dealer_one_hand
            @player.show_player_hands
        end

        if @dealer.score >= 16
            evaluate_winner
        end
    end

    def status_process(participant)
        if participant.calc_score == 21
            participant.status = "BlackJack"
        elsif participant.calc_score > 21
            participant.status = "Bust"
        end
    end

    # def game_finish(participant)

    # end
end


table = TableBlackJack.new
table.game_process("stand")