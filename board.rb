class Board < Key
    attr_reader :board, :bulls, :cows

    def initialize
        @correct_key = []
        @prev_guess = []
        @board = []
        generate_key
    end

    # Checks if numbers are in the exact same spot as the key
    def bulls(guess)
        @bulls = 0
        index = 0

        guess.each do |x|
            if @correct_key[index] == x
                @bulls += 1
            end
            index += 1
        end
    end

    # Checks if guessed numbers are in the key
    def cows(guess)
        @cows = 0
        guess.each do |x|
            if @correct_key.include?(x)
                @cows += 1
            end
        end
    end

    # Displays past and current guess
    def display_board(guess)
        @board << "#{guess.join(" ")} | Bulls: #{@bulls}  Cows: #{@cows - @bulls}"
        puts "\n== Game Board =="
        @board.each { |x| puts x }
    end

    #checks if player guess matches correct key
    def game_won?(player_guess)
        @player_guess = player_guess
        @prev_guess << @player_guess
        cows(@player_guess)
        bulls(@player_guess)

        if @player_guess == @correct_key
            true
        else
            false
        end
    end

    # Do players want to play a new game?
    def play_again?
        puts "\nDo you want to play again? (y/n)"
        while answer = gets.chomp.downcase
            case answer
            when "y"
                generate_key
                @board = []
                answer = false
                puts "\nStarting New Game."
                break
            when "n"
                puts "\nGoodbye."
                answer = true
                break
            else
                puts "Invalid response. Try again." 
            end
        end
        answer        
    end
end