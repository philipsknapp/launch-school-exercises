def multiply_list(arr1, arr2)
  mult_arr = []
  arr1.size.times do |i|
    mult_arr << arr1[i] * arr2[i]
  end
  mult_arr
end

def multiply_list_fe(arr1, arr2)
  arr1.zip(arr2).map{ |subarr| subarr.inject(:*) }
end

p multiply_list_fe([3, 5, 7], [9, 10, 11])