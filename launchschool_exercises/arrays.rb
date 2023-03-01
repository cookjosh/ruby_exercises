# Exercises from https://launchschool.com/books/ruby/read/arrays
# Exerises from that site not listed here were done in irb


=begin
# #1
arr = [1, 3, 5, 7, 9, 11]
number = 3
arr.each {|e| puts "#{e} is equal to 3? #{e == 3}"}


# #3
arr = [["test", "hello", "world"],["example", "mem"]]
puts arr[1][0]


# #7
names = ['bob', 'joe', 'susan', 'margaret']
names.each_with_index {|var, index| puts "Index #{index} is Value: #{var}"}
=end

# #8
number_array = [1, 2, 3, 4, 5]
new_array = []
number_array.each {|e| new_array.push(e * 2)}
puts new_array