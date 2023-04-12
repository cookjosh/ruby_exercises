require './lib/tic_tac_toe.rb'

describe Player do
  describe '#player_count' do
    it 'returns 1 for one instance of a player' do
      player = Player.new
      expect(player.player_count).to eq(1)
    end

    it 'returns 2 for a second instance of a player' do
      player_two = Player.new
      expect(player_two.player_count).to eq(2)
    end
  end
end

describe GameBoard do

end

describe Game do

end