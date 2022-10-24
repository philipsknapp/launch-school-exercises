# this solution is not correct because it modifies the original array

def rotate_array(arr)
  arr.push(arr.shift)
end

arr = ['a', 'b', 'c']

rotate_array(arr)

p arr