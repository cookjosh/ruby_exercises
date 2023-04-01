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
  attr_accessor :arr, :rootm

  def initialize(arr)
    @arr = arr.uniq.sort
    @root = build_tree(arr)
  end

  def build_tree(arr)
    p arr
    return nil if arr.empty?

    mid_point = (arr.size - 1) / 2
    root_node = Node.new(arr[mid_point])

    root_node.left = build_tree(arr[0...mid_point])
    root_node.right = build_tree(arr[(mid_point + 1)..-1])

    root_node
  end

# Leaving this code from my first iteration but saw recrusion other folks were using :facepalm:
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
    

  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end

tree = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])

tree.build_tree(tree.arr)
tree.pretty_print