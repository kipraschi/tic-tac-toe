class Board

  def initialize(board_size, empty_marker)
    @empty_marker = empty_marker
    @board_size = board_size
    @board = Array.new(@board_size ** 2) {|cell| cell = @empty_marker}
  end

  def draw
    print "\n"
    @board.each_slice(@board_size) do |row|
      puts row.join(' | ')
    end
    print "\n"
  end
    
  def update(index, symbol)
    @board[index] = symbol
  end

  def cell_empty?(index)
    @board[index] == @empty_marker
  end

  def full?
    @board.none? { |cell| cell == @empty_marker }
  end

  def has_winning_line?
    diagonal = Array.new(2) { [] }
    rows = @board.each_slice(@board_size).to_a
    columns = rows.transpose
    
    @board.each_slice(@board_size).with_index do |row, i|
      diagonal[0].push(row[i])
      diagonal[1].push(row[row.length - 1 - i])
    end
    
    lines = diagonal + rows + columns

    lines.any?{ |line| uniform?(line) }
  end
  
  private

  def uniform?(array)
    array.uniq.size == 1 && !array.include?(@empty_marker)
  end
  
end