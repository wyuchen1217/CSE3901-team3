# Author: Hannah Ackley
# Date: 7 February 2023
#
# Class corresponding with an individual card. A card object has the 
# following attributes: color (red, green, or purple), number (one, two, 
# or three), shape (squiggle, diamond, or oval), and shading (solid, 
# striped, or open)

class Card
    # Use attr_reader as "getter" method for the four card attributes
    attr_reader :color, :number, :shape, :shading

    # Constructor method
    # @param color
    #   Color of the shape (red, green, or purple)
    # @param number
    #   Number of shapes on the card (one, two, or three)
    # @param shape
    #   Shape displayed on card (squiggle, diamond, or oval)
    # @param shading
    #   Shading of the shape(s) (solid, striped, or open)
    def initialize(color, number, shape, shading)
        @color = color
        @number = number
        @shape = shape
        @shading = shading
    end

    # Outputs the card's attributes as a string
    def output
        @color + " " + @number + " " + @shape + " " + @shading + "\n"
    end

end