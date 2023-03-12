

class GameBoard
  attr_reader :secret_code
  COLORS = ['red', 'blue', 'orange', 'yellow', 'green', 'purple']
  def initialize
    @secret_code = []
  end
  def generate_secret_code
    (1..4).each do
      @secret_code.push(COLORS.sample)
    end
  end
end

class Player
  def player_guess
    guess_array = []
    puts "Take a guess! Enter a color and press enter four times."
    (1..4).each do
      guess_array.push(gets.downcase)
    end
    return guess_array
  end
end

class GameFlow
  def initialize(game_board, player)
    @game_board = game_board
    @player = player

new_game = GameBoard.new
player = Player.new
secret = new_game.secret_code
puts secret
puts player.player_guess
