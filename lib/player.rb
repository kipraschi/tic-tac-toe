class Player

  attr_reader :mark

  def initialize(mark)
    @mark = mark
  end

  def select_cell
    cell_selected = nil
    until (1..9).include?(cell_selected)
      print "Enter a number 1 to 9 to place your mark: "
      begin
        cell_selected = Integer(gets)
        raise unless (1..9).include?(cell_selected)
      rescue
        puts "That's not a number 1 to 9!"
      end
    end
    cell_selected - 1
  end

end