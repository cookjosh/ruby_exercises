def choose_word
  file = File.open('word_list.txt')
  file_data = file.readlines.map(&:chomp)
  file_data.delete_if {|word| word.length < 5 || word.length > 12}
  return file_data.sample.downcase.split('')
end

def create_holding_array(game_word)
  holding_array = []
  (0..(game_word.length - 1)).each do |i|
    holding_array[i] = '_'
  end
  return holding_array
end

def player_guess
  puts 'Please enter a letter for your guess!'
  user_guess = gets.chomp
  if user_guess.length != 1
    puts 'Your guess should only be ONE letter!'
    player_guess()
  end
  return user_guess
end

def save_state(game_word, correct_guess_array, wrong_guess_array, mistake_count)
  puts "Do you want to save your game? Y or N"
  save_answer = gets.chomp.downcase
  if save_answer == 'y'
    game_state = {
      'game_word': game_word,
      'correct_guess_array': correct_guess_array,
      'wrong_guess_array': wrong_guess_array,
      'mistake_count': mistake_count,
    }
    File.write('saved_game.txt', game_state)
    return true
  else
    return false
  end
end

puts 'Do you want to load your last save? Y or N: '
load_game = gets.chomp.downcase
if load_game == 'y'
  load_save = eval(File.read('saved_game.txt'))
  game_word = load_save[:game_word]
  correct_guess_array = load_save[:correct_guess_array]
  wrong_guess_array = load_save[:wrong_guess_array]
  mistake_count = load_save[:mistake_count]
else
  File.open('saved_game.txt', 'w') {}
  game_word = choose_word()
  correct_guess_array = create_holding_array(game_word)
  wrong_guess_array = []
  mistake_count = 0
end


while mistake_count < 6
  puts "Word: #{game_word}"
  save_game = save_state(game_word, correct_guess_array, wrong_guess_array, mistake_count)
  if save_game
    break
  end
  guess = player_guess()
  if game_word.include? guess
    puts "Great guess! #{guess} is in the word!"
    game_word.each_with_index do |elem, index|
      if guess == elem
        correct_guess_array[index] = guess
      end
    end
    #correct_guess_array.push(guess)
    puts "Your correct guesses: #{correct_guess_array}"
  else
    puts "Sorry #{guess} is not in the word..."
    puts "Your wrong guesses: #{wrong_guess_array}"
    mistake_count += 1
    if mistake_count == 6
      puts "You lose x__x!"
      break
    end
  end
  puts "Wrong guesses: #{mistake_count} of 6."
  if correct_guess_array == game_word
    mistake_count = 10
    puts "You win!"
  end
end
