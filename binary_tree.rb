class Node
  attr_accessor :value, :left, :right
  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

class Tree
  def initialize(array)
    @array = merge_sort(array.uniq) 
    @root = build_tree(@array)
  end

# builds the tree
  def build_tree(array,first_idx=0, last_idx=array.length-1)
    return nil if first_idx > last_idx
    middle = (first_idx + last_idx)/2
    root = array[middle]
    node = Node.new(array[middle])
    node.left = build_tree(array, first_idx, middle-1)
    node.right = build_tree(array, middle+1, last_idx)
    return node
  end
# merge array 
  def merge( left, right, result=[])

    while !left.empty? && !right.empty?
      left[0] > right[0]? result << right.slice!(0) : result << left.slice!(0)
    end
  
  return result.concat(left).concat(right)
  end
  # sort array
  def merge_sort(array, result =[])
    return array if array.length == 1   
    middle = array.length/2.to_f
    true_middle = middle.round(half: :up)
    # split the arrays into left and right
    left = array[0..true_middle-1]
    right = array[true_middle..array.length]
    merge(merge_sort(left), merge_sort(right), result)
    return result
  end
#   find nodes in a tree
  def find_node(value, node = @root)
     
    return if node == nil 
   
    if node.value == value
      return node
    else
      if value >= node.value
         node.right != nil ? find_node(value, node.right) : nil
      elsif value < node.value
         node.left != nil ? find_node(value, node.left) : nil
      end
    end
  end

 
# find parent to the node
  def find_parent_node(value, node = @root)
    return nil if node == nil
    if node.value == value       
        return node
    end
    if node.left != nil
      return node if node.left.value == value
    end
    if node.right != nil
      return node if node.right.value == value
    end 
    if value < node.value 
      find_parent_node(value, node.left) 
    else 
      find_parent_node(value, node.right)
    end
   
  end
# find the lowest value
  def find_successor(node)
    if node.left ==nil and node.right == nil
      return node
    end 
    if node.left
    find_successor(node.left)
    else 
      find_successor(node.right)
    end
  end
  # delete node in a tree
  def delete_node(value, node=@root)
    node = find_node(value)
    parent = find_parent_node(node.value)
      if node.left == nil && node.right == nil
        if parent.left == node
          parent.left = nil
        elsif parent.right = node
          parent.right = nil
        end
      elsif node.left == nil || node.right == nil
          if node == parent.right
            parent.right = node.right
          elsif node == parent.left
            parent.left = node.left
          end
      else 
        successor = find_successor(node)
        parent = find_parent_node(successor.value)
        node.value = successor.value
        
        if parent.left == successor
          parent.left = nil
        elsif parent.right == successor
          parent.right = nil
        end
      end
  end
# using TOP pretty print function
  def pretty_print(node = @root, prefix = '', is_left = true)
  pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
  puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
  pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
# insert node into the tree
  def insert_node(value,node=@root)
    if node.nil?
      node = Node.new(value)
    elsif value < node.value
      node.left = insert_node(value, node.left)
    elsif value > node.value
      node.right = insert_node(value, node.right)
    elsif value == node.value
      node.value = value
    end
    node
  end
# level order traversal of a tree
  def level_order(node = @root, q = Queue.new)
    return if !node
    q << node
      while !q.empty?
        z = q.pop
        q << z.left if z.left
        q << z.right if z.right
        p z.value
      end
  end


  # end of class
end

my_tree = Tree.new([1,2,3,4,5,6,7,8,9])

my_tree.pretty_print
my_tree.level_order


 
