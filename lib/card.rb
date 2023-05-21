class Card  
    attr_reader :suit, :value

    def initialize(suit, value)
        @suit = suit
        @value = value
    end

    def to_s
        "#{value} of #{suit}"
    end

    def to_s_only_value
        "#{value}"
    end
end