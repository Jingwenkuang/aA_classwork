require_relative "./pieces/piece.rb"
require "byebug"
class Board
    attr_reader :grid 
    def initialize
        @grid = Array.new(8) {Array.new(8)} 
        self.populate
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @grid[row][col] = val
    end

    def valid_pos?(pos) # pos = [n, n]
        row, col = pos
        (0..7).to_a.include?(row)
        (0..7).to_a.include?(col)
    end

    def move_piece(start_pos, end_pos)
        # debugger
        raise "Invalid start_pos" if self[start_pos] == nil
        piece = self[start_pos] 

        if valid_pos?(end_pos)
            self[end_pos] = piece 
            self[start_pos] = nil 
        else 
            raise "Piece cannot move to #{end_pos}" 
        end 

    end

    def populate
        @grid.each_with_index do |sub_arr, i|
            if i == 0 || i == 1 || i == 6 || i == 7
                 @grid[i].map!.with_index do |ele, j|
                    ele = Piece.new([i, j])
                 end
            end

        end
    end
end