class Board

  def initialize(board_size = 3, empty_marker = '□') # needs to scale
    @empty_marker = empty_marker
    @board_size = board_size
    @board = Array.new(@board_size ** 2)
    make
  end

  def print
    @board.each_slice(@board_size) do |row|
      puts row.join(' | ')
    end
  end
    
  def update(index, symbol)
    @board[index] = symbol
  end

  private

  def make
    @board.fill {|cell| cell = @empty_marker}
  end
end