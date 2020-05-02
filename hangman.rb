#HANGMAN GAME
require "yaml"

class Player
    attr_accessor :name, :player_word, :attempts, :language

    def initialize
        @name
        @language = "English"
        @player_word  = ""
        @attempts = 0
    end

    def choose_name
        puts "Enter your name:"
        @name = gets.chomp
    end

end

class Game
    #attr_reader :player_word
    #attr_reader :attempts

    def initialize(player)
        @player = player
    end

    def load_dictionary
        if @player.language == "Spanish"
            @dictionary = File.readlines "listado.txt"
        else
            @dictionary = File.readlines "5desk.txt"
        end

    end


    def save_game(option, word_array, aux_word_array)
        if option.downcase == "y"
            yaml = YAML::dump({
                :player_name => @player.name,
                :player_word_array => word_array,
                :aux_word_array => aux_word_array,
                :attempts => @player.attempts
            })
            if File.exists? "game_saver.yaml"
                File.open("game_saver.yaml", "a") do |file|
                    file.puts(yaml)
                end
                puts "Game saved!"
            else
                File.open("game_saver.yaml", "w") do |file|
                    file.puts (yaml)
                end
                puts "Game saved!"

            end
        else
            puts "Game not saved"
        end
        
    end

    def load_game
        puts "Enter player name:"
        name = gets.chomp
        players = YAML::load_stream(File.read "game_saver.yaml")
        bandera = true
        players.each do |player|
            return player[:player_word_array], player[:aux_word_array], player[:attempts] if player[:player_name] == name
        end
    end

    def play
        flag = false
        aux_2 = []

        load_dictionary
        @player.player_word = @dictionary.sample
        aux = @player.player_word.split("")
        aux.delete("\n")
        aux.delete("\r")

        aux.size.times do 
           aux_2.push("_")
        end
        
        print "antes 1 #{aux}\n antes 2 #{aux_2}"
    
        print @player_word
        puts "Do you want to star new game or load game?\tn/l"
        case start = gets.chomp
            when "n" then @player.choose_name
            when "l" then aux, aux_2 ,@player.attempts= load_game
            else @player.choose_name
        end
        print "primer #{aux}\nsegundo #{aux_2}"
        until flag
            print "Do you want to save the current game?\ty/n\n"
            save_current_game = gets.chomp
            save_game(save_current_game, aux, aux_2)

            print "\nEnter a letter: "
            user_choise = gets.chomp
            @player.attempts += 1 unless aux.include?(user_choise)

            aux.each_with_index do |letter, index|
                aux_2[index] = letter if letter.downcase == user_choise                

            end
            
            aux_2.each_with_index do |letter, index|
                if index != aux_2.size-1
                    print "#{letter} "
                else
                    print "#{letter}\n"
                end
            end

            #print "- "*aux.size + "\n"
            display_hangman(@player.attempts)
            if @player.attempts == 7 || !aux_2.include?("_") 
                flag = true
                puts "YOU LOSE" if @player.attempts == 7
                puts "YOU WIN!!" if !aux_2.include?("_")
                
            end
            
        end
        
    end

    def display_hangman(player_attempts)
        
        case player_attempts
            when 0
                puts " "*2 + "_"*15, " |\n"*16

            when 1
                puts " "*2 + "_"*15,
                     " |" + " "*15 + "|",
                     " |" + " "*15 + "|", " |\n"*14
                
            when 2
                puts " "*2 + "_"*15,
                     " |" + " "*15 + "|",
                     " |" + " "*15 + "|",
                     " |" + " "*13 + "_"*2 +"|" + "_"*2,
                     " |" + " "*12 + "/" + " "*5 + 92.chr,
                     " |" + " "*11 + "|" + " "*7 + "|",
                     " |" + " "*12 + 92.chr + "_"*2 + " " + "_"*2 +"/", " |\n"*10
            when 3
                puts " "*2 + "_"*15,
                     " |" + " "*15 + "|",
                     " |" + " "*15 + "|",
                     " |" + " "*13 + "_"*2 +"|" + "_"*2,
                     " |" + " "*12 + "/" + " "*5 + 92.chr,
                     " |" + " "*11 + "|" + " "*7 + "|",
                     " |" + " "*12 + 92.chr + "_"*2 + " " + "_"*2 +"/",
                     " |" + " "*15 + "|",
                     " |" + " "*15 + "|",
                     " |" + " "*15 + "|",
                     " |" + " "*15 + "|",
                     " |" + " "*15 + "|",
                     " |" + " "*15 + "|",
                     " |" + " "*15 + "|", " |\n"*3
            when 4
                puts " "*2 + "_"*15,
                     " |" + " "*15 + "|",
                     " |" + " "*15 + "|",
                     " |" + " "*13 + "_"*2 +"|" + "_"*2,
                     " |" + " "*12 + "/" + " "*5 + 92.chr,
                     " |" + " "*11 + "|" + " "*7 + "|",
                     " |" + " "*12 + 92.chr + "_"*2 + " " + "_"*2 +"/",
                     " |" + " "*15 + "|",
                     " |" + " "*14 + "/" + "|",
                     " |" + " "*13 + "/" + " " + "|",
                     " |" + " "*12 + "/" + " "*2 + "|",
                     " |" + " "*15 + "|",
                     " |" + " "*15 + "|",
                     " |" + " "*15 + "|", " |\n"*3
            when 5
                puts " "*2 + "_"*15,
                     " |" + " "*15 + "|",
                     " |" + " "*15 + "|",
                     " |" + " "*13 + "_"*2 +"|" + "_"*2,
                     " |" + " "*12 + "/" + " "*5 + 92.chr,
                     " |" + " "*11 + "|" + " "*7 + "|",
                     " |" + " "*12 + 92.chr + "_"*2 + " " + "_"*2 +"/",
                     " |" + " "*15 + "|",
                     " |" + " "*14 + "/" + "|" + 92.chr,
                     " |" + " "*13 + "/" + " " + "|" + " " + 92.chr,
                     " |" + " "*12 + "/" + " "*2 + "|" + " "*2 + 92.chr,
                     " |" + " "*15 + "|",
                     " |" + " "*15 + "|",
                     " |" + " "*15 + "|", " |\n"*3
            when 6
                puts " "*2 + "_"*15,
                    " |" + " "*15 + "|",
                    " |" + " "*15 + "|",
                    " |" + " "*13 + "_"*2 +"|" + "_"*2,
                    " |" + " "*12 + "/" + " "*5 + 92.chr,
                    " |" + " "*11 + "|" + " "*7 + "|",
                    " |" + " "*12 + 92.chr + "_"*2 + " " + "_"*2 +"/",
                    " |" + " "*15 + "|",
                    " |" + " "*14 + "/" + "|" + 92.chr,
                    " |" + " "*13 + "/" + " " + "|" + " " + 92.chr,
                    " |" + " "*12 + "/" + " "*2 + "|" + " "*2 + 92.chr,
                    " |" + " "*15 + "|",
                    " |" + " "*15 + "|",
                    " |" + " "*15 + "|",
                    " |" + " "*14 + "/",
                    " |" + " "*13 + "/",
                    " |" + " "*12 + "/",
                    " |" + " "*11 + "/"
            when 7
                puts " "*2 + "_"*15,
                    " |" + " "*15 + "|",
                    " |" + " "*15 + "|",
                    " |" + " "*13 + "_"*2 +"|" + "_"*2,
                    " |" + " "*12 + "/" + " "*5 + 92.chr,
                    " |" + " "*11 + "|" + " "*7 + "|",
                    " |" + " "*12 + 92.chr + "_"*2 + " " + "_"*2 +"/",
                    " |" + " "*15 + "|",
                    " |" + " "*14 + "/" + "|" + 92.chr,
                    " |" + " "*13 + "/" + " " + "|" + " " + 92.chr,
                    " |" + " "*12 + "/" + " "*2 + "|" + " "*2 + 92.chr,
                    " |" + " "*15 + "|",
                    " |" + " "*15 + "|",
                    " |" + " "*15 + "|",
                    " |" + " "*14 + "/" + " " + 92.chr,
                    " |" + " "*13 + "/" + " "*3 + 92.chr,
                    " |" + " "*12 + "/" + " "*5 + 92.chr,
                    " |" + " "*11 + "/" + " "*7 + 92.chr

            else puts "Unknown"
        end

    end
end

player = Player.new
game = Game.new(player)
game.play