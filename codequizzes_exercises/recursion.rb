# From: https://www.codequizzes.com/computer-science/beginner/recursion

# Define a recursive function that finds the factorial of a number.
def factorial_recursion(n)
  if n == 1
    return 1
  else
    n * factorial_recursion(n - 1)
  end
end

# puts factorial_recursion(5)

# Define a recursive function that returns true if a string is a palindrome and false otherwise.
def palindrome(str)
  if str.length <= 1
    return true
  else
    if str[0] == str[-1]
      palindrome(str[1..-2])
    else
      return false
    end
  end
end

# puts palindrome('madam')

# Define a recursive function that takes an argument n and prints "n bottles of beer on the wall", "(n-1) bottles of beer on the wall", ..., "no more bottles of beer on the wall".
def beer_bottles(n)
  if n == 0
    puts 'no more bottles of beer on the wall'
  else
    puts "#{n} bottles of beer on the wall"
    beer_bottles(n - 1)
  end
end

# puts beer_bottles(5)

# Define a recursive function that takes an argument n and returns the fibonacci value of that position. 
# The fibonacci sequence is 0, 1, 1, 2, 3, 5, 8, 13, 21... 
# So fib(5) should return 5 and fib(6) should return 8.
def fibonacci_index(n)
  if n == 0
    0
  elsif n == 1
    1
  else
    fibonacci_index(n-1) + fibonacci_index(n-2)
  end
end

# puts fibonacci_index(5)

def flat_array(arr, new_arr = [])
  #if arr.any?(Array) == false / Originally had this block causing it to break out with first int 1
   # return arr
  #else
  arr.each do |elem|
    if elem.is_a?(Array) == false
      new_arr.push(elem)
    elsif elem.is_a?(Array) == true
      flat_array(elem, new_arr)
    end
  end
  return new_arr
end

# p flat_array([[1, [8, 9]], [3, 4]])


# Use the roman_mapping hash to define a recursive method that converts an integer to a Roman numeral.
roman_mapping = {
  1000 => "M",
  900 => "CM",
  500 => "D",
  400 => "CD",
  100 => "C",
  90 => "XC",
  50 => "L",
  40 => "XL",
  10 => "X",
  9 => "IX",
  5 => "V",
  4 => "IV",
  1 => "I"
  }
def roman_num(n, str = '', roman_mapping)
  if n > 0
    if roman_mapping.include?(n)
      str << roman_mapping[n]
      return str
    else
      roman_mapping.each do |key, value|
        if key < n
          str << value
          roman_num(n - key, str, roman_mapping)
        end
      end
    end
  else
    return str
  end
  return str
end

puts roman_num(55, roman_mapping)



