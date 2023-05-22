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
        message
    end

    def result_message
        message = evaluate_winner
        puts "========================================================================"
        puts "Final hand"
        puts
        show_score_and_hands(@dealer)
        puts "========================================================================"
        show_score_and_hands(@player) 
        puts "========================================================================"
        puts
        puts message
    end

    def game_process(action)
        @player.action = action
        if @player.action == "stand" or @player.status == "Bust"
            @player.calc_score
            @dealer.calc_score
            @player.status = "Player_Finished"
            while @dealer.score < 16
                if @dealer.calc_score >= 16
                    break
                end
                @dealer.draw(@deck)
                status_process(@player)
                status_process(@dealer)
                @dealer.show_one_hand
                @player.show_all_hands    
            end
            result_message
        elsif @player.action == "hit"
            @player.draw(@deck)
            @player.calc_score
            @dealer.calc_score
            status_process(@player)
            prompt_user
        end
    end

    def status_process(participant)
        if participant.calc_score == 21
            participant.status = "BlackJack"
        elsif participant.calc_score > 21
            participant.status = "Bust"
        end
    end

    def show_score_and_hands(participant)
        participant.show_all_hands
        puts participant.player_message + " " + participant.score.to_s
    end

    def prompt_user

        if @player.status == "Bust"
            game_process("Bust")
            return 
        end
        puts "ヒットするかスタンドするか選んでください ('hit' または 'stand')"
        action = gets.chomp.downcase  # ユーザーの入力を取得し、末尾の改行文字を削除します
        if ['hit', 'stand'].include?(action)
            game_process(action)
        else
            puts "無効なアクションです。'hit' または 'stand' を入力してください。"
            prompt_user  # 入力が無効だった場合、ユーザーに再度プロンプトを表示します
        end
    end

    def putting_on_cards
        puts "========================================================================"
        @dealer.show_one_hand
        puts "========================================================================"
        @player.show_all_hands
        puts "========================================================================"
    end
end


table = TableBlackJack.new
table.prompt_user