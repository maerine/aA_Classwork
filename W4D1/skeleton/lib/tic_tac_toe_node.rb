require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    moves = []
    (0..2).each do |row|
      (0..2).each do |col|
        pos = [row, col]
        if board.empty?(pos)
          new_board = board.dup
          new_board[pos] = @next_mover_mark
          @next_mover_mark == :x ? child_mover_mark = :o : child_mover_mark = :x
          moves << TicTacToeNode.new(new_board, child_mover_mark, pos)
          @previous_move_position = pos
        end
      end
    end
    moves
  end

end
