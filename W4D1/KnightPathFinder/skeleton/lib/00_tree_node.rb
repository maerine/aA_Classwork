class PolyTreeNode
    attr_reader :parent, :children, :value

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(new_parent)
        if self.parent != nil
            self.parent.children.delete(self)
        end
        @parent = new_parent

         new_parent.children << self unless new_parent.nil? 
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        if child_node.parent == nil
            raise "not a child"
        end
        child_node.parent = nil
    end

    def dfs(target)
        return self if @value == target
        @children.each do |child|
            search_result = child.dfs(target)
            return search_result unless search_result == nil
        end
        nil
    end

    def bfs(target)
        queue = [self]
        until queue.empty?
            first = queue.shift
            if first.value == target
                return first  
            end
            queue.concat(first.children)
        end
        nil
    end

    
end