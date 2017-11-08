require './key.rb'
require './board.rb'
require './player.rb'

game = Board.new


# Intro
puts "\n== Welcome to Mastermind =="
puts "The Objective: Guess the 4 digit key using only numbers 1-6"
puts "A single number will never be used twice"
sleep 1

#Gets Player's info
puts "\nPlayer 1, what is your name?"
name1 = gets.chomp
player1 = Player.new(name1)
puts "\nWelcome, #{player1.name}"
sleep 1
puts "\nPlayer 2, what is your name?"
name2 = gets.chomp
player2 = Player.new(name2)
puts "\nWelcome, #{player2.name}"

active_player = player1
stop = false

sleep 1

#Gameplay
until stop
    puts "\n#{active_player.name}'s turn. What is your guess?"
    guess = gets.chomp
    guess = guess.split('').map(&:to_i)
    active_player.player_guess(guess[0], guess[1], guess[2], guess[3])

    if game.game_won?(active_player.current_guess)
        game.display_board(active_player.current_guess)
        puts "#{active_player.name} won!"
        stop = game.play_again?
    else
        game.display_board(active_player.current_guess)
        if active_player == player1
            active_player = player2
        else
            active_player = player1
        end
    end
end
