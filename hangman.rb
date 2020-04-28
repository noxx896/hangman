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
    #attr_reader :player_word
    #attr_reader :attempts

    def initialize(player)
        @player = player
        #@dictionary
        #@player_word
        @attempts = 0
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
        print "#{aux}\n"

        until flag
            print "\nEnter a letter: "
            user_choise = gets.chomp
            @attempts += 1 unless aux.include?(user_choise)
                
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

            print "- "*aux.size + "\n"
            display_hangman(@attempts)
            if @attempts == 7 || !aux_2.include?(" ") 
                flag = true
                puts "YOU LOSE" if @attempts == 7
                puts "YOU WIN!!" if !aux_2.include?(" ")
                
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

            else puts " Unknown #{player_attempts.class} #{player_attempts}"

        end

    end
end

player = Player.new("n0xx", "English")
game = Game.new(player)
game.play