array = [5, 9, 30, 23, 15, 1, 12, 8, 9]

def stock_picker(array)
    master_array = []
    array.each do |price|
        remaining_array = array.slice(array.index(price), (array.length - 1))
        remaining_array.each do |other_price|
            profit = other_price - price
            master_array.push([profit, array.index(price), array.index(other_price)])
        end
    end
    p [master_array.max[1], master_array.max[2]]
end

stock_picker(array)