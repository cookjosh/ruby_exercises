dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(string, dictionary)
    match_array = []
    result_hash = {}
    dictionary.each do |word|
        match_array.push(string.downcase.scan(word))
    end
    match_array.each do |array|
        if array.count == 1
            result_hash[array[0]] = 1
        elsif array.count > 1
            result_hash[array[0]] = array.count
        end
    end
    puts result_hash
end

substrings("Howdy partner, sit down! How's it going?", dictionary)
        