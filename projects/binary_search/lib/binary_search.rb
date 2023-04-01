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
  attr_accessor :arr, :root, :mid_point, :left_array, :right_array,
  :left_root, :right_root

  def initialize(arr)
    @arr = arr.uniq.sort
    @mid_point = (@arr.length / 2)
    @root = Node.new(@arr[@mid_point])
    @left_array = @arr[0..(@mid_point - 1)]
    @right_array = @arr[(@mid_point + 1)..(@arr.length + 1)]
    # Consider popping these form respective arrays
    @left_root = Node.new(@left_array[@left_array.length / 2])
    @right_root = Node.new(@right_array[@right_array.length / 2])
    @root.left = @left_root
    @root.right = @right_root
  end

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

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end

tree = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
tree.build_tree
tree.pretty_print