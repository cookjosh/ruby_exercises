class GameBoard
  attr_accessor :game_board,

  def initialize
    @game_board = self.create_board()
  end

  def create_board
    arr = []

    (0..7).each do |elem|
      (0..7).each do |next_elem|
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
  def knight_moves(start_point, end_point)
  end
end

game_board = []

(0..7).each do |elem|
  (0..7).each do |next_elem|
    game_board << [elem, next_elem]
  end
end

new_game = GameBoard.new
board = new_game.create_board
new_game.build_graph(board)
