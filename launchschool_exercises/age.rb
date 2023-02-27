puts "How old are you?"
age = (gets.chomp).to_i

numbers = [10, 20, 30, 40]
for number in numbers do
    puts "In #{number} years you will be: "
    puts number + age
end