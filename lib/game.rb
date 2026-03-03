require_relative 'player'
require_relative 'board'

class Game

  def initialize
    @board = Board.new # parameters need to be passed from initialization
    @player_X = Player.new("X")
    @player_O = Player.new("O")
    @players = [@player_X, @player_O]
  end

  def play_round
    @players.each do |player|
      @board.draw
      call(player)
      begin
        selection = player.select_cell
        raise "Cell taken" unless @board.cell_empty(selection) 
      rescue
        @board.draw
        puts "Cell number #{selection + 1} is taken!"
        print "Choose another number [1 to 9] to place your #{player.mark}: "
        retry
      end
      @board.update(selection, player.mark)
    end
  end

  def game_over
    if false # define win/draw to trigger game over
      @over = true
    else false
    end
  end

  def play
    until game_over
      play_round
    end
  end

  def call(player)
    case player
    when @player_X 
      puts "Player X, take your turn!"
    when @player_O 
      puts "Player O, it's your turn!"
    end
    print "Enter a number 1 to 9 to place your mark: "
  end

end