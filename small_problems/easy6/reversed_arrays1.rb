def reverse!(arr)
  arr_ref = arr.map {|el| el}
  arr.each_index do |i|
    arr[i] = arr_ref[(arr.size-1) - i]
  end
end

list = [1,2,3,4]
result = reverse!(list)
p result
p list
p list.object_id == result.object_id