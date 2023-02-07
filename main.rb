# Authors: Chris Johnson, Hannah Ackley, Yuchen Wang, Christian Barrett, Madison Irwin
# Date: 7 February 2023

puts "test"

require './card.rb'
require './deck.rb'
require './player.rb'
require './game.rb'



# game set up
class Main
  
  puts "Welcome to the game of Set! Would you like to play? (1 - yes, 2 - no)."
  gameStatus = gets.chomp.to_i
  
  if gameStatus == 1 

    game = Game.new

    puts "Please enter player's name: "
    playerName = gets.chomp
    # create a new deck
    deck = Deck.new
    deck.shuffle

    #number of cards in one turn
    NUM_CARDS = 12
    
    # Keep playing games until user states that they are done
    loop do

        # Create a new game instance by calling the game constructor

        # "Play" game until the timer runs out
        loop do

            #deal 12 cards from the deck
            table = []
            NUM_CARDS.times { table << deck.deal }
        
            #Output "enter 0 if no sets"

            # Output the cards in the hand
            puts "The cards on the table are: "
            table.each_with_index do |card, index|
                puts "#{index + 1}. #{card}"
            end

            # Prompt player for their guess (guess 0 if no sets in hand)
            puts "Pick card 1: "
            input1 = gets.chomp

            # If 0, skip
            if input1 == "0"
                if game.!table_contains_set?(table)
                    # Subtract one point if player incorrectly states that no sets exist
                    puts "Incorrect, there is a set in the hand. Try again."
                    next
                else 
                    # Add 3 additional cards to hand if no set exists
                    puts "Correct, there are currently no sets in this hand. 3 more cards will be added."
                    3.times { table << deck.deal }
                end
            else 
                puts "Pick card 2: "
                input2 = gets.chomp

                puts "Pick card 3: "
                input3 = gets.chomp

                card1 = table[input1.to_i - 1]
                card2 = table[input2.to_i - 1]
                card3 = table[input3.to_i - 1]

                # Add one point if player correctly identifies a set
                if game.check_set(card1, card2, card3)
                    player.inc_points
                    puts "Correct! #{card1}, #{card2}, and #{card3} makes a set."

                # Subtract one point is player guesses an incorrect set
                else
                    player.dec_points
                    puts "#{card1}, #{card2}, and #{card3} are not a set, try again."
                end
            end
        end
        # Output the player's number of points earned

        puts "Congrats! You scored #{} points."

        # Ask user if they would like to play again

        puts "Would you like to play again?"
        puts "(1) Yes, Play Again"
        puts "(2) No, Quit"
        quit_game = gets.chomp == "2" # false if they want to play again

        # If they do not, output thank you message
        if quit_game do
            puts "Thanks for playing! Come Back Soon!"
            break
        end
  else
      puts "The game has ended."
  end
end
