# require_relative "board.rb"

class Piece 
    attr_reader :pos
    def initialize(pos=nil)
        @pos = pos 
        # @board = board
    end

    def moves
        array = []

        (0..7).each do |num_1|
            (0..7).each do |num_2|
                array << [num_1, num_2]
            end
        end
        array    
    end
    
end