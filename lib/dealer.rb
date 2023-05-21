class Dealer  #継承を使う予定
    attr_accessor :hand

    def initialize(deck)
        @hand = []
        2.times do
            draw(deck)
        end
    end

    def draw(deck)
        @hand << deck.cards.pop
    end

    def show_one_hand
        visualized_hand = "Dealer's hand: " + @hand[0].to_s + " | "
        visualized_hand
    end

    def show_all_hands
        visualized_hand = "Dealer's hand:"
        @hand.each do |card|
            visualized_hand += " " + card.to_s + " | "
        end
        visualized_hand
    end


end