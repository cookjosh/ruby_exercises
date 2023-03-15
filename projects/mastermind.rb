# feedback_array: red means element and index match, black just means match
# If redoing, I'd probably build all guess/code creation/code generation into a Code module

# 3/13 - Next step, if user is Mastermind, start with computer generating a secret code
# check that guess and get feedback
# next step, retain matches and generate remaining elements in array

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
  attr_accessor :guess_array, :player_code
  def initialize
    @guess_array = []
    @player_code = []
  end
  def player_create_code
    puts 'Create a code! Enter a color and press enter four times.'
    (1..4).each do
      @player_code.push(gets.downcase.strip)
    end
    return @player_code
  end
  def player_guess
    puts 'Take a guess! Enter a color and press enter four times.'
    (1..4).each do
      @guess_array.push(gets.downcase.strip)
    end
    return @guess_array
  end
end

class GameFlow
  attr_reader :user_answer
  def initialize(game_board, player)
    @game_board = game_board
    @player = player
    @feedback_array = []
    @user_answer = ''
  end
  def ask_player
    puts 'Do you want to be the Mastermind or Codebreaker?'
    @user_answer = gets.downcase.strip
    return @user_answer
  end
  def create_environment
    ask_player()
    if @user_answer == 'mastermind'
      @player.player_create_code()
      return @player.player_code
    elsif @user_answer == 'codebreaker'
      @game_board.generate_secret_code() 
      return @game_board.secret_code
    else
      puts 'Please enter Mastermind or Codebreaker.'
    end
  end
  def game_play # Want to write logic of checking arrays against each other
    # possibly remove `create_environment` func and put in this
    # conditionals expanded to handle comparing arrays
    
  end
  def check_guess
    index = 0
    (@player.guess_array).each do |elem|
      if (@game_board.secret_code.include?(elem))
        if @game_board.secret_code[index] == elem
          @feedback_array.push('red')
        else
          @feedback_array.push('black')
        end
      else
        @feedback_array.push(nil)
      end
      index += 1
    end
    return @feedback_array
  end
end

game_board = GameBoard.new
player = Player.new
game_flow  = GameFlow.new(game_board, player)
game_flow.create_environment()
p game_flow.game_play()

