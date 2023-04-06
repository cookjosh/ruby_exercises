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

    new_board = []
    # Comment examples based on space 4, 4
    game_board.each_with_index do |elem, index|
      connection_array = []
      
      if game_board.include? [elem[0] + 2, elem[1] + 1] #north_east_move_one
        connection_array << [elem[0] + 2, elem[1] + 1] #6, 5
      end
      if game_board.include? [elem[0] + 1, elem[1] + 2] #north_east_move_two
        connection_array << [elem[0] + 1, elem[1] + 2] #5, 6
      end
      if game_board.include? [elem[0] + 2, elem[1] - 1] #north_west_move_one
        connection_array << [elem[0] + 2, elem[1] - 1] #6, 3
      end
      if game_board.include? [elem[0] + 1, elem[1] - 2] #north_west_move_two
        connection_array << [elem[0] + 1, elem[1] - 2] #5, 2
      end
      if game_board.include? [elem[0] - 2, elem[1] + 1] #south_east_move_one
        connection_array << [elem[0] - 2, elem[1] + 1] #2, 5
      end
      if game_board.include? [elem[0] - 1, elem[1] + 2] #south_east_move_two
        connection_array << [elem[0] - 1, elem[1] + 2] #3, 6
      end
      if game_board.include? [elem[0] - 2, elem[1] - 1] #south_west_move_two
        connection_array << [elem[0] - 2, elem[1] - 1] #2, 3
      end
      if game_board.include? [elem[0] - 1, elem[1] - 2] #south_west_move_two
        connection_array << [elem[0] - 1, elem[1] - 2] #3, 2
      end
      new_board << [elem, connection_array]
    end

    return new_board
  end
end

class Knight

  def initialize
    @counter_array = []
    @holding_array = []
    @visited_squares_array = []
  end
  
  def knight_moves(start_point = nil, end_point = nil, board = nil, counter = 1)

    board.each do |elem|
      if elem[0] == start_point
        start_point = elem
      end
    end

    p start_point

    if @visited_squares_array.include? start_point[0]

    elsif start_point[0] == end_point
      return "Done!"
    else
      @visited_squares_array << start_point.shift
      start_point = start_point[0]
      p start_point
      start_point.each do |elem|
        if elem == end_point
          return "Done! #{start_point[0]} -> #{elem}"
        else
          @holding_array << elem
        end
      end
    end

    @holding_array.each do |elem|
      knight_moves(elem, end_point, board)
    end
      
  end

end


new_game = GameBoard.new
new_knight = Knight.new
board = new_game.create_board
graph = new_game.build_graph(board)
p new_knight.knight_moves([1, 1], [5, 3], graph)

=begin
game_board = [[[1, 1], [[3, 2], [2, 3]]], [[1, 2], [[3, 3], [2, 4], [3, 1]]], [[1, 3], [[3, 4], [2, 5], [3, 2], [2, 1]]], 
[[1, 4], [[3, 5], [2, 6], [3, 3], [2, 2]]], [[1, 5], [[3, 6], [2, 7], [3, 4], [2, 3]]], [[1, 6], [[3, 7], [2, 8], [3, 5], [2, 4]]], 
[[1, 7], [[3, 8], [3, 6], [2, 5]]], [[1, 8], [[3, 7], [2, 6]]], [[2, 1], [[4, 2], [3, 3], [1, 3]]], [[2, 2], [[4, 3], [3, 4], [4, 1], [1, 4]]], 
[[2, 3], [[4, 4], [3, 5], [4, 2], [3, 1], [1, 5], [1, 1]]], [[2, 4], [[4, 5], [3, 6], [4, 3], [3, 2], [1, 6], [1, 2]]], 
[[2, 5], [[4, 6], [3, 7], [4, 4], [3, 3], [1, 7], [1, 3]]], [[2, 6], [[4, 7], [3, 8], [4, 5], [3, 4], [1, 8], [1, 4]]], [[2, 7], [[4, 8], [4, 6], [3, 5], [1, 5]]], 
[[2, 8], [[4, 7], [3, 6], [1, 6]]], [[3, 1], [[5, 2], [4, 3], [1, 2], [2, 3]]], [[3, 2], [[5, 3], [4, 4], [5, 1], [1, 3], [2, 4], [1, 1]]], 
[[3, 3], [[5, 4], [4, 5], [5, 2], [4, 1], [1, 4], [2, 5], [1, 2], [2, 1]]], [[3, 4], [[5, 5], [4, 6], [5, 3], [4, 2], [1, 5], [2, 6], [1, 3], [2, 2]]], 
[[3, 5], [[5, 6], [4, 7], [5, 4], [4, 3], [1, 6], [2, 7], [1, 4], [2, 3]]], [[3, 6], [[5, 7], [4, 8], [5, 5], [4, 4], [1, 7], [2, 8], [1, 5], [2, 4]]], 
[[3, 7], [[5, 8], [5, 6], [4, 5], [1, 8], [1, 6], [2, 5]]], [[3, 8], [[5, 7], [4, 6], [1, 7], [2, 6]]], [[4, 1], [[6, 2], [5, 3], [2, 2], [3, 3]]], 
[[4, 2], [[6, 3], [5, 4], [6, 1], [2, 3], [3, 4], [2, 1]]], [[4, 3], [[6, 4], [5, 5], [6, 2], [5, 1], [2, 4], [3, 5], [2, 2], [3, 1]]], 
[[4, 4], [[6, 5], [5, 6], [6, 3], [5, 2], [2, 5], [3, 6], [2, 3], [3, 2]]], [[4, 5], [[6, 6], [5, 7], [6, 4], [5, 3], [2, 6], [3, 7], [2, 4], [3, 3]]], 
[[4, 6], [[6, 7], [5, 8], [6, 5], [5, 4], [2, 7], [3, 8], [2, 5], [3, 4]]], [[4, 7], [[6, 8], [6, 6], [5, 5], [2, 8], [2, 6], [3, 5]]], [[4, 8], [[6, 7], [5, 6], [2, 7], [3, 6]]], 
[[5, 1], [[7, 2], [6, 3], [3, 2], [4, 3]]], [[5, 2], [[7, 3], [6, 4], [7, 1], [3, 3], [4, 4], [3, 1]]], [[5, 3], [[7, 4], [6, 5], [7, 2], [6, 1], [3, 4], [4, 5], [3, 2], [4, 1]]], 
[[5, 4], [[7, 5], [6, 6], [7, 3], [6, 2], [3, 5], [4, 6], [3, 3], [4, 2]]], [[5, 5], [[7, 6], [6, 7], [7, 4], [6, 3], [3, 6], [4, 7], [3, 4], [4, 3]]], 
[[5, 6], [[7, 7], [6, 8], [7, 5], [6, 4], [3, 7], [4, 8], [3, 5], [4, 4]]], [[5, 7], [[7, 8], [7, 6], [6, 5], [3, 8], [3, 6], [4, 5]]], [[5, 8], 
[[7, 7], [6, 6], [3, 7], [4, 6]]], [[6, 1], [[8, 2], [7, 3], [4, 2], [5, 3]]], [[6, 2], [[8, 3], [7, 4], [8, 1], [4, 3], [5, 4], [4, 1]]], 
[[6, 3], [[8, 4], [7, 5], [8, 2], [7, 1], [4, 4], [5, 5], [4, 2], [5, 1]]], [[6, 4], [[8, 5], [7, 6], [8, 3], [7, 2], [4, 5], [5, 6], [4, 3], [5, 2]]], 
[[6, 5], [[8, 6], [7, 7], [8, 4], [7, 3], [4, 6], [5, 7], [4, 4], [5, 3]]], [[6, 6], [[8, 7], [7, 8], [8, 5], [7, 4], [4, 7], [5, 8], [4, 5], [5, 4]]], 
[[6, 7], [[8, 8], [8, 6], [7, 5], [4, 8], [4, 6], [5, 5]]], [[6, 8], [[8, 7], [7, 6], [4, 7], [5, 6]]], [[7, 1], [[8, 3], [5, 2], [6, 3]]], 
[[7, 2], [[8, 4], [5, 3], [6, 4], [5, 1]]], [[7, 3], [[8, 5], [8, 1], [5, 4], [6, 5], [5, 2], [6, 1]]], [[7, 4], [[8, 6], [8, 2], [5, 5], [6, 6], [5, 3], [6, 2]]], 
[[7, 5], [[8, 7], [8, 3], [5, 6], [6, 7], [5, 4], [6, 3]]], [[7, 6], [[8, 8], [8, 4], [5, 7], [6, 8], [5, 5], [6, 4]]], [[7, 7], [[8, 5], [5, 8], [5, 6], [6, 5]]], 
[[7, 8], [[8, 6], [5, 7], [6, 6]]], [[8, 1], [[6, 2], [7, 3]]], [[8, 2], [[6, 3], [7, 4], [6, 1]]], [[8, 3], [[6, 4], [7, 5], [6, 2], [7, 1]]], [[8, 4], 
[[6, 5], [7, 6], [6, 3], [7, 2]]], [[8, 5], [[6, 6], [7, 7], [6, 4], [7, 3]]], [[8, 6], [[6, 7], [7, 8], [6, 5], [7, 4]]], [[8, 7], [[6, 8], [6, 6], [7, 5]]], 
[[8, 8], [[6, 7], [7, 6]]]]
=end