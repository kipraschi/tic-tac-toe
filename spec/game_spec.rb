require_relative '../lib/game'
require_relative '../lib/board'

RSpec.describe Game do
  subject(:game) { described_class.new }
  let(:board) { game.instance_variable_get(:@board) }

  describe "#play" do
    before do
    allow(game).to receive(:puts)
    allow(board).to receive(:draw)
    end
    
    it "calls the Board#draw method" do
      allow(game).to receive(:game_over?).and_return(true)
      expect(board).to receive(:draw)
      game.play
    end

    context 'until the game is not over' do
      before do
        allow(game).to receive(:game_over?).and_return(false, true)
        allow(game).to receive(:play_round)
      end
      it 'checks if game is over' do
        expect(game).to receive(:game_over?)
        game.play
      end
      it "calls play_round" do
        expect(game).to receive(:play_round).once
        game.play
      end
    end
    
    context 'when game is over' do
      it "calls end_game" do
        allow(game).to receive(:game_over?).and_return(true)
        allow(game).to receive(:end_game)
        expect(game).to receive(:end_game)
        game.play
      end
    end
  end
end
