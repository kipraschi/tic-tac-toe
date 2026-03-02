require_relative 'player'
require_relative 'board'

class Game

  def initialize
    @board = Board.new(3, '□') # parameters need to be passed from initialization
    @player_X = Player.new("X")
    @player_O = Player.new("O")
    @players = [@player_X, @player_O]
  end

  def play_round
    @board.print
    @players.each do |player|
      call(player)
      selection = player.select_cell
      @board.update(selection, player.mark)
      @board.print
    end
  end

  def is_over
    if false # define win/draw to trigger game over
      @over = true
    else false
    end
  end

  def play
    until is_over
      play_round
    end
  end

  def call(player)
    case player
    when @player_X then puts "Player X, take your turn!"
    when @player_O then puts "Player O, it's your turn!"
    end
  end

end