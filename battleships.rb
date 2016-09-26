require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/board'

def welcome_message
  puts "Welcome to Battleships, a 2 player Ruby command line game"
end

def enter_names
  puts "Player 1 please enter your name"
  @player_1_name = gets.chomp
  puts ""
  puts "Player 2 please enter your name"
  @player_2_name = gets.chomp
  puts ""
end


welcome_message
enter_names
game = Game.new(Player.new(@player_1_name), Player.new(@player_2_name))
while game.game_over? == false
  game.play_turn
end
