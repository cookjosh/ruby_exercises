class LinkedList
  attr_accessor :head_node

  def initialize
  end

  def empty_list?
    if @head_node == nil
      return true
    else
      return false
    end
  end

  def append(value)
    if self.empty_list?
      @head_node = Node.new(value)
    else
      current_node = @head_node
      new_node = Node.new(value)
      while current_node.next_node != nil
        current_node = current_node.next_node
      end
      current_node.next_node = new_node
    end
  end

  def preppend(value)
    if self.empty_list?
      @head_node = Node.new(value)
    else
      previous_head = @head_node
      new_head = Node.new(value)
      new_head.next_node = previous_head
      @head_node = new_head
    end
  end

  def size
    if self.empty_list?
      return 0
    else
      count = 1 # Because the tail node will exist the while loop without counting itself
      current_node = @head_node
      while current_node.next_node != nil
        count += 1
        current_node = current_node.next_node
      end
      return count
    end
  end

  def head
    if self.empty_list?
      return nil
    else
      return @head_node
    end
  end

  def tail
    if self.empty_list?
      return 0
    else
      current_node = @head_node
      while current_node.next_node != nil
        current_node = current_node.next_node
      end
      return current_node
    end
  end

  def at(index)
    if self.empty_list?
      return nil
    else
      position = 0 # Unlike size, indexes start at 0
      current_node = @head_node
      while current_node.next_node != nil
        if position == index
          return current_node.value
        else
          position += 1
          current_node.value
          current_node = current_node.next_node
          if position == self.size - 1
            return current_node.value
          end
        end
      end
    end
  end

  def pop
    if self.empty_list?
      return nil
    else
      current_node = @head_node
      while current_node.next_node != nil
        new_tail = current_node
        current_node = current_node.next_node
      end
      new_tail.next_node = nil
      current_node = nil # Need to figure out how to actually delete an instance
    end
  end

  def contains?(value)
    if self.empty_list?
      return nil
    else
      current_node = @head_node
      while current_node.next_node != nil
        if current_node.value == value
          return true
        end
        current_node = current_node.next_node
        if current_node.value == value
          return true
        end
      end
      return false
    end
  end

  def find(value)
    if self.empty_list?
      return nil
    else
      current_node = @head_node
      while current_node.next_node != nil
        index = 0
        if current_node.value == value
          return index
        end
        index += 1
        current_node = current_node.next_node
        if current_node.value == value
          return index
        end
      end
      return false
    end
  end

  def to_s
    if self.empty_list?
      return nil
    else
      current_node = @head_node
      output_str = ''
      output_str << "#{current_node.value} -> "
      while current_node.next_node != nil
        current_node = current_node.next_node
        if current_node.next_node == nil
          output_str << "#{current_node.value} -> nil"
        else
          output_str << "#{current_node.value} -> "
        end
      end
    end
    return output_str
  end

  def insert_at(value, index)
    if self.empty_list? || index == 0
      self.preppend(value)      
    else
      current_node = @head_node
      current_index = 1
      while current_node.next_node != nil
        if current_index == index
          new_node = Node.new(value)
          upcoming_node = current_node.next_node
          current_node.next_node = new_node
          new_node.next_node = upcoming_node
          return
        end
        current_index += 1
        current_node = current_node.next_node
        if current_index == self.size - 1
          return
        end
      end
    end
  end

  def remove_at(index)
    if self.empty_list?
      return  
    elsif index == 0
      removing_node = @head_node
      new_head = removing_node.next_node
      @head_node = new_head
      removing_node.next_node = []
    else
      previous_node = @head_node
      current_node = @head_node.next_node
      current_index = 1
      while current_node.next_node != nil
        if current_index == index
          removing_node = current_node
          upcoming_node = current_node.next_node
          previous_node.next_node = upcoming_node
          return
        end
        current_index += 1
        if current_index == self.size - 1
          self.pop
          return
        end
        current_node = current_node.next_node
        previous_node = previous_node.next_node
      end
    end
  end
end

class Node
  attr_accessor :next_node, :value, :is_head
  def initialize(value)
    @next_node = nil
    @value = value
  end
end

# Initial list and first node creation
new_list = LinkedList.new
first_node = new_list.append('John')
p first_node.next_node

# Test append
second_node = new_list.append('Jane')
p first_node.next_node

# Test preppend
third_node = new_list.preppend('Jess')
p new_list.head_node
p third_node.next_node

# Tests size
p new_list.size
p new_list.at(2)

# Tests `pop`
p new_list.to_s
new_list.pop
p new_list.tail.value
p first_node.next_node
p second_node.value # The referenced node is not actually deleted so this returns an actual value

# Tests contains?
p new_list.contains?('John')
p new_list.contains?('Jane')

# Tests find
p new_list.find('Jess')
p new_list.find('John')

# Test to_s
new_list.append('Joe')
p new_list.to_s
new_list.append('Jane')
p new_list.to_s
p new_list.head_node

# Test insert_at
new_list.insert_at('Jim', 1)
p new_list.to_s
new_list.insert_at('Julie', 5)
p new_list.to_s
new_list.insert_at('Jared', 0)
p new_list.to_s
 
# Test remove_at
new_list.remove_at(1)
p new_list.to_s
new_list.remove_at(2)
p new_list.to_s
new_list.remove_at(3)
p new_list.size
p new_list.to_s