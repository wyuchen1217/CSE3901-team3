# Author: Hannah Ackley
# Date: 7 February 2023
#
# Class corresponding with a player. A player has the 
# following attributes: name, points (cumulative total)

class Player
    attr_reader :name, :points

    # Constructor method
    # @param name
    #   User-entered name of player
    # @param points
    #   Cumulative total number of points earned
    def initialize(name, points)
        @name = name
        @points = points
    end

    # Increment the player's total points by 1
    # @return 
    #   the player's current point total
    def inc_points
        @points += 1
    end

    # Decrement the player's total points by 1
    # @return 
    #   the player's current point total
    def dec_points
        @points -= 1
    end
end