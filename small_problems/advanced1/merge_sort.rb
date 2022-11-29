def merge(arr1, arr2)
  result = []
  i1, i2 = 0, 0

  until i1 >= arr1.size || i2 >= arr2.size do
    if arr1[i1] < arr2[i2]
      result << arr1[i1]
      i1 += 1
    else
      result << arr2[i2]
      i2 += 1
    end
  end

  if i1 >= arr1.size
    arr2[i2..-1].each { |el2| result << el2 }
  else
    arr1[i1..-1].each { |el1| result << el1 }
  end

  result
end

def merge_sort(arr)
  length = arr.length
  if length <= 1
    arr
  else
    midpoint = length / 2
    merge(merge_sort(arr[0...midpoint]), merge_sort(arr[midpoint...length]))
  end    
end

def merge_sort_iterative(array)
  arr = array
  group_size = 1

  while group_size * 2 <= arr.length
    result = []
    index = 0

    until index >= arr.length
      arr1 = arr[index, group_size]
      arr1.reject!(nil)
      arr2 = arr[index + group_size, group_size]
      arr2.reject!(nil)
      result.concat(merge(arr1, arr2))
      index += group_size * 2
    end

    arr = result
    group_size *= 2
  end
  arr
end

p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46])