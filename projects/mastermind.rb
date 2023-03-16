# feedback_array: white means element and index match, black just means match
# If redoing, I'd probably build all guess/code creation/code generation into a Code module
# I would also create one guess checking method

class GameBoard
  attr_accessor :secret_code
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
  COLORS = ['red', 'blue', 'orange', 'yellow', 'green', 'purple']
  attr_accessor :guess_array
  attr_reader :user_answer
  def initialize(game_board, player)
    @game_board = game_board
    @player = player
    @guess_array = []
    @feedback_array = []
    @user_answer = ''
    @index = 0
    @correct_computer_guesses = []
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

  def game_play
    @game_board.generate_secret_code()
    while @feedback_array != ['white', 'white', 'white', 'white']
      @index = 0
      @feedback_array = []
      if @user_answer == 'mastermind'
        puts 'Start turn press enter'
        start_turn = gets
        if @correct_computer_guesses == [nil, nil, nil, nil]
          @game_board.generate_secret_code()
        else
          (0..3).each do |index|
            if @correct_computer_guesses[index] == nil
              @correct_computer_guesses[index] = COLORS.sample 
            end
          end
          @game_board.secret_code = @correct_computer_guesses
        end
        puts "Computer guess: #{@game_board.secret_code}"
        check_player_code()
        puts "Guess feedback: #{@feedback_array}"
      elsif @user_answer == 'codebreaker'
        @player.player_create_code()
        check_computer_code()
        puts "Guess feedback: #{@feedback_array}"
      else
        puts 'Please enter Mastermind or Codebreaker.'
      end
      @index = 0
    end
  end

  def check_computer_code
    @feedback_array = []
    (@player.player_code).each do |elem|
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
          @correct_computer_guesses[@index] = elem
        else
          @feedback_array[@index] = 'black'
          @correct_computer_guesses[@index] = nil
        end
      else
        @feedback_array[@index] = nil
        @correct_computer_guesses[@index] = nil
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

