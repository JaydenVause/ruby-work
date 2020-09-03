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
    return nil if node.nil?
    node = node.left if node.left 
    if node.left ==nil and node.right == nil
      return node
    end 
    if node.right
      find_successor(node.right)
    elsif node.left
      find_successor(node.left)
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
#  get the depth of a node
  def node_depth(value, node=@root, n=0)  
    # return at the bottom of right
    return nil if node.nil?  
    # plus 1 each time
    if value < node.value
      if node.left
        n += 1
        node_depth(value, node.left, n) 
      else
        nil 
      end
    elsif value > node.value
      if node.right
        n += 1
        node_depth(value, node.right, n) 
      else
        nil
      end
    elsif value == node.value
      return n
    end
  end

  def calc_low_point(node, depth=0)
    return nil if node.nil? 
    if node.left ==nil and node.right == nil
      return depth
    elsif node.right
      depth += 1
      calc_low_point(node.right, depth)
    elsif node.left
      depth += 1
      calc_low_point(node.left, depth)
    end
  end

  def tree_max_depth(value)
    left_max = calc_low_point(@root.left)
    right_max = calc_low_point(@root.right)
    left_max > right_max ?  max_depth = left_max  : max_depth = right_max
    max_depth +=1 
  end

#Get tree Preorder (Root, Left, Right) 
  def pre_order(node = @root, array = [])
    return if node == nil
    array << node.value
    pre_order(node.left, array)
    pre_order(node.right, array)
    return array
  end

  #Get tree Inorder (Left, Root, Right) 
  def in_order(node = @root, array = [])
    return if node == nil
    in_order(node.left, array)
    array << node.value
    in_order(node.right, array)
    return array
  end
# rebalance tree
  def rebalance(node = @root , array = [])
    array = in_order
    @root = build_tree(merge_sort(array.uniq))
  end

  # Postorder (Left, Right, Root) 
  def post_order(node= @root, array = [])
    return if node == nil
    post_order(node.left, array)
    post_order(node.right, array)
    array << node.value
    return array
  end
# find height of a node
  def find_height(node)
    return -1 if node == nil
    left_height = find_height(node.left)
    right_height = find_height(node.right)
    left_height >= right_height ? max_height = left_height : max_height = right_height 
    return max_height += 1 
  end
# check if tree is balanced
  def check_balanced(node = @root)
    return true if node.nil?
    left = find_height(node.left)
    right = find_height(node.right)
    if ((left - right).abs <= 1 && check_balanced(node.left) && check_balanced(node.right))
      return true
    else 
      return false
    end
  end

end


=begin
///////////////////SIMPLE_DRIVER_SCRIPT///////////////////////////
==================================================================
*    Check if the binary tree is working and balanced 
=end

# 1. Create a binary search tree from an array of random numbers (`Array.new(15) { rand(1..100) }`)
my_tree = Tree.new([1,2,3,4,5,6,7,8,9,10,11,12,13])
# 2. Confirm that the tree is balanced by calling `#balanced?`
p my_tree.check_balanced
# 3. Print out all elements in level, pre, post, and in order
p my_tree.in_order
p my_tree.post_order
p my_tree.post_order
# 4. try to unbalance the tree by adding several numbers > 100
my_tree.insert_node(1000)
my_tree.insert_node(145000)
my_tree.insert_node(10003232)
my_tree.pretty_print
# 5. Confirm that the tree is unbalanced by calling `#balanced?`
p my_tree.check_balanced
# 6. Balance the tree by calling `#rebalance`
my_tree.rebalance
my_tree.pretty_print
# 7. Confirm that the tree is balanced by calling `#balanced?`
p my_tree.check_balanced
# 8. Print out all elements in level, pre, post, and in order
