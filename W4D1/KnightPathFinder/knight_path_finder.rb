require "byebug"
require_relative "./skeleton/lib/00_tree_node.rb"

class KnightPathFinder
    attr_reader :root_node

    def initialize(start_pos)
        @start_pos = start_pos
        @root_node = PolyTreeNode.new(start_pos)
        @considered_positions = [start_pos]
    end
    
    def self.valid_moves(pos)
        x = pos[0]
        y = pos[1]
        valid_moves = [
            [x - 1, y + 2],
            [x - 1, y - 2],
            [x + 1, y + 2],
            [x + 1, y - 2],
            [x - 2, y - 1],
            [x - 2, y + 1],
            [x + 2, y + 1],
            [x + 2, y - 1]
        ]
        valid_moves.select do |move|
            (!(move[0] > 7) && !(move[0] < 0)) && (!(move[1] > 7) && !(move[1] < 0))
        end

    end

    def new_move_positions(pos)
        all_valid_moves = KnightPathFinder.valid_moves(pos)
        new_positions = all_valid_moves.select {|pos| !@considered_positions.include?(pos)}
        @considered_positions.concat(new_positions)
        new_positions
    end


    def build_move_tree
        queue = [@root_node]
        # debugger
        until queue.empty?
            current_node = queue.shift
            new_positions = self.new_move_positions(current_node.value) 
            new_positions.each do |pos|
                move = PolyTreeNode.new(pos)
                queue << move
                
                current_node.add_child(move)
                
            end
        end
    end

    def find_path(end_pos)
        self.build_move_tree
        end_node = @root_node.bfs(end_pos)
        trace_path_back(end_node)
    end

    def trace_path_back(end_node)
        array = [end_node.value]
        return [end_node.value] if end_node.parent == nil
        
        trace_path_back(end_node.parent) + array
    end

end

kpf = KnightPathFinder.new([0, 0])
p kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
p kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]

# [1,-1, 2, -2]

# if abs(x) == 1 && abs(y) == 2
# else abs(x) == 2 && abs(y) == 1
 
#  01234567
# 0
# 1
# 2
# 3
# [4,4]

# [3,6] <= x - 1, y + 2
# [3,2] <= x - 1, y - 2
# [5,6] <= x + 1, y + 2
# [5,2] <= x + 1, y - 2
# [2,3] <= x - 2, y - 1
# [2,5] <= x - 2, y + 1
# [6,5] <= x + 2, y + 1
# [6,3] <= x + 2, y - 1

# 1 2
# +/-