# frozen_string_literal: true

require './lib/game.rb'

describe Game do
  context '#check_winner' do
    it 'should produce winner if a winning lane exists' do
      winning_board = double('board')
      allow(winning_board).to receive(:grid) {
        %w[[x x x]
           [- - -]
           [- - -]]
      }
      game = Game.new
      expect(game.check_winner(winning_board)).not_to eql(nil)
      expect(game.check_winner(winning_board)).not_to eql(Game.results[:draw])
    end
  end
end
