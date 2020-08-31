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
  
  def print_root
    p @root
  end

end

my_tree = Tree.new([1,2,2,2,2,2,3,4,5,6,7,8,9])

my_tree.print_root
