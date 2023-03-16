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
    (0..3).each do |i|
      @secret_code[i] = COLORS.sample
    end
  end
end

class Player
  attr_accessor :player_code
  def initialize
    @player_code = []
  end

  def player_create_code
    puts 'Create a code! Enter a color and press enter four times.'
    (0..3).each do |i|
      @player_code[i] = gets.downcase.strip
    end
    return @player_code
  end
end

class GameFlow
  attr_accessor :guess_array
  attr_reader :user_answer
  def initialize(game_board, player)
    @game_board = game_board
    @player = player
    @guess_array = []
    @feedback_array = []
    @user_answer = ''
    @index = 0
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
      puts "Prepare to guess!"
    else
      puts 'Please enter Mastermind or Codebreaker.'
    end
  end

  def game_play # Want to write logic of checking arrays against each other
    # possibly remove `create_environment` func and put in this
    # conditionals expanded to handle comparing arrays
    @game_board.generate_secret_code()
    p @game_board.secret_code
    while @feedback_array != ['white', 'white', 'white', 'white']
      @index = 0
      @feedback_array = []
      if @user_answer == 'mastermind'
        check_player_code()
      elsif @user_answer == 'codebreaker'
        @player.player_create_code()
        check_computer_code()
        p @feedback_array
      else
        puts 'Please enter Mastermind or Codebreaker.'
      end
      @index = 0
    end
  end

  def check_computer_code
    @feedback_array = []
    (@player.player_code).each do |elem|
      p @index
      if (@game_board.secret_code.include?(elem))
        if @game_board.secret_code[@index] == elem
          @feedback_array[@index] = 'white'
        else
          @feedback_array[@index] = 'black'
        end
      else
        @feedback_array[@index] = nil
      end
      @index += 1
    end
    return @feedback_array
  end

  def check_player_code #This and check_computer_code could probably be one general check method
    @feedback_array = []
    (@game_board.secret_code).each do |elem|
      if (@player.player_code.include?(elem))
        if @player.player_code[@index] == elem
          @feedback_array[@index] = 'white'
        else
          @feedback_array[@index] = 'black'
        end
      else
        @feedback_array[@index] = nil
      end
      @index += 1
    end
    return @feedback_array
  end
end

game_board = GameBoard.new
player = Player.new
game_flow  = GameFlow.new(game_board, player)
game_flow.create_environment()
game_flow.game_play()

