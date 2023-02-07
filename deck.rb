require './card'

class Deck
    #Initialize the deck with all possible combinations.
    def initialize
        #Initialize empty deck.
        @deck = []
        #Describing cards possible value 
        @colors = ["red", "green", "purple"]
        @numbers = ["one", "two", "three"]
        @shapes = ["squiggle", "diamond", "oval"]
        @shadings = ["solid", "striped", "open"]
        #Each attribute combination is looped through to generate a new card instance.
        @colors.each do |color|
            @numbers.each do |number|
                @shapes.each do |shape|
                    @shadings.each do |shading|
                        @deck << Card.new(color, number, shape, shading)
                    end
                end
            end
        end
    end

    #Returns the size of the deck.
    def size
        @deck.length
    end

    #Random shuffle.
    def shuffle
        @deck.shuffle!
    end

    #Dealing cards.
    def deal
        @deck.pop
    end

    #Checking if the deck is empty.
    def empty?
        @deck.empty?
    end
end

# Path: deck.rb
# Compare this snippet from card.rb:
