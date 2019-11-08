class Tower
  attr_accessor :selected
  attr_reader :board

  def initialize(n = 3)
    @disks = n
    @board = Array.new(3) { Array.new(0) }
    @selected = nil

    populate_board(n)
  end

  def populate_board(n)
    n.times { |i| @board[0] << i }
    @board[0].reverse!
  end

end