require_relative "piece.rb"
require_relative "slideable.rb"

require_relative "../board.rb"
class Rook < Piece
    include Slideable

    def initialize(pos)
        super
    end

    def move_dirs
        horizontal_dirs 

    end
end 