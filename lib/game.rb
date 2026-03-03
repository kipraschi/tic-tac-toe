require_relative 'player'
require_relative 'board'

class Game

  def initialize(board_size = 3, empty_marker = '□')
    @board = Board.new(board_size, empty_marker)
    @player_X = Player.new("X")
    @player_O = Player.new("O")
    @players = [@player_X, @player_O]
    @winner = nil
  end

  def play_round
    @players.each do |player|
      call(player)
      begin
        selection = player.select_cell
        raise "Cell taken" unless @board.cell_empty?(selection) 
      rescue
        @board.draw
        puts "Cell number #{selection + 1} is taken!"
        print "Choose another number [1 to 9] to place your #{player.mark}: "
        retry
      end
      @board.update(selection, player.mark)
      @board.draw
      if game_over?
        @winner = player if @board.crossed?
        break
      end
    end
  end

  def game_over?
    @board.solved? || @board.crossed?
  end

  def play
    @board.draw
    until game_over?
      play_round
    end
    end_game
  end

  def end_game
    case @winner
    when @player_X
      puts "Player X wins!"
    when @player_O
      puts "Player O wins!"
    else
      puts "It's a tie!"
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