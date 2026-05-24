require_relative '../lib/player'

RSpec.describe Player do
  subject (:player_x) {described_class.new('X')}
  describe '#select_cell' do
    context 'when the player enters 4 (a number in between 1-9)' do 
      before do
        allow(player_x).to receive(:gets).and_return('4')
      end
      it 'returns 3 (an index for the board array)' do
        expect(player_x.select_cell).to eq(3)
      end
    end

    let(:error_message) { "That's not a number 1 to 9!" }
    let(:correction_message) { 'Choose another number from 1 to 9 to make your move: ' }
  
    context 'when the player enters a symbols, an invalid number and a valid number' do 
      before do
        allow(player_x).to receive(:gets).and_return('?', '635', '3')
        allow(player_x).to receive(:puts).with(error_message)
        allow(player_x).to receive(:print).with(correction_message)
      end
      
      it 'outputs both error messages twice, ' do
        expect(player_x).to receive(:puts).with(error_message).twice
        expect(player_x).to receive(:print).with(correction_message).twice
        player_x.select_cell        
      end

      it 'returns 2 (an index for the board array)' do
        expect(player_x.select_cell).to eq(2)
      end
    end
  end
end