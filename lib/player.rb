require_relative 'board'

class Player

  attr_reader :name, :has_board, :placed_ship, :board, :all_ships_sank

  def initialize(name)
    @name = name
    @board = Board.new(5)
    @placed_ship = false
  end

  def place_ship
    puts "#{@name}, place your ship on the 5x5 grid by specifying a co-ordinate."
    puts "Example co-ordinate: A1 (A1 to E5)."
    @board.ship_locations << gets.chomp.upcase
    @placed_ship = true
  end

  def fire_missile
    puts "Select where you want to fire a missile."
    target = gets.chomp.upcase
    puts "Calibrating weapons system..."
    puts "Firing at #{target}."
    target
  end

end
