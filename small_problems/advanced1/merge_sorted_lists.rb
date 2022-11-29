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

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]