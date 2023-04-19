require './lib/connect_four.rb'

describe GameBoard do
  describe '#create_board' do
    it 'prints a valid game board' do
      new_board = GameBoard.new
      sample_row = [ '[ ]', '[ ]', '[ ]', '[ ]', '[ ]', '[ ]', '[ ]' ]
      sample_array = []
      (0..5).each do |elem|
        sample_array.push("Row #{elem + 1} #{sample_row.join}")
      end
      (0..5).each do |elem|
        if sample_array[elem] == new_board.row_collection[elem]
          puts true
        end
      end
    end
  end
end

describe Player do
  describe '#initialize' do
    it 'count variable returns 2 if two players are created' do
      player_one = Player.new
      player_two = Player.new
      expect(player_two.player_count).to eq(2)
    end
  end

  describe '#verify_input' do
    context 'when player input is valid' do
      it 'returns an array of [2, 2] for a simulated player selection of that spot' do
        player = Player.new
        valid_row_input = '2'
        valid_column_input = '2'
        test_array = player.verify_input(valid_row_input, valid_column_input)
        expect(test_array).to eq([2, 2])
      end
    end
  end

end