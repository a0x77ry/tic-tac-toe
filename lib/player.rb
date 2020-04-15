class Player
  require "../lib/board.rb"

  attr_accessor :mark, :name

  def initialize(name, mark)
    self.name = name
    self.mark = mark
  end
end
