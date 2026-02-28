class Game
    def initialize
        @board_size = 3 # needs to scale
        @empty_marker = '□'
        @board = Array.new(@board_size ** 2)
        make_board
    end
    
    def print_board()
       @board.each_slice(@board_size) do |row|
          puts row.join(' | ')
        end
    end
    
    def update_board(index, symbol)
        @board[index] = symbol
    end

    def is_over
      if false # define win/draw to trigger game over
        @over = true
      else false
      end
    end

    private

    def make_board
        @board.fill {|cell| cell = @empty_marker}
    end

end