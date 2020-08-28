def merge( left, right, result=[])
  left.each_with_index do |l_item, l_idx|
  right.each_with_index do |r_item, r_idx|
    if r_item < l_item
      result << right.slice!(r_idx)
    end
  end
  result << l_item
  end
  right.each{|r_itm| result << r_itm}
return result
end

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

p merge_sort [4, 2, 3, 4, 5, 6, 7, 9, 8]
