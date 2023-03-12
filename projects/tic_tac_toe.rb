# Basic Ruby tic tac toe game
# Does not prevent overwrites by other player

module PlayerMoves
  attr_reader :row, :index
  def get_move
    # Add conditional if Player 1 put x, if Player 2 put o
    puts 'Which row? Top: 1, Middle: 2, Bottom: 3'
    @row = gets.to_i
    puts 'Which position? Left: 1, Middle: 2, Right: 3'
    @index = (gets.to_i)
    return [@row, @index]
  end
end

class Player
  attr_accessor :count, :player_number
  @@count = 0
  def initialize
    @@count += 1
    @player_number = @@count
  end
  def player_count
    return @player_number
  end
end

class GameBoard
  attr_accessor :top_row_array, :middle_row_array, :last_row_array
  attr_reader :winning_horizontal_array
  def initialize
    @top_row_array = ['  ', '|', '  ', '|', '   ']
    @middle_row_array = ['  ', '|', '  ', '|', '  ']
    @bottom_row_array = ['  ', '|', '  ', '|', '  ']
    @divider_row_array = ['--+', '--', '+--']
    @winning_horizontal_array = [['x ', '|', 'x ', '|', 'x '], ['o ', '|', 'o ', '|', 'o ']]
  end
  def print_board
    print "#{@top_row_array.join}\n"
    print "#{@divider_row_array.join}\n"
    print "#{@middle_row_array.join}\n"
    print "#{@divider_row_array.join}\n"
    print "#{@bottom_row_array.join}\n\n"
  end
  def check_winner
    [0, 2, 4].each do |i|
      if (@top_row_array[i] == 'x ' && @middle_row_array[i] == 'x ' && @bottom_row_array[i] == 'x ') ||
        (@top_row_array[i] == 'o ' && @middle_row_array[i] == 'o ' && @bottom_row_array[i] == 'o ')
        return 1
      end    
    end
    if (@top_row_array[0] == 'x ' && @middle_row_array[2] == 'x ' && @bottom_row_array[4] == 'x ') ||
      (@top_row_array[0] == 'o ' && @middle_row_array[2] == 'o ' && @bottom_row_array[4] == 'o ')
      return 1
    end
    if (@top_row_array[4] == 'x ' && @middle_row_array[2] == 'x ' && @bottom_row_array[0] == 'x ') ||
      (@top_row_array[4] == 'o ' && @middle_row_array[2] == 'o ' && @bottom_row_array[0] == 'o ')
      return 1
    end      
    if @winning_horizontal_array.include?(@top_row_array) || @winning_horizontal_array.include?(@middle_row_array) || @winning_horizontal_array.include?(@bottom_row_array)
      return 1
    end
    
  end
  def place_move(row, index, symbol)
    if row == 1
      @top_row_array[index] = "#{symbol} "
    elsif row == 2
      @middle_row_array[index] = "#{symbol} "
    elsif row == 3
      @bottom_row_array[index] = "#{symbol} "
    else
      puts 'Invalid entry'
    end
  end
end

class Game
  include PlayerMoves
  attr_accessor :game_over
  def initialize(game_board, player_one, player_two)
    @game_board = game_board
    @player_one = player_one
    @player_two = player_two
    @current_player = @player_one
    @game_over = false
  end
  def print_game_board # Unsure if this is necessary
    return @game_board.print_board()
  end      
  def turn_start
    get_move()
  end
  def turn_end(row, index, symbol)
    if index == 1
      new_index = 0
    elsif index == 2
      new_index = 2
    elsif index == 3
      new_index = 4
    end
    @game_board.place_move(row, new_index, symbol)
  end
  def play_game
    @round = 1
    while @game_over == false
      self.print_game_board
      if @round.even? == false
        current_player = 'Player One'
        symbol = 'x'
      elsif @round.even? == true
        current_player = 'Player Two'
        symbol = 'o'
      end
      puts "#{current_player}'s turn! Next move, #{current_player}: "
      turn_array = self.turn_start
      self.turn_end(turn_array[0], turn_array[1], symbol)
      @round += 1
      game_status = @game_board.check_winner
      if game_status == 1
        puts "Game Over!"
        self.print_game_board
        @game_over = true
      end   
    end
  end
end

board = GameBoard.new
player_one = Player.new
player_two = Player.new
game = Game.new(board, player_one, player_two)
game.play_game

