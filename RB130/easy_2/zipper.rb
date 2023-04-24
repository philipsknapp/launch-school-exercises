def zip(arr1, arr2)
  arr2 = arr2.dup
  arr1.each_with_object([]) { |el, obj| obj << [el, arr2.shift] }
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]