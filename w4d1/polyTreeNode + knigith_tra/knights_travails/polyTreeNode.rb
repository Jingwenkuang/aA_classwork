class PolyTreeNode
    attr_reader :parent, :children, :value
   
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end
# arr = []
# Array.new
# arr.nil?


    def parent=(new_parent)
  
        @parent.children.delete(self) if parent != nil 
           
        @parent = new_parent
     
        unless new_parent == nil # .nil?
            new_parent.children << self unless new_parent.children.include?(self)

        end  
    end


    def add_child(child_node)
  
        child_node.parent = self 
    end

    def remove_child(child_node)

        child_node.parent = nil 
       raise 'Error' unless self.children.include?(child_node) #unless == if !
    end
  

    def dfs(target_value)
        return self if self.value == target_value
        children.each do |child|
            search_result = child.dfs(target_value)
            return search_result unless search_result.nil?
        end
        nil
    end

    def bfs(target_value)
        @queue = []
        @queue << self 

        until @queue.empty?
            node_first = @queue.shift
            return node_first if node_first.value == target_value
            node_first.children.each do |child|
                @queue.push(child)
            end
        end
        nil

    end
end