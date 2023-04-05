class GameBoard
  attr_accessor :game_board,

  def initialize
    @game_board = self.create_board()
  end

  def create_board
    arr = []

    (1..8).each do |elem|
      (1..8).each do |next_elem|
        arr << [elem, next_elem]
      end
    end

    arr
  end

  def build_graph(game_board)
    game_board.each do |elem|
      if game_board.include? [(elem[0] + 2), (elem[1] + 1)]
        puts "#{elem} -> #{[(elem[0] + 2), (elem[1] + 1)]}"
      end
    end
  end
      
end

class Knight
  # Notes - possibly build this recursively taking each move one at a time then constructing next possible moves
  # Do this until one of the "next moves" eq the end_point
  def knight_moves(start_point = 0, end_point = 0, game_board = nil)
    # Separting possible moves into quadrants, if [0] is "up" (north) or "down" (south)
    # and [1] is "left" (west) or "right" (east)
    north_east_move_one = [start_point[0] + 2, start_point[1] + 1] 
    north_east_move_two = [start_point[0] + 1, start_point[1] + 2]

    north_west_move_one = [start_point[0] + 2, start_point[1] - 1] 
    north_west_move_two = [start_point[0] + 1, start_point[1] - 2]

    south_east_move_one = [start_point[0] - 2, start_point[1] + 1] 
    south_east_move_two = [start_point[0] - 1, start_point[1] + 2]

    south_west_move_one = [start_point[0] - 2, start_point[1] - 1] 
    south_west_move_two = [start_point[0] - 1, start_point[1] - 2]

    moves_array = [north_east_move_one, north_east_move_two, 
      north_west_move_one, north_west_move_two, 
      south_east_move_one, south_east_move_two, 
      south_west_move_one, south_west_move_two]

    # Hopefully by checking if the board includes the next possible move, we can avoid "off-board" moves
    # Later - possibly build in a check if the start_point is "less or greater than" the end_point
    # depending on that, we can decide which conditional direction we'd want to check instead of
    # checking each one.
    moves_array.each do |move|
      if move == end_point
        puts "Move: #{start_point} -> #{end_point}"
        return
      end
    end
=begin
    elsif game_board.include? north_east_move_one
      puts "Legal move #{start_point} -> #{north_east_move_one}"
    elsif game_board.include? north_east_move_two
      puts "Legal move #{start_point} -> #{north_east_move_two}"
    else game_board.include? [start_point[0] - 2, start_point[1] - 1] || game_board.include? [start_point[0] - 1, start_point[1] - 2]
      puts "Legal move #{start_point} -> #{[start_point[0] + 2, start_point[1] + 1]}"
    end
=end
  end
end

game_board = []

(0..7).each do |elem|
  (0..7).each do |next_elem|
    game_board << [elem, next_elem]
  end
end

new_game = GameBoard.new
new_knight = Knight.new
board = new_game.create_board
new_knight.knight_moves([0,0], [2,1], board)
