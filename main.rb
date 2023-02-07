# Authors: Chris Johnson, Hannah Ackley, Yuchen Wang, Christian Barrett, Madison Irwin, Gautam Agarwal
# Date: 7 February 2023

require './card.rb'
require './deck.rb'
require './player.rb'
require './game.rb'

# game set up

print 'Welcome to the game of Set! How many players are there? ' # prints for no new line at end
player_count = gets.chomp.to_i

player_array = []
player_count.times do
  puts "Please enter player's name: "
  playerName = gets.chomp
  points = 0
  player_array << Player.new(playerName, points)
end
# puts player_array[0].name

# game = Game.new

# create a new deck
deck = Deck.new
deck.shuffle

# number of cards in one turn
NUM_CARDS = 12

# Keep playing games until user states that they are done or until deck is empty
play_again = true
until !play_again || deck.empty?
  
  # Create a new game instance by calling the game constructor

  # loop through players
  player_array.each do |player|
    puts "#{player.name}'s turn: "
    puts '________________________'
    # deal 12 cards from the deck
    table = []
    NUM_CARDS.times { table << deck.deal }

    # Output the cards in the hand
    puts 'The cards on the table are: '
    table.each_with_index do |card, index|
      puts "#{index + 1}. #{card.output}"
    end

    # Prompt player for their guess (guess 0 if no sets in hand)
    puts 'Pick a card by entering the number seen to the left of the card: '
    puts 'Pick card 1 (or enter 0 if there is no set): '
    input1 = gets.chomp

    # If 0, skip
    if input1 == '0'
      if table_contains_set?(table)
        # Subtract one point if player incorrectly states that no sets exist
        puts 'Incorrect, there is a set in the hand. Minus 1 points. Try again.'
        player.dec_points
        next
      else
        # Add 3 additional cards to hand if no set exists
        puts 'Correct, there are currently no sets in this hand. 3 more cards will be added.'
        3.times { table << deck.deal }
        # Output the cards in the hand
        puts 'The cards on the table are: '
        table.each_with_index do |card, index|
          puts "#{index + 1}. #{card.output}"
        end
        
      end
    else
      puts 'Pick card 2: '
      input2 = gets.chomp

      puts 'Pick card 3: '
      input3 = gets.chomp

      card1 = table[input1.to_i - 1]
      card2 = table[input2.to_i - 1]
      card3 = table[input3.to_i - 1]

      # Add one point if player correctly identifies a set
      if check_set(card1, card2, card3)
        player.inc_points
        puts "Correct! #{card1.output}, #{card2.output}, and #{card3.output} makes a set."

        # Output the player's number of points earned
        puts "Congrats! You scored #{player.points} points."

      # Subtract one point is player guesses an incorrect set
      else
        player.dec_points
        puts "#{card1.output}, #{card2.output}, and #{card3.output} are not a set, try again."
      end
    end
    # END OF PLAYER LOOP
  end

  # Ask user if they would like to play again

  puts 'Would you like to play again?'
  puts '(1) Keep Playing!'
  puts '(2) No, Quit'
  play_again = (gets.chomp == '1')
  if play_again == 2
    puts "Thanks for playing! Come Back Soon!"
  end
  puts "Thanks for playing! Come Back Soon!"
end
