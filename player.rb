class Player
    attr_reader :name, :current_guess

    def initialize(name)
        @name = name
        @current_guess = []
    end

    # Stores current guess
    def player_guess(guess1, guess2, guess3, guess4)
        @current_guess = [guess1, guess2, guess3, guess4]
    end
end