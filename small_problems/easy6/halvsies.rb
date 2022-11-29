def halvsies(arr)
  middle_index = (arr.size + 1) / 2
  [arr[0...middle_index], arr[middle_index...arr.size]]
end

p halvsies([])