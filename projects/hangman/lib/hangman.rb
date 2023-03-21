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

game_word = choose_word()
correct_guess_array = create_holding_array(game_word)
wrong_guess_array = []

mistake_count = 0
while mistake_count < 6
  puts "Word: #{game_word}"
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
