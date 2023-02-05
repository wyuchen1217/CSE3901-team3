require './card'

class deck
    def initialize
        @deck = []
        @colors = ["red", "green", "purple"]
        @numbers = ["one", "two", "three"]
        @shapes = ["squiggle", "diamond", "oval"]
        @shadings = ["solid", "striped", "open"]
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

    def size
        @deck.length
    end

    def shuffle
        @deck.shuffle!
    end

    def deal
        @deck.pop
    end

    def empty?
        @deck.empty?
    end
end

# Path: deck.rb
# Compare this snippet from card.rb:
