# https://launchschool.com/books/ruby/read/flow_control#exercises

# #2
=begin
user_phrase = gets.chomp

def cap_words(user_phrase)
    if user_phrase.length > 10
        puts user_phrase.upcase!
    else
        puts user_phrase
    end
end

cap_words(user_phrase)
=end

# #3
=begin
user_number = gets.chomp.to_i

def number_range(user_number)
    if user_number >= 0 && user_number <= 50
        puts "#{user_number} is between 0 and 50"
    elsif user_number >= 51 && user_number <= 100
        puts "#{user_number} is between 51 and 100"
    elsif user_number > 100
        puts "#{user_number} greater than 100"
    end
end

number_range(user_number)
=end

