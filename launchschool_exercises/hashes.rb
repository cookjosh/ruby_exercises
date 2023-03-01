# https://launchschool.com/books/ruby/read/hashes
# Exercises not here were done in irb

=begin
# #1  
family = {  uncles: ["bob", "joe", "steve"],
    sisters: ["jane", "jill", "beth"],
    brothers: ["frank","rob","david"],
    aunts: ["mary","sally","susan"]
  }

new_array = family.select {|k,v| (k == :brothers) || (k == :sisters)}
print new_array.values.flatten


# #2
# merge returns a new has while merge! adds content to the original hash
hash_one = {a: 100, b: 200, c: 300}
hash_two = {d: 400, e: 500, f: 600}

merged_hash = hash_one.merge(hash_two)
print "Merged Hash: #{merged_hash}\n"
print "Original Hash One: #{hash_one}\n"

really_merged_hash = hash_one.merge!(hash_two)
print "Merged Hash: #{really_merged_hash}\n"
print "Modified Hash One: #{hash_one}\n"


# #3
random_hash = {a: 100, b: 200, c: 300, d: 400, e: 500, f: 600}
random_hash.each_key {|key| puts key}
random_hash.each_value {|value| puts value}
random_hash.each {|key, value| puts "#{key} has a value of #{value}"}


# #4
person = {name: 'Bob', occupation: 'web developer', hobbies: 'painting'}
puts person[:name]
=end


# #5
person = {name: 'Bob', occupation: 'web developer', hobbies: 'painting'}
puts person.has_value?('Bob')