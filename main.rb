# Authors: Hannah Ackley, Yuchen Wang, Christian Barrett
# Date: 7 February 2023

require './card'
require './deck'
require './player'
require './game'



# game set up

# create a new deck
deck = Deck.new
deck.shuffle

#number of cards in one turn
NUM_CARDS = 12

#deal 12 cards from the deck
table = []
(1..NUM_CARDS).each do |i|
    table << deck.deal
end

# Keep playing games until user states that they are done
loop do

    # Create a new game instance by calling the game constructor


    # "Play" game until the timer runs out
    loop do

        # Output the cards in the hand
        puts "The cards in the hand are: "
        table.each_with_index do |card, index|
            puts "#{index + 1}. #{card}"
        end

        # Prompt player for their guess (guess 0 if no sets in hand)
        puts "Pick card 1: "
        card1 = gets.chomp

        puts "Pick card 2: "
        card2 = gets.chomp

        puts "Pick card 3: "
        card3 = gets.chomp

        # Subtract one point if player incorrectly states that no sets exist

        puts "Incorrect, there is a set in the hand. Try again."

        # Add one point if player correctly identifies a set

        puts "Correct! #{card1}, #{card2}, and #{card3} makes a set."

        # Subtract one point is player guesses an incorrect set
        
        puts "#{card1}, #{card2}, and #{card3} are not a set, try again."

        # Add 3 additional cards to hand if no set exists

        puts "Correct, there are currently no sets in this hand. 3 more cards will be added."

    end
    # Output the player's number of points earned

    puts "Congrats! You scored #{} points."

    # Ask user if they would like to play again

    puts "Would you like to play again?"
    puts "1. Yes, Play Again"
    puts "2. No, Quit"
    playAgain = gets.chomp

        # If they do not, output thank you message

        puts "Thanks for playing! Come Back Soon!"
end