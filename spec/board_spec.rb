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

  describe '#full' do
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
end