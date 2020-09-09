def merge( left, right, result=[])

  while !left.empty? && !right.empty?
    left[0] > right[0]? result << right.slice!(0) : result << left.slice!(0)
  end
 
return result.concat(left).concat(right)
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

p merge_sort [4, 2, 3, 4, 5, 6, 7, 9,8,3,2,1,2,4,2,1]





