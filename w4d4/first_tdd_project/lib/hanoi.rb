
class Hanoi

    def initialize 
        @stacks = [[3,2,1],[],[]]
    end

    def valid_move?(start_stack, end_stack)
        # return false if @stacks[start_stack].length > 3 || @stacks[start_stack].length < 0 
        # return false if @stacks[end_stack].length > 3 || @stacks[end_stack].length < 0

    return false unless [start_stack, end_stack].all? { |i| i.between?(0, 2) }

    !@stacks[start_stack].empty? && (
      @stacks[end_stack].empty? ||
      @stacks[end_stack].last > @stacks[start_stack].last)
    end

    def move(start_stack, end_stack)
        raise "cannot move from empty stack" if @stacks[start_stack].empty?
        raise "cannot move onto smaller disk" unless valid_move?(start_stack, end_stack)
        @stacks[end_stack] << @stacks[start_stack].last 
    end

    def won?
        @stacks[0].empty? && @stacks[1..2].any?(& :empty?)
    end
end