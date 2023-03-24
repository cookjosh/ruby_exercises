# Assignment 1

# Fibonacci using iteration

def fibs(n, i = 0)
  arr = []
  (0..n-1).each do |elem|
    if elem == 0
      arr.push(i += elem)
    elsif elem == 1
      arr.push(i += elem)
    else
      arr.push(arr[elem - 1] + arr[elem - 2])
    end
  end
  return arr
end

p fibs(8)

arr = []
def fibs_rec(n, i=0, arr)
  p arr
  if i == n
    return arr
  else
    if i == 0 || i == 1
      arr.push(i)
    else
      arr.push(arr[i - 1] + arr[i - 2])
    end
    i += 1
    fibs_rec(n, i, arr)
  end
end

p fibs_rec(8, arr)

