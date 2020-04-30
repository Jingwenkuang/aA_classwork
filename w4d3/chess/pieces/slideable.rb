
module Slideable
    HORIZONTAL_DIRS = [
            [0, 1],  # right   
            [0, -1], # left
            [-1, 0], # up
            [1, 0]    # down
    ]

    DIAGONAL_DIRS = [
            [-1, -1], # down, left  #left down
            [-1,  1], # down right  # left up 
            [1, 1],     # up, right #right, up
            [1,  -1]     # up, left  #left, up
    ]

    def horizontal_dirs
        # row, col = self.pos
        # (0..7).each do |i|
        #     (0..7).each do |j|
        #     @board[row + i][col + j]
        #     @board[col + i][row + j]
        #     end
        # end
        HORIZONTAL_DIRS
    end

    def diagonal_dirs
        # row, col = self.pos
        # (0..7).each do |idx_1|
        #     @board[row + idx_1][col + idx_1]
        #     @board[row + idx_1][col + (@board.length - 1 - idx_1)]
        # end
        DIAGONAL_DIRS
    end

    def moves
        valid_pos = []

        move_dirs.each do |sub_arr|  # |dx, dy|
            dx, dy = sub_arr 
            valid_pos += grow_unblocked_moves_in_dir(dx, dy)
            
        end 
       

    end

    def grow_unblocked_moves_in_dir(dx, dy)
        moves_arr = []

        while true 
            cur_x, cur_y = self.pos
            new_pos = [cur_x + dx, cur_y + dy]
            moves_arr << new_pos unless !board.valid_pos?(new_pos)
            break 
        end
        moves_arr
    end

#     def self.valid_moves(pos)
#     valid_moves = []

#     cur_x, cur_y = pos
#     MOVES.each do |(dx, dy)|
#       new_pos = [cur_x + dx, cur_y + dy]

#       if new_pos.all? { |coord| coord.between?(0, 7) }
#         valid_moves << new_pos
#       end
#     end

#     valid_moves
#   end
end