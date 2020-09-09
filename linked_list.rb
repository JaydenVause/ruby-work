class LinkedList

  def initialize
    @head = nil
  end

  def append(value)
    if @head == nil
      @head = Node.new(value)
    else
     node = @head
     node = node.next_node while node.next_node != nil
     node.next_node = Node.new(value)
    end
  end

  def prepend(value)
    if self.head == nil 
      self.head = Node.new(value)
    else
      node = Node.new(value)
      node.next_node = self.head
      @head = node
    end
  end

  def head
    @head
  end

  def tail
    node = self.head
    node = node.next_node while node.next_node != nil
    return node
  end


  def to_s
    node = self.head
    while node != nil
      print "(#{node.value})->"
      node = node.next_node
    end
  end

  def at(index)
    node = self.head
    index.times do 
      if node.next_node == nil
        return node.value
      else 
        node = node.next_node
      end
      
    end
    return node.value
  end

  def pop
      node = @head
      while node.next_node != nil
        prev_node = node
        node = node.next_node
      end

      return "no nodes" if @head == nil 
      if node.next_node == nil
        prev_node.next_node = nil
      end     
  end

  def contains?(value_inp)
    node = @head
    loop do
        if node.value == value_inp
          return true  
        elsif node.next_node == nil
          return false  
        end     
        node = node.next_node
    end
  end
  def find(value_inp)
    node = @head
    i = 0
    loop do
        i += 1
        if node.value == value_inp
          return i-1  
        elsif node.next_node == nil
          return false  
        end     
        node = node.next_node
    end
  end

end

class Node
 attr_accessor :value, :next_node

  def initialize(value)
    @value = value
    @next_node = nil
  end
end


new_list = LinkedList.new
new_list.append(5)
new_list.append(6)
new_list.append(7)
new_list.prepend(10)

new_list.to_s
p new_list.tail
p new_list.at(1)

 new_list.pop
 p new_list.to_s

 p new_list.contains?(10)

 p new_list.find(6)
