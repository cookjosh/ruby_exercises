puts "Enter your string:"
string = gets
puts "Enter your rotation (number):"
rotation = gets.to_i

UPPER_CASE = *("A".."Z")
LOWER_CASE = *("a".."z")

def caesar_cipher(string, rotation)
    new_array = []
    holding_array = string.split("")
    holding_array.each_with_index do |char, index, array|
        if UPPER_CASE.include?(char) 
            puts "#{char} has Index of #{UPPER_CASE.index(char)}"
            new_array.push(UPPER_CASE.at(index + rotation))
            puts index
        elsif LOWER_CASE.include?(char)
            puts "#{char} has Index of #{LOWER_CASE.index(char)}"
            new_array.push(LOWER_CASE.at(index + rotation))
            puts index
        end
    end
    puts new_array
end

caesar_cipher(string, rotation)