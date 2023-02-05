# Authors: Hannah Ackley, Yuchen Wang
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

        # Prompt player for their guess (guess 0 if no sets in hand)

        # Subtract one point if player incorrectly states that no sets exist

        # Add one point if player correctly identifies a set

        # Subtract one point is player guesses an incorrect set

        # Add 3 additional cards to hand if no set exists

    end
    # Output the player's number of points earned

    # Ask user if they would like to play again

        # If they do not, output thank you message
end