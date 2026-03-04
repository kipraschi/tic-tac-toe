require_relative 'player'
require_relative 'board'

class Game
  def initialize(board_size = 3, empty_marker = '□')
    @board = Board.new(board_size, empty_marker)
    @player_X = Player.new('X')
    @player_O = Player.new('O')
    @players = [@player_X, @player_O]
    @winner = nil
  end
  
  def play
    @board.draw
    play_round until game_over?
    end_game
  end

  private
  
  def play_round
    @players.each do |player|
      prompt(player)
      begin
        selection = player.select_cell
        raise 'Cell taken' unless @board.cell_empty?(selection)
      rescue StandardError
        @board.draw
        puts "Cell number #{selection + 1} is taken!"
        print "Choose another number [1 to 9] to place your #{player.mark}: "
        retry
      end
      @board.update(selection, player.mark)
      @board.draw
      if game_over?
        @winner = player if @board.winning_line?
        break
      end
    end
  end

  def game_over?
    @board.full? || @board.winning_line?
  end

  def end_game
    unless @winner.nil?
      puts "Player #{@winner.mark} wins!"
    else
      puts "It's a tie!"
    end
  end

  def prompt(player)
    puts "Player #{player.mark}, it's your turn!"
    print 'Enter a number 1 to 9 to place your mark: '
  end
end
