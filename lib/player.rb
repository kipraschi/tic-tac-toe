class Player
  attr_reader :mark

  def initialize(mark)
    @mark = mark
  end

  def select_cell
    begin
      selection = Integer(gets)
      raise unless valid?(selection)
    rescue StandardError
      puts "That's not a number 1 to 9!"
      print 'Choose another number from 1 to 9 to make your move: '
      retry
    end
    selection - 1
  end

  private

  def valid?(input)
    (1..9).include?(input)
  end
end
