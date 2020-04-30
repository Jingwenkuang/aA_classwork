require_relative "piece.rb"
require_relative "chess/board.rb"



class Bishop < Piece
    include Slideable

    def initialize(pos)
        #@pos
        #@board
        super
    end

    def move_dirs  #move diagonal until end of board/piece
        
        
    end
end