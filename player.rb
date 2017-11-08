class Player
    attr_reader :name, :current_guess

    def initialize(name)
        @name = name
        @current_guess = []
    end

    def digits_only?(guess)
        results = true
        guess.each do |x|
            if (1..6) === x
            else
                puts "Invalid Response. You must use only numbers 1-6. Try again."
                results = false
            end
        end
        results
    end

    def length_okay?(guess)
        if guess.length == 4
            true
        else
            puts "Invalid Respose. Only enter 4 numbers. Try Again."
            false
        end
    end

    def no_duplicates?(guess)
        duplicates = true
        error_message = "Invalid Respose. All numbers must be different. Try Again."
        if guess[0] == guess[1] || guess[0] == guess[2] || guess[0] == guess[3]
            puts error_message
            duplicates = false
        elsif guess[1] == guess[2] || guess[1] == guess[3]
            puts error_message
            duplicates = false
        elsif guess[2] == guess[3]
            puts error_message
            duplicates = false
        end
        duplicates
    end

    def move_okay?(guess)
        if digits_only?(guess) && no_duplicates?(guess) && length_okay?(guess)
            true
        else
            false
        end
    end


    # Stores current guess
    def player_guess
        puts "\n#{@name}'s turn. What is your guess?"
        while guess = gets.chomp
            guess = guess.split('').map(&:to_i)
            if move_okay?(guess)
                break
            end
        end
        @current_guess = guess
    end
end