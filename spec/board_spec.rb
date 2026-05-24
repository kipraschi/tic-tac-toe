require_relative '../lib/board'

RSpec.describe Board do
  subject (:board) { described_class.new }
  describe '#update' do
    it 'updates the cell with the given symbol' do
      board.update(5, 'X')
      expect(board.board[5]).to eq('X')
    end
  end
end