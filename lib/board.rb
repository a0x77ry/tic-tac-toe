# frozen_string_literal: true

# Board class for tic-tac-toe
class Board
  require_relative 'player'

  @@marks = { x: 'x', o: 'o', n: '-' }
  @@win_lanes = [
    [[0, 0], [0, 1], [0, 2]],
    [[1, 0], [1, 1], [1, 2]],
    [[2, 0], [2, 1], [2, 2]],
    [[0, 0], [1, 0], [2, 0]],
    [[0, 1], [1, 1], [2, 1]],
    [[0, 2], [1, 2], [2, 2]],
    [[0, 0], [1, 1], [2, 2]],
    [[0, 2], [1, 1], [2, 0]]
  ]

  attr_reader :grid, :grid_str

  def initialize
    @grid = [
      ['-', '-', '-'],
      ['-', '-', '-'],
      ['-', '-', '-']
    ]
    self.grid_str = @grid
  end

  def self.marks
    @@marks
  end

  def self.win_lanes
    @@win_lanes
  end

  def update(player, row, col)
    @grid[row][col] = player.mark
    self.grid_str = @grid
  end

  def filled?
    grid.each do |row|
      row.each { |item| return false if item == '-' }
    end
  end

  def illegal?(row, column)
    if grid[row].nil? ||
       grid[row][column] != '-' ||
       row < 0 ||
       row > 2 ||
       column < 0 ||
       column > 2
      return true
    end

    false
  end

  private

  def grid_str=(grid)
    @grid_str = "  | 1 | 2 | 3 \n" \
                "--------------\n" \
                "1 | #{grid[0][0]} | #{grid[0][1]} | #{grid[0][2]} \n" \
                "--------------\n" \
                "2 | #{grid[1][0]} | #{grid[1][1]} | #{grid[1][2]} \n" \
                "--------------\n" \
                "3 | #{grid[2][0]} | #{grid[2][1]} | #{grid[2][2]} \n\n"
  end
end
