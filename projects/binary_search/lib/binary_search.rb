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
    p arr
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

