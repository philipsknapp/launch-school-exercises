require "pry"

def rotate_array(arr)
  rot_arr = []
  arr.each_index do |i|
    # some kind of manipulation reflecting that in the array we want
    # rotated_array[i] = old_array[i+1, looping around
    rot_arr.push(arr[(i+1) % arr.length])
  end
  return rot_arr
  end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']