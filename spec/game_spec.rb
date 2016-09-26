require 'game'

describe Game do
  player1 = Player.new('Jonny')
  player2 = Player.new('Dave')
  game = Game.new(player1, player2)

  it " 'game over' property is false when initialised" do
    expect(game.game_over).to be false
  end

  it 'should be initialized with two players' do
    expect(game.players.count).to be 2
  end

  describe '#setup' do
    it 'player 1 places their ship on their board' do
      expect(player1.placed_ship).to be true
    end
    it 'player 2 places their ship on their board' do
      expect(player2.placed_ship).to be true
    end
    it "player 1's ship appears on their board" do
      expect(player1.board.ship_locations).not_to be_empty
    end
    it "player 2's ship appears on their board" do
      expect(player2.board.ship_locations).not_to be_empty
    end
  end

  describe 'Current player' do
    it 'the current player is initially player1' do
      expect(game.current_player).to be player1
    end
    it 'swap_turns swaps the current player' do
      expect(game.current_player).to be player1
      game.swap_turns
      expect(game.current_player).to be player2
    end
  end

  describe '#opponent' do
    it 'returns player2 if current_player is player1' do
      player1 = Player.new('Jonny')
      player2 = Player.new('Dave')
      game = Game.new(player1, player2)
      expect(game.current_player.name).to eq 'Jonny'
      expect(game.opponent.name).to eq 'Dave'
    end
    it 'returns player1 if current_player is player2' do
      player1 = Player.new('Jonny')
      player2 = Player.new('Dave')
      game = Game.new(player1, player2)
      game.swap_turns
      expect(game.current_player.name).to eq 'Dave'
      expect(game.opponent.name).to eq 'Jonny'
    end
  end

  describe '#game_over' do
    it "is initially set to false" do
      expect(game.game_over).to be false
    end
    it "returns true if all ships on a board have been sank" do
      allow(player1.board).to receive(:all_ships_sank?).and_return true
      expect(game.game_over?).to be true
    end
    it "sets loser equal to the losing player" do
      allow(player1.board).to receive(:all_ships_sank?).and_return true
      expect(game.loser).to eq player1
    end
  end

end
