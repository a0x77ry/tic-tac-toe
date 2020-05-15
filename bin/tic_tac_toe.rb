#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative '../lib/game.rb'

def ask_for_new_game
  new_game = nil
  until !new_game.nil? && %w[y n].include?(new_game)
    puts "Do you want to play another game? [y/n] \n"
    new_game = gets.chomp
  end
  new_game == 'y'
end

quit = false
until quit
  game = Game.new

  game.next_round while game.winner.nil?

  result_text = if game.winner == Game.results[:draw]
                  'The game is draw'
                else
                  "The winner is #{game.winner}"
                end
  puts result_text
  puts "\n"

  quit = !ask_for_new_game
end
