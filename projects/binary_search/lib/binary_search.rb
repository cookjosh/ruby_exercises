class Node
  include Comparable
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end

  
end

class Tree
  attr_accessor :array, :root

  def initialize(arr)
    @array = arr.uniq.sort
    @root = build_tree(@array)
  end

  def build_tree(arr)
    return nil if arr.empty?

    mid_point = (arr.size - 1) / 2
    root_node = Node.new(arr[mid_point])

    root_node.left = build_tree(arr[0...mid_point])
    root_node.right = build_tree(arr[(mid_point + 1)..-1])

    root_node
  end

# Leaving this code from my first iteration but saw recrusion other folks were using :facepalm:
# It does work but is not as efficient or clean...
=begin
def build_tree
    if @arr == nil || @arr == []
      return 'Array is empty!'
    else
      # Left side of tree
      @left_array.each do |elem|
        if elem == @left_root.value
          nil
        else
          current_node = @left_root
          new_node = Node.new(elem)
          last_level = 0
          while last_level == 0
            if new_node.value < current_node.value && current_node.left == nil
              current_node.left = new_node
              last_level += 1
            elsif new_node.value < current_node.value && current_node.left != nil
              current_node = current_node.left
            elsif new_node.value > current_node.value && current_node.right == nil
              current_node.right = new_node
              last_level += 1
            elsif new_node.value > current_node.value && current_node.right != nil
              current_node = current_node.right
            end
          end
        end
      end
      @right_array.each do |elem|
        if elem == @right_root.value
          nil
        else
          current_node = @right_root
          new_node = Node.new(elem)
          last_level = 0
          while last_level == 0
            if new_node.value < current_node.value && current_node.left == nil
              current_node.left = new_node
              last_level += 1
            elsif new_node.value < current_node.value && current_node.left != nil              
              current_node = current_node.left
            elsif new_node.value > current_node.value && current_node.right == nil
              current_node.right = new_node
              last_level += 1
            elsif new_node.value > current_node.value && current_node.right != nil
              current_node = current_node.right
            end
          end
        end
      end
    end
  end
=end

  def insert(value)
    new_node = Node.new(value)
    current_node = @root
    last_level = false
    while last_level == false
      if new_node.value == current_node.value
        return current_node
      else
        if new_node.value < current_node.value && current_node.left == nil
          current_node.left = new_node
          last_level = true
        elsif 
          new_node.value < current_node.value && current_node.left != nil
          current_node = current_node.left
        elsif new_node.value > current_node.value && current_node.right == nil
          current_node.right = new_node
          last_level = true
        elsif new_node.value > current_node.value && current_node.right != nil
          current_node = current_node.right
        end
      end
    end
  end

  def delete(value)
    current_node = @root
    previous_node = current_node
    found = false
    while found == false
      if value == @root.left.value || value == @root.right.value
        if value == @root.left.value
          if @root.left.right.value > @root.left.left.value
            @root.left.right.left = @root.left.left
            @root.left = @root.left.right
            found = true
          elsif @root.left.right.value < @root.left.left.value
            @root.left.left.right = @root.left.right
            @root.left = @root.left.left
            found = true
          end
          elsif value == @root.right.value
          if @root.right.right.value > @root.right.left.value
            @root.right.right.left = @root.right.left
            @root.right = @root.right.right
            found = true
          elsif @root.right.right.value < @root.right.left.value
            @root.right.left.right = @root.right.right
            @root.right = @root.right.left
            found = true
          end
        end
      else
        if value == current_node.value
          if current_node.left && current_node.right
            if current_node.right.value > current_node.left.value
              previous_node.left = current_node.right.value
              current_node.right.left = current_node.left
              found = true
            elsif current_node.right.value < current_node.left.value
              previous_node.left = current_node.left.value
              current_node.left.left = current_node.right
              found = true
            end
          elsif current_node.left && current_node.right == nil
            if value == previous_node.left.value
              previous_node.left = current_node.right
            elsif value == previous_node.right.value
              previous_node.right = current_node.right
            end
            found = true
          elsif current_node.left == nil && current_node.right
            if value == previous_node.left.value
              previous_node.left = current_node.right
            elsif value == previous_node.right.value
              previous_node.right = current_node.right
            end
            found = true
          else current_node.left == nil && current_node.right == nil
            if value < previous_node.value
              previous_node.left = nil
              found = true
            elsif value > previous_node.value
              previous_node.right = nil
              found = true
            end
          end
        elsif value < current_node.value
          previous_node = current_node
          current_node = current_node.left
        elsif value > current_node.value
          previous_node = current_node
          current_node = current_node.right
        end
      end
    end
  end

  def find(value)
    current_node = @root
    found = false
    while found == false
      if value == @root.value
        return @root
      elsif value == current_node.value
        return current_node
      elsif value < current_node.value
        current_node = current_node.left
      elsif value > current_node.value
        current_node = current_node.right
      end
    end
  end

  def level_order(current_node = @root, holding_array = [], final_array = [], &block)
    current_node = @root
    done = false
    while done == false
      if block_given?  
        yield current_node
      end
      final_array << current_node
      if current_node.left && current_node.right
        holding_array << current_node.left
        holding_array << current_node.right
      elsif current_node.left && current_node.right == nil
        holding_array << current_node.left
      elsif current_node.right && current_node.left == nil
        holding_array << current_node.right
      end
      if holding_array[0]
        current_node = holding_array.shift
      else
        done = true
      end
    end
    return final_array
  end

  # Got inspiration for next few methods from solution from another Odin Project student
  def inorder(node = @root)
    # Left Root Right
    return if node.nil?

    inorder(node.left)
    print "#{node.value} "
    inorder(node.right)
  end

  def preorder(node = @root)
    if node.nil?
      return
    else
      print "#{node.value} "
      preorder(node.left)
    end
    preorder(node.right)
  end

  def postorder(node = @root)
    if node.nil?
      return
    else
      postorder(node.left)
      postorder(node.right)
      print "#{node.value} "
    end
  end

  # Next two are also from another student, and I'm generally unsure how they work
  # I don't understand how in #height, `.max + 1` works on the final array...
  def height(node = @root) 
    unless node.nil? || node == root
      node = (node.instance_of?(Node) ? find(node.value) : find(node))
    end
    
    if node.nil?
      return -1
    end
    
    [height(node.left), height(node.right)].max + 1
  end

  def depth(node = root, parent = root, edges = 0)
    return 0 if node == parent
    return -1 if parent.nil?

    if node < parent.value
      edges += 1
      depth(node, parent.left, edges)
    elsif node > parent.value
      edges += 1
      depth(node, parent.right, edges)
    else
      edges
    end
  end

  def balanced?(node = @root)    
    if node.nil?
      return true
    end

    left_height = height(node.left)
    right_height = height(node.right)

    return true if (left_height - right_height).abs <= 1 && balanced?(node.left) && balanced?(node.right)

    false
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end

tree = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])

tree.pretty_print

# Test insert
tree.insert(11)
tree.pretty_print

# Test delete
tree.delete(9)
tree.pretty_print

# Test find
p tree.find(3)

# Test level_order
# tests presence and absence of given block
tree.level_order {|node| puts node}
p tree.level_order


# Array taken from here for quick testing:
# https://www.geeksforgeeks.org/tree-traversals-inorder-preorder-and-postorder/
tree = Tree.new([4, 10, 12, 15, 18, 22, 24, 25, 31, 35, 44, 50, 66, 70, 90])
tree.pretty_print
# Test inorder
tree.inorder
puts ""
# Test preorder
tree.preorder
puts ""
# Test postorder
tree.postorder
puts ""
# Test height
tree.pretty_print
p tree.height(15)

# Test depth
p tree.depth(4)

# Test balanced?
p tree.balanced?


