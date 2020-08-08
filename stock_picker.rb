def stock_picker(array)
    margins = Hash.new
    margins[:profit] = 0
    x = 0
    array.each_with_index do |item, index|  
      x += 1
      array[index+1..array.length].each_with_index do |item_2, index_2| 
        if (item_2 - item) > margins[:profit]
          margins[:profit] = item_2 - item
          margins[:buy] = index
          margins[:sell] = index_2+x
        end
      end 
    end
    p margins
  end
  
  stock_picker([17,3,6,9,15,8,6,1,10])