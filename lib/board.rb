class Board

  attr_reader :ship_locations
  attr_accessor :ship_pieces_sank

  SHIP_PIECES = 1

  def initialize(size)
    @size = size
    @ship_locations = []
    @ship_pieces_sank = 0
  end

  def all_ships_sank?
    return true if @ship_pieces_sank == SHIP_PIECES
    return false
  end

end
