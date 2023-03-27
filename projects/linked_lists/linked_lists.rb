class LinkedList

  def initialize
  end

  def create_node(value)
    new_node = Node.new(value)
    return new_node
  end

  def append(value)
    new_node = create_node(value)
    return new_node
  end

  def preppend(value)
    # Add code to add `@next_node` to point to next node
    new_node = create_node(value)
    ObjectSpace.each_object(Node) do |obj|
      if obj.is_head == true
        obj.is_head = false
        new_node.next_node = obj.value
      end
    end
    new_node.is_head = true
    return new_node
  end

  def size
    i = 0
    ObjectSpace.each_object(Node) do |obj| # This module has its own counting method I could use
      i += 1
    end
    return i
  end

  def head
    ObjectSpace.each_object(Node) do |obj|
      if obj.is_head == true
        return obj.value
      end
    end
  end

  def tail
    ObjectSpace.each_object(Node) do |obj|
      if obj.next_node == nil
        return obj.value
      end
    end
  end

  def at(index)
  end

  def pop
  end

  def contains?(value)
  end

  def find(value)
  end

  def to_s
  end
end

class Node
  attr_accessor :next_node, :value, :is_head
  def initialize(value)
    @next_node = nil
    @value = value
    @is_head = false
  end
end

new_list = LinkedList.new
first_node = new_list.append('Josh')
second_node = new_list.preppend('Ash')
third_node = new_list.preppend('Nolan')
p first_node.next_node
puts "Second node is head? #{second_node.is_head}"
puts "Second next node is: #{second_node.next_node}"
puts "Third node is head? #{third_node.is_head}"
puts "Third next node is: #{third_node.next_node}"


