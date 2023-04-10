
class Calculator

  def add(sum = 0, *num)
    num.each {|num| sum += num}
    return sum
  end

  def multiply(product = 1, *num)
    num.each {|num| product = product * num}
    return product
  end
end