require_relative '../lib/board'

RSpec.describe Board do
  subject (:board) { described_class.new }

  describe '#update' do
    it 'updates the cell with the given symbol' do
      board.update(5, 'X')
      expect(board.board[5]).to eq('X')
    end
  end

  describe '#cell_empty?' do
    context 'when the cell is empty' do
      it 'returns true' do
        expect(board.cell_empty?(7)).to be true
      end
    end

    context 'when the cell is full' do
      it 'returns false' do
        board.update(1, 'O')
        expect(board.cell_empty?(1)).to be false
      end
    end
  end

  describe '#full?' do
    context 'when the board has no empty cells' do
      it 'returns true' do
        9.times { |i| board.update(i, i.even? ? 'X': 'O') }
        expect(board.full?).to be true
      end
    end

    context 'when the board has at least one empty cell' do
      it 'returns false' do
        8.times { |i| board.update(i, i.even? ? 'X': 'O') }
        expect(board.full?).to be false
      end
    end
  end

  describe '#winning_line?' do
    context 'when the board has a row winner' do
      it 'returns true' do
        row_two_indexes = [3, 4, 5]
        row_two_indexes.each { |i| board.update(i, 'X') }
        expect(board.winning_line?).to be true
      end
    end
    context 'when the board has a column winner' do
      it 'returns true' do
        column_three_indexes = [2, 5, 8]
        column_three_indexes.each { |i| board.update(i, 'O') }
        expect(board.winning_line?).to be true
      end
    end
    context 'when the board has a diagonal winner' do
      it 'returns true for the first diagonal' do
        diagonal_one_indexes = [0, 4, 8]
        diagonal_one_indexes.each { |i| board.update(i, 'O') }
        expect(board.winning_line?).to be true
      end

      it 'returns true for the second diagonal' do 
        diagonal_two_indexes = [2, 4, 6]
        diagonal_two_indexes.each { |i| board.update(i, 'X') }
        expect(board.winning_line?).to be true
      end
    end
  end
    context 'when the board has no winner' do
      it 'returns false for a row with mixed symbols' do
        row = [0, 1, 2]
        row.each { |i| board.update(i, i.even? ? 'O': 'X') }
        expect(board.winning_line?).to be false
      end
      it 'returns false for a partially filled column' do
        column = [1, 4]
        column.each { |i| board.update(i, i.even? ? 'O': 'X') }
        expect(board.winning_line?).to be false
      end
    end
end