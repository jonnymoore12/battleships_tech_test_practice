require 'board'

describe Board do
  SHIP_PIECES = 1
  let(:board) { Board.new(5) }

  it 'is initialized with no ships placed on the board' do
    expect(board.ship_locations).to eq []
  end

  it 'is initialized with no ship pieces sank' do
    expect(board.ship_pieces_sank).to eq 0
  end

  describe '#all_ships_sank' do
    it 'initially returns false' do
      expect(board.all_ships_sank?).to be false
    end
    it 'returns true if all ships have been sank' do
      board = double(:board, ship_pieces_sank: SHIP_PIECES)
      expect(board.all_ships_sank?).to be true
    end
  end
end
