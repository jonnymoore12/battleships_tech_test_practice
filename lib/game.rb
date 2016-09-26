require_relative 'player'
require_relative 'board'

class Game

  BOARD_SIZE = 5

  attr_reader :game_over, :players, :current_player, :player1, :player2,
              :loser

  def initialize(player1, player2)
    @game_over = false
    @player1 = player1
    @player2 = player2
    # Do we need @players or is this just for my tests?
    @players = [@player1, @player2]
    @current_player = @player1
    @game_over = false
    @loser = nil
    setup
  end

  def setup
    @player1.place_ship
    puts ""
    @player2.place_ship
    puts ""
  end

  def play_turn
    puts "#{@current_player.name} it is your turn..."
    coordinate = @current_player.fire_missile
    missile_hits?(coordinate)
    game_over?
    swap_turns
  end

  def missile_hits?(coordinate)
    if opponent.board.ship_locations.include?(coordinate)
      opponent.board.ship_pieces_sank += 1
      puts "Missile hits. Ship sinks!\n\n"
      true
    else
      puts "Missile misses target.\n\n"
      false
    end
  end

  def opponent
    @current_player == @player1 ? @player2 : @player1
  end

  def swap_turns
    @current_player == @player1 ? @current_player = @player2 : @current_player = @player1
  end

  def game_over?
    if (@player1.board.all_ships_sank? == true) or (@player2.board.all_ships_sank? == true)
      game_over_message
      @game_over = true
    else
      @game_over = false
    end
  end

  def game_over_message
    if @player1.board.all_ships_sank? == true
      @loser = @player1
      puts "#{@player2.name} wins Battleship!"
    else
      @loser = @player2
      puts "#{@player1.name} wins Battleship!"
    end
  end

end
