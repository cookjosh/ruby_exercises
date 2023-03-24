# Build a method #merge_sort that takes in an array and returns a sorted array, using a recursive merge sort methodology.

def merge_sort(arr)
  if arr.length < 2
    return arr
  else
    mid_point = arr.length / 2
    
    arr_one = arr[0...mid_point]
    arr_two = arr[mid_point..arr.length]
    left = merge_sort(arr_one)
    right = merge_sort(arr_two)

    new_arr = []
    until left.empty? || right.empty?
      if left.first < right.first
        new_arr << left.shift
      else
        new_arr << right.shift
      end
    end
  new_arr + left + right
  end
  
end

arr = [3, 4, 2, 1, 5, 0, 10, 9, 7, 8, 6]
p merge_sort(arr)