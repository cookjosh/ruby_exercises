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
  attr_accessor :arr, :root

  def initialize(arr)
    @arr = arr.uniq.sort
  end

  def build_tree
    p @arr
    if @arr == nil || @arr == []
      return 'Array is empty!'
    else
      mid_point = (@arr.length / 2)
      @root = Node.new(@arr[mid_point])
      left_array = arr[0..(mid_point - 1)]
      right_array = arr[(mid_point + 1)..(arr.length + 1)]
      left_root = Node.new(left_array[left_array.length / 2])
      right_root = Node.new(right_array[right_array.length / 2])
      @root.left = left_root
      @root.right = right_root
      @arr.each do |elem|
        current_node = @root
        if elem == @arr[mid_point]
        else
          new_node = Node.new(elem)
          last_branch = false
          while last_branch == false
            if new_node.value < current_node.value && current_node.left != nil
              current_node = current_node.left
            elsif new_node.value < current_node.value && current_node.left == nil
              current_node.left = new_node
              last_branch = true
            end
            if new_node.value > current_node.value && current_node.right != nil
              current_node = current_node.right
            elsif new_node.value > current_node.value && current_node.right == nil
              current_node.right = new_node
              last_branch = true
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