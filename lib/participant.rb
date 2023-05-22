class Participant
    attr_accessor :hand, :score, :status

    def initialize(deck)
        @hand = []
        2.times do
            draw(deck)
        end
        @score = 0
        @status = "Playing" #BlackJack or Bust
    end

    def draw(deck)
        @hand << deck.cards.pop
    end

    def calc_score
        @score = 0
        values = ['Ace','Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight', 'Nine', 'Ten', 'Jack', 'Queen', 'King']

        @hand.each do |card|
            @score += values.index(card.to_s_only_value) + 1 >= 11 ? 10 : values.index(card.to_s_only_value) + 1
        end
        ace = count_ace
        if ace > 0
            while ace > 0 
                if @score < 21
                    @score += 10
                    ace -= 1
                elsif @score > 21
                    @score -= 10
                    ace -= 1
                end
            end
        end
        @score
    end

    private

        def count_ace
            count = 0
            @hand.each { |card| count += 1 if card.to_s_only_value == "Ace" }
            count
        end
end