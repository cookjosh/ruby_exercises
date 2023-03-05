puts "Enter your string:"
string = gets
puts "Enter your rotation (number):"
rotation = gets.to_i

UPPER_CASE = *("A".."Z")
LOWER_CASE = *("a".."z")

def caesar_cipher(string, rotation)
    new_array = []
    string.split("") do |char|
        if UPPER_CASE.include?(char) 
            upper_array_index = UPPER_CASE.index(char)
            if upper_array_index + rotation > 25
                new_index = (upper_array_index + rotation) - 25
                new_array.push(UPPER_CASE.at(new_index - 1))
            end
            new_array.push(UPPER_CASE.at(upper_array_index + rotation))
        elsif LOWER_CASE.include?(char)
            lower_array_index = LOWER_CASE.index(char)
            if lower_array_index + rotation > 25
                new_index = (lower_array_index + rotation) - 25
                new_array.push(LOWER_CASE.at(new_index - 1))
            end            
            new_array.push(LOWER_CASE.at(lower_array_index + rotation))
        else
            new_array.push(char)
        end
    end
    puts "Ciphered String: #{new_array.join}"
end

caesar_cipher(string, rotation)