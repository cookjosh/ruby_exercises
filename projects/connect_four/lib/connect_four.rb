
class GameBoard
  attr_accessor :row_1, :row_2, :row_3, :row_4, :row_5, :row_6, :row_collection

  def initialize
    @row_1 = [ '[ ]', '[ ]', '[ ]', '[ ]', '[ ]', '[ ]', '[ ]' ]
    @row_2 = [ '[ ]', '[ ]', '[ ]', '[ ]', '[ ]', '[ ]', '[ ]' ]
    @row_3 = [ '[ ]', '[ ]', '[ ]', '[ ]', '[ ]', '[ ]', '[ ]' ]
    @row_4 = [ '[ ]', '[ ]', '[ ]', '[ ]', '[ ]', '[ ]', '[ ]' ]
    @row_5 = [ '[ ]', '[ ]', '[ ]', '[ ]', '[ ]', '[ ]', '[ ]' ]
    @row_6 = [ '[ ]', '[ ]', '[ ]', '[ ]', '[ ]', '[ ]', '[ ]' ]
    @row_collection = [@row_1, @row_2, @row_3, @row_4, @row_5, @row_6]
  end

  def create_board
    (0..5).each do |elem|
      puts "Row #{elem}: #{@row_collection[elem].join}"
    end
  end

end

class Player
  attr_accessor :count, :player_number, :move_array
  @@count = 0

  def initialize(row_selection = nil, column_selection = nil)
    @@count += 1
    @player_number = @@count
    @move_array = []
  end

  def player_count
    return @player_number
  end

  def player_move
    loop do
      puts 'Choose a Row between 0 and 5'
      @row_selection = gets.chomp
      break if @row_selection.match(/^[0-9]$/)
    end
    loop do
      puts 'Choose a Row between 0 and 5'
      @column_selection = gets.chomp
      break if @column_selection.match(/^[0-9]$/)
    end
  end

  def verify_input(row_selection, column_selection)
    if row_selection.match?(/^[0-9]$/)
      @move_array[0] = row_selection.to_i
    end
    if column_selection.match?(/^[0-9]$/)
      @move_array[1] = column_selection.to_i
    end
    return @move_array
  end

end


#new_board = GameBoard.new
#new_board.create_board