

module PlayerMoves
  attr_reader :row, :index
  def get_move
    # Add conditional if Player 1 put x, if Player 2 put o
    puts "Which row? Top: 1, Middle: 2, Bottom: 3"
    @row = gets.to_i
    puts "Which position? Left: 1, Middle: 2, Right: 3"
    @index = (gets.to_i - 1)
    return [@row, @index]
  end
end


class GameBoard
  attr_accessor :top_row_array, :middle_row_array, :last_row_array
  def initialize
    @@top_row_array = ['  |', '  |', '   ']
    @@middle_row_array = ['  |', '  |', '   ']
    @@bottom_row_array = ['  |', '  |', '   ']
    @@divider_row_array = ['--+', '--', '+--']
  end
  def print_board
    print "#{@@top_row_array.join}\n"
    print "#{@@divider_row_array.join}\n"
    print "#{@@middle_row_array.join}\n"
    print "#{@@divider_row_array.join}\n"
    print "#{@@bottom_row_array.join}\n\n"
  end
  def place_move(row, index)
    if row == 1
      @@top_row_array[index] = "x"
    elsif row == 2
      @@middle_row_array[index] = "x"
    elsif row == 3
      @@bottom_row_array[index] = "x"
    else
      puts "Invalid entry"
    end
  end
end

class Game
  include PlayerMoves
  def initialize(game_board)
    @game_board = game_board
  end
  def print_game_board # Unsure if this is necessary
    return @game_board.print_board()
  end
  def turn_start
    get_move()
  end
  def turn_end(row, index)
    @game_board.place_move(row, index)
  end
end

board = GameBoard.new
game = Game.new(board)
(1..3).each do 
  game.print_game_board
  turn_values = game.turn_start
  puts turn_values
  game.turn_end(turn_values[0], turn_values[1])
end

