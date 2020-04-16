# frozen_string_literal: true

require_relative '../lib/game.rb'

quit = false

until quit
  game = Game.new

  game.next_round while game.winner.nil?

  result_text = game.winner == Game.results[:draw] ? 'The game is draw' : "The winner is #{game.winner}"
  puts result_text
  puts "\n"

  new_game = nil
  until !new_game.nil? && (new_game.downcase == 'y' || new_game.downcase == 'n')
    puts "Do you want to play another game? [y/n] \n"
    new_game = gets.chomp
  end

  quit = new_game == 'n'
end
