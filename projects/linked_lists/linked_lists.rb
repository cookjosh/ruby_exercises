class LinkedList
  def initialize
  end

  def append(value)
    new_node = Node.new(value)
  end

  def prepend(value)
    # Add code to add `@next_node` to point to next node
    new_node = Node.new(value)
    new_node.is_head = true
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
first_node = Node.new('Josh')
second_node = Node.new('Ash')
puts first_node.value
p first_node.next_node
new_list.prepend('Nolan')
puts new_list.head # test `head`
puts new_list.size # test `size`


