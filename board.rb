class Board < Key
    attr_reader :board, :bulls, :cows

    def initialize
        @correct_key = [1,2,3,5]
        @prev_guess = []
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
    def display_board
        puts "\n== Game Board =="
        @prev_guess.each do |x|
            puts "#{x.join(" ")} | Bulls: #{@bulls}  Cows: #{@cows - @bulls}"
        end
    end

    #checks if player guess matches correct key
    def game_won?(player_guess)
        @player_guess = player_guess
        @prev_guess << @player_guess

        if @player_guess == @correct_key
            true
        else
            cows(@player_guess)
            bulls(@player_guess)
            false
        end
    end

    # Do players want to play a new game?
    def stop?
        generate_key
    end
end