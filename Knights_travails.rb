class Knight
  attr_accessor :position, :parent
  def initialize
    @parent
    @position = [6,0]
    @edge_list = [
      [-2, -1],
      [-1, -2],
      [-2, 1],
      [-1, 2],
      [1, 2],
      [2, 1],
      [2, -1],
      [1, -2]
    ]
    @visited = []
  end

  def generate_moves(node)
    list_of_vertex = []
    @edge_list.each do |pos|
      y = pos[0] + node.position[0]
      x = pos[1] + node.position[1]
      if x < 0 || x > 7 || y < 0 || y > 7 || !x.is_a?(Integer) || !y.is_a?(Integer)
      else
        move = Node.new([y,x], parent = node) 
        list_of_vertex << move
      end
    end
    return list_of_vertex
  end

  def determine_move_set(node = self, end_position = [7,7], que = Queue.new, result = [])
    return if @visited.include?(node.position)
    @visited << node.position
    if node.position == end_position   
      until !node.parent
        node.position
        result.unshift(node.position)
        node = node.parent
      end
      result.unshift(node.position)
    else

      new_moves = generate_moves(node)   
      new_moves.each do |vertex|
      vertex.parent == node
      que << vertex
      end

      while !que.empty?
         new_node = que.pop
         determine_move_set(new_node, end_position, que, result)
      end
        
      end   
    return result
  end
end

class Node
  attr_accessor :position, :parent

  def initialize(position, parent)
    @previous_node = nil
    @position = position
    @parent = parent 
  end
end

knight = Knight.new
print knight.determine_move_set
