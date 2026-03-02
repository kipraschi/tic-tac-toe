require_relative 'player'
require_relative 'board'

class Game

  def initialize
    @board = Board.new(3, '□') # parameters need to be passed from initialization
    @player_X = Player.new("X")
    @player_O = Player.new("O")
  end

  def take_turn(player)
    selection = player.select_cell
    @board.update(selection, player.mark)
    @board.print
  end

  def is_over
    if false # define win/draw to trigger game over
      @over = true
    else false
    end
  end

  def play
    until is_over
      @board.print
      take_turn(@player_X)
      take_turn(@player_O)
    end
  end

end