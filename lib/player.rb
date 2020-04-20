# frozen_string_literal: true

class Player
  require_relative 'board'

  attr_accessor :mark, :name

  def initialize(name, mark)
    self.name = name
    self.mark = mark
  end
end
