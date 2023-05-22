require 'rspec'
require_relative '../lib/player'
require_relative '../lib/deck'
require_relative '../lib/dealer'
require_relative '../lib/table_blackjack'

describe TableBlackJack do
    before do
    @table = TableBlackJack.new
    end

    it 'should initialize a deck, a player and a dealer' do
        expect(@table.deck).to be_instance_of(Deck)
        expect(@table.player).to be_instance_of(Player)
        expect(@table.dealer).to be_instance_of(Dealer)
    end

    it 'should have initial player and dealer status as "Playing"' do
        expect(@table.player.status).to eq("Playing")
        expect(@table.dealer.status).to eq("Playing")
    end

    it 'should be able to change player status' do
        @table.player.status = "BlackJack"
        expect(@table.player.status).to eq("BlackJack")
    end

    it 'should be able to change dealer status' do
        @table.dealer.status = "Bust"
        expect(@table.dealer.status).to eq("Bust")
    end

    context '#status_process' do
        it 'should change participant status to "BlackJack" if score equals 21' do
        @table.player.score = 21
        @table.status_process(@table.player)
        expect(@table.player.status).to eq("BlackJack")
        end

        it 'should change participant status to "Bust" if score is greater than 21' do
        @table.player.score = 22
        @table.status_process(@table.player)
        expect(@table.player.status).to eq("Bust")
        end
    end

    context '#evaluate_winner' do
        it 'should determine the winner correctly' do
        @table.player.score = 21
        @table.player.status = "BlackJack"
        @table.dealer.score = 20
        expect(@table.evaluate_winner).to eq("You Win")
        end
    end
end
