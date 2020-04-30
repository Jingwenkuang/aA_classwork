require "byebug"
require_relative 'polyTreeNode.rb'

class KnightPathFinder

    attr_reader :considered_positions, :root_node
    def initialize(pos)
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = []
        build_move_tree
    end

    def self.valid_moves(pos)
        posible_knight_moves = []
        row, col = pos

        [-2, 2].each do |i|
            [-1, 1].each do |j|
              
 #2 squares horizontally and 1 square vertically || 
 #2 squares vertically and 1 square horizontally
                if (0..7).to_a.include?(row + i) && (0..7).to_a.include?(col + j)
                    posible_knight_moves << [row + i, col + j] 
                end

                if (0..7).to_a.include?(row + j) && (0..7).to_a.include?(col + i)
                    posible_knight_moves << [row + j, col + i] 
                end
            end
        end
        posible_knight_moves
    end

    def new_move_positions(pos)
        all_positions = []

        KnightPathFinder.valid_moves(pos).each do |coord|
            all_positions << coord
        end
        # debugger
       updated = all_positions.reject {|coord| @considered_positions.include?(coord)}
       @considered_positions += updated 
       updated
    end


    def build_move_tree
        queue = [@root_node] 
    
        until queue.empty?
            current_pos = queue.shift
            # @considered_positions << current_pos.value unless @considered_positions.include?(current_pos.value)

                new_coords = self.new_move_positions(current_pos.value)
                # debugger 
                new_coords.each do |coord|
                    child_node = PolyTreeNode.new(coord)
                    current_pos.add_child(child_node)
                    #debugger 
                    queue << child_node
                end

        end

    end

#phase III

    def find_path(end_pos)
        end_node = @root_node.dfs(end_pos)

       reversed = trace_path_back(end_node).reverse
       reversed.map(& :value)
    end

    def trace_path_back(end_node)
        nodes = []

        current_node = end_node
        until current_node.nil?
            nodes << current_node 
            current_node = current_node.parent  #?
        end
        nodes 
    end
end


# knight1 = KnightPathFinder.new([0, 0])
