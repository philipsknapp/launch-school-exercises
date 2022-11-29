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
  
def rotate_array_str(str)
  rotate_array(str.chars).join
end

def rotate_array_int(int)
  rotate_array(int.to_s.chars).join.to_i
end

p rotate_array_int(12345)
p rotate_array_str("Hello")
p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']