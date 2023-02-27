# Exercises from LaunchSchool's intro to variables: https://launchschool.com/books/ruby/read/variables
# #1
name = gets.chomp
puts "Hello, #{name}!"

# #3
10.times { |n| (puts name) }

# #4
puts "Enter your first name: "
first_name = gets.chomp
puts "Enter your last name: "
last_name = gets.chomp
puts "Hello, #{first_name} #{last_name}"