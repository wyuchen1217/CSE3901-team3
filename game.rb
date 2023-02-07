# Authors: Yuchen Wang, Gautam Agarwal
# Date: 7 February 2023


require './card'
require './deck'

# make class 

# Constructor for game - TO DO
# def initialize

# check if the three cards form a set
def check_set(card1, card2, card3)
  color_set = (card1.color == card2.color) && (card2.color == card3.color) ||
              (card1.color != card2.color) && (card2.color != card3.color) && (card1.color != card3.color)
  shape_set = (card1.shape == card2.shape) && (card2.shape == card3.shape) ||
              (card1.shape != card2.shape) && (card2.shape != card3.shape) && (card1.shape != card3.shape)
  number_set = (card1.number == card2.number) && (card2.number == card3.number) ||
                (card1.number != card2.number) && (card2.number != card3.number) && (card1.number != card3.number)
  shading_set = (card1.shading == card2.shading) && (card2.shading == card3.shading) ||
                (card1.shading != card2.shading) && (card2.shading != card3.shading) && (card1.shading != card3.shading)
  color_set && shape_set && number_set && shading_set
end
  

# This function will determine if the set is already in set
def set_in_sets?(set, sets)
  sets.each do |set_in_sets|
    card1 = set[0]
    card2 = set[1]
    card3 = set[2]
    return true if set_in_sets.include?(card1) && set_in_sets.include?(card2) && set_in_sets.include?(card3)
  end
  false
end

# # This function will determine if 3 cards on table can be made into a set
def table_contains_set?(table)
  # TODO
  table.each do |first_card|
    table.each do |second_card|
      table.each do |third_card|
        if (first_card != second_card && first_card != third_card && second_card != third_card) && check_set(first_card, second_card, third_card)
          return true
        end
      end
    end
  end
  false
end

# Generates hint
def hint(table) 
  # Iterate through all possible combinations of 3 cards present in the table.
  table.each do |first_card| 
    table.each do |second_card| 
      table.each do |third_card| 
        #check the tree cards make a set and are not same.
        if (first_card != second_card && first_card != third_card && second_card != third_card) && check_set(first_card, second_card, third_card) 
          puts "Hint: #{first_card.to_s} - #{second_card.to_s} - #{third_card.to_s} is a set. Enjoy!" 
          return 
        end 
      end 
    end 
  end 
  puts "No more hints available." 
end

def play
  start_time = Time.now
  sets_found = 0
  while deck.any? || sets_found > 0
      sets_found = 0;
      (0...table.length).each do |i|
        (i+1...table.length).each do |j|
          (j+1...table.length).each do |k|
            if check_set(table[i], table[j], table[k])
              sets_found += 1
              # remove the cards that form a set and replace them with new cards
              table.delete(table[i])
              table.delete(table[j])
              table.delete(table[k])
              table << deck.deal
              table << deck.deal
              table << deck.deal
            end
          end
        end
      end

    # Check the time
    elapsed_time = Time.now - start_time
    if elapsed_time >= 60
      puts "Time's up!"
      break
    end
  end
      # end the game
end
