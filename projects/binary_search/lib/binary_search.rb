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
      current_node = @root
      @arr.each do |elem|
        if elem == @root
        else
          new_node = Node.new(elem)
          if new_node.value < current_node.value
            while current_node.left != nil
              current_node = current_node.left
            end
            @root.left = new_node
          else
            while current_node.right != nil
              current_node = current_node.right
            end
            @root.right = new_node
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