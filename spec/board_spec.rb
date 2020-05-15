# frozen_string_literal: true

require './lib/board.rb'

describe Board do
  before { @board = Board.new }

  context '#illegal?' do
    it 'returns true if user input is out of bounds' do
      expect(@board.illegal?(0, 3)).to eql(true)
    end

    it 'return false if user input is in bounds' do
      expect(@board.illegal?(1, 1)).to eql(false)
    end
  end
end
