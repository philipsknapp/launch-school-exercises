def uniq_add(base_array, added_array)
  added_array.each do |el|
    base_array << el if !base_array.include?(el)
  end
end

def merge(arr1, arr2)
  merged_arr = []
  uniq_add(merged_arr, arr1)
  uniq_add(merged_arr, arr2)
  merged_arr
end

p merge([1, 3, 5], [3, 6, 9])