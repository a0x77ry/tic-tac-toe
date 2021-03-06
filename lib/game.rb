# frozen_string_literal: true

class Game
  require_relative 'board'
  require_relative 'player'

  @@results = { player1: 'Player 1', player2: 'Player 2', draw: 'Draw' }

  attr_accessor :winner

  def initialize
    self.winner = nil
    @board = Board.new
    @p1 = Player.new('Player 1', Board.marks[:x])
    @p2 = Player.new('Player 2', Board.marks[:o])
    @current_p = @p1
  end

  def self.results
    @@results
  end

  def next_round
    p_row = -1
    p_column = -1
    while @board.illegal?(p_row - 1, p_column - 1)
      show_board(@board)
      puts "It's #{@current_p.name}'s turn.\n"
      puts 'Write your row number [1-3]: '
      p_row = gets.chomp.to_i
      puts 'Write your column number [1-3]: '
      p_column = gets.chomp.to_i
    end

    # Row and column - 1 because the grid numbering for the user is different
    @board.update(@current_p, p_row - 1, p_column - 1)
    check_winner(@board)
    @current_p = @current_p == @p1 ? @p2 : @p1
  end

  def show_board(board)
    puts board.grid_str
  end

  def check_winner(board)
    Board.win_lanes.each do |lane|
      end_mark = get_end_mark(board, lane)
      if [Board.marks[:x], Board.marks[:o]].include?(end_mark)
        self.winner = @current_p == @p1 ? @@results[:player1] : @@results[:player2]
        return true
      end
    end

    if @board.filled? && winner.nil?
      self.winner = @@results[:draw]
      return true
    end

    false
  end

  private

  def get_end_mark(board, lane)
    gr = board.grid
    if [gr[lane[0][0]][lane[0][1]],
        gr[lane[1][0]][lane[1][1]],
        gr[lane[2][0]][lane[2][1]]].uniq.length == 1
      return gr[lane[0][0]][lane[0][1]]
    end

    nil
  end
end
