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

def merge_sort_iterative(arr)
end

p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]