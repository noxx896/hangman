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
            @dictionary = File.readlines "listado.txt"
        else
            @dictionary = File.readlines "5desk.txt"
        end

    end

    def play
        flag = false
        aux_2 = []

        load_dictionary
        @player_word = @dictionary.sample
        aux = @player_word.split("")
        aux.delete("\n")
        aux.delete("\r")
        aux.size.times do 
            aux_2.push(" ")
        end
        
        print @player_word
        print aux
        until flag
            puts "Enter a letter:"
            user_choise = gets.chomp
            aux.each_with_index do |letter, index|
                aux_2[index] = letter if letter == user_choise  
            end
            print aux_2
            flag = true unless aux_2.include?(" ")
            
        end
        
    end
end

player = Player.new("n0xx", "Spanish")
game = Game.new(player)
game.play