require "pry"
class Game
    attr_reader :num_turns, :words, :winning_word
    def initialize
        @num_turns = 1
        @words = []
        @winning_word = nil
    end

    def start
        puts "Hello and welcome to the game"
        load_data
        set_winning_word
        puts "Ready to play! I've thought of a 5-letter word. You have 6 attempts to guess the word. Good luck!"

        until @num_turns == 7
            take_turn
        end

        game_over

    end

    def load_data
        lines = File.readlines("./data/words.txt")
        lines.each do |line|
            @words << line.delete("\n")
        end
        lines
    end

    def set_winning_word
        @winning_word = @words.sample
    end

    def take_turn
        puts "Turn #{@num_turns}! Guess a 5-letter word: "
        guess = gets.chomp.downcase

        comparison = compare_choice(guess)
        puts "Your guess had #{comparison.length} correct letters." 
        if comparison.length > 0
            comparison.each do |c|
                p c
            end
        end

        @num_turns += 1
    end

    def compare_choice(guess)
        winning_chars = @winning_word.chars
        guessing_chars = guess.chars

        included = []

        guessing_chars.each do |g|
            if winning_chars.include? g
                included << g
            end
        end

        included.uniq
    end

    def game_over
        puts "GAME OVER!" 
        puts "The word was #{@winning_word}. Play again!"
    end


end