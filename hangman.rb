#HANGMAN GAME

class Player
    attr_reader :language

    def initialize(player_name, language)
        @player_name = player_name
        @language = language
        @score = 0
    end

end

class Game
    attr_reader :player_word

    def initialize(player)
        @player = player
        @dictionary
        @player_word
    end

    def load_dictionary
        if @player.language == "Spanish"
            @dictionary = File.readlines "hangman/listado.txt"
        else
            @dictionary = File.readlines "hangman/5desk.txt"
        end

    end

    def play
        load_dictionary
        @player_word = @dictionary.sample
        puts @player_word
        
    end
end

player = Player.new("n0xx", "Spanish")
game = Game.new(player)
game.play