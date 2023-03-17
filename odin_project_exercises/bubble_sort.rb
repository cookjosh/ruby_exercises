array = [5, 1, 4, 2, 8]

def bubble_sort(array)
    (0..array.length-1).each do |element|
        (0..(array.length-1)-element-1).each do |operator|
        if array[operator] > array[operator + 1]
            array[operator], array[operator + 1] = array[operator + 1], array[operator]
        end
    end
    end
    puts array
end

bubble_sort(array)