
require_relative 'game_board.rb'
require_relative 'knight.rb'

new_game = GameBoard.new
new_knight = Knight.new
board = new_game.create_board
graph = new_game.build_graph(board)
new_knight.knight_moves(board.sample, board.sample, graph)

