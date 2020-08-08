def bubble_sort(array)
  new_array = array
  p "new array is #{new_array}"
  array.each_with_index do |itm, index|
    x = 0
    y = 1
   new_array[y..new_array.length].each_with_index do |itm_new, index_new|
    x_val = array[x]
    y_val = array[y]
    if array[x] > array[y]
      array[x] = y_val
      array[y] = x_val
    end
    y += 1
    x += 1
   end
  end
  p new_array
end
bubble_sort([4,3,78,2,0,2])