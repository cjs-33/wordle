require './lib/game'

RSpec.describe Game do
    before :each do 
        @game = Game.new
    end

    it "exists" do
        expect(@game).to be_instance_of Game
    end

    it "can load data" do
        @game.load_data
        expect(@game.words).to be_instance_of Array
        expect(@game.words.length).not_to eq(0)
    end

    it "can produce a random word" do
        @game.load_data
        @game.set_winning_word
        expect(@game.winning_word.length).to eq(5)
    end

    it "can start the game" do
        @game.start
        expect(@game.winning_word.length).to eq(5)
        expect(@game.words.length).to eq(5757)
    
    end

end