require_relative "./skeleton/lib/00_tree_node.rb"

class KnightPathFinder
    def initialize(start_pos)
        @start_pos = start_pos
        @root_node = PolyTreeNode.new(start_pos)
        @considered_positions = [start_pos]
    end
    
    def self.valid_moves(pos)
        x = pos[0]
        y = pos[1]
        valid_moves = [
            [x - 1, y + 2]
            [x - 1, y - 2]
            [x + 1, y + 2]
            [x + 1, y - 2]
            [x - 2, y - 1]
            [x - 2, y + 1]
            [x + 2, y + 1]
            [x + 2, y - 1]
        ]
        valid_moves.select do |move|
            (!move[0] > 7 || !move[0] < 0) && (!move[1] > 7 || !move[1] < 0)
        end

    end

    def new_move_positions(pos)
        new_positions = @considered_positions.concat(KnightPathFinder.valid_moves(pos)).uniq
        @considered_positions.concat(new_positions)
        new_positions
    end

    def build_move_tree
        new_positions = self.new_move_positions(@start_pos) 
        new_positions.each do |pos|
            move = PolyTreeNode.new(pos)
            @root_node.add_child(move)
        end
    end

end

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