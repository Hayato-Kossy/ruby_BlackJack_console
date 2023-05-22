class Participant
    attr_accessor :hand, :score, :status, :message

    def initialize(deck)
        @hand = []
        2.times do
            draw(deck)
        end
        @score = 0
        @status = "Playing" #BlackJack or Bust
        @message = ""
    end

    def draw(deck)
        @hand << deck.cards.pop
    end

    def calc_score
        @score = 0
        values = ['Ace','Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight', 'Nine', 'Ten', 'Jack', 'Queen', 'King']
    
        ace_count = 0
        @hand.each do |card|
            if card.to_s_only_value == 'Ace'
                ace_count += 1
                @score += 11  # まずエースを11として計算
            else
                @score += values.index(card.to_s_only_value) + 1 >= 11 ? 10 : values.index(card.to_s_only_value) + 1
            end
        end
    
        # スコアが21を超えて、かつエースが存在する場合は、エースを1として扱う
        while @score > 21 && ace_count > 0
            @score -= 10  # 11を1にするため10を引く
            ace_count -= 1
        end
    
        @score
    end
    

    def show_one_hand
        @message = @hand[0].to_s + " | "
        puts @player_message + @message
        @message = ""
    end

    def show_all_hands
        @hand.each do |card|
            @message +=  " " + card.to_s + " | "
        end
        puts @player_message + @message
        @message = ""
    end

    private

        def count_ace
            count = 0
            @hand.each { |card| count += 1 if card.to_s_only_value == "Ace" }
            count
        end
end