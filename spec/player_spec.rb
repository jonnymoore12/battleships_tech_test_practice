require 'player'

describe Player do
  let(:jonny) { Player.new('Jonny') }
  let(:dave) { Player.new('Dave') }
  let(:game) { Game.new(jonny, dave) }
  it 'is initialized with a name' do
    expect(jonny.name).to eq 'Jonny'
  end

  it 'is initialized with placed_ship set to false' do
    expect(jonny.placed_ship).to be false
  end

  it 'assigns a board to the player on initialization' do
    expect(jonny.board).not_to be nil
  end

end
