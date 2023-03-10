# Authors: Chris Johnson, Hannah Ackley, Yuchen Wang, Christian Barrett, Madison Irwin, Gautam Agarwal
# Date: 7 February 2023

require './card.rb'
require './deck.rb'
require './player.rb'
require './game.rb'
require 'time'

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

print "How many seconds do you want the game to last?"
player_inputted_time = gets.chomp.to_i

# create a new deck
deck = Deck.new
deck.shuffle

# number of cards in one turn
NUM_CARDS = 12

# Keep playing games until user states that they are done
play_again = true
until !play_again

  # Terminate game when timer runs out
  start_time = Time.now
  times_up = false
  until times_up

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
      puts 'Pick card 1 (or enter 0 if there is no set. Enter 13 for hint): '
      input1 = gets.chomp
      
      # If anything else other than 0-13, error will occur
      if !(0..13).include?(input1.to_i)
          puts 'ERROR: Please pick a card between 0 and 12. Try again.'
          input1 = gets.chomp
        end

      # If 13, hint generated!
      if input1 == '13'
        hint(table)
        puts 'Pick card 1 again!'
        input1 = gets.chomp
        while input1 == '13'
          puts 'Cannont generate hint again. Try picking up a card!'
          input1 = gets.chomp
        end
      end

      # If 0, skip
      if input1 == '0'
        if table_contains_set?(table)
          # Subtract one point if player incorrectly states that no sets exist
          puts 'Incorrect, there is a set in the hand. Minus 1 point. Turn forfeited.'
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
        while input2 == input1
          puts 'You cannot pick the same card. Try Again!'
          input2 = gets.chomp
        end
        
        # If anything else other than 0-12, error will occur
        if !(0..12).include?(input2.to_i)
          puts 'ERROR: Please pick a card between 0 and 12. Try again.'
          input2 = gets.chomp
          while input2 == input1
          puts 'You cannot pick the same card. Try Again!'
          input2 = gets.chomp
        end
        end

        puts 'Pick card 3: '
        input3 = gets.chomp
        while input3 == input2 || input3 == input1
          puts 'You cannot pick the same card. Try Again!'
          input3 = gets.chomp
        end
        
        # If anything else other than 0-12, error will occur
        if !(0..12).include?(input3.to_i)
          puts 'ERROR: Please pick a card between 0 and 12. Try again.'
          input3 = gets.chomp
          while input3 == input2 || input3 == input1
          puts 'You cannot pick the same card. Try Again!'
          input3 = gets.chomp
        end
        end

        card1 = table[input1.to_i - 1]
        card2 = table[input2.to_i - 1]
        card3 = table[input3.to_i - 1]

        # Add one point if player correctly identifies a set
        if check_set(card1, card2, card3)
          player.inc_points
          puts "\nCorrect! Your set of:\n#{card1.output}#{card2.output}#{card3.output}makes a set.\n"

          # Output the player's number of points earned
          puts "Congrats! You've scored #{player.points} points so far."

        # Subtract one point is player guesses an incorrect set
        else
          player.dec_points
          puts "\nYour selection of:\n#{card1.output}#{card2.output}#{card3.output}is not a set, try again.\n"
        end
      end
    end # END OF PLAYER LOOP
    # Check the time
    elapsed_time = Time.now - start_time
    if elapsed_time >= player_inputted_time
      times_up = true
      puts "Time's up!"
    end
  end # END OF GAME LOOP


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

puts "Scores: "
# winner = " "
# max = player_array[0].points
player_array.each do |player|
  puts "#{player.name}'s score: #{player.points}"
end
