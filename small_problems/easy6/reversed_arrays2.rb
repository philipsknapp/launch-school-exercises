def reverse(arr)
  reversed_arr = []
  arr.each {|el| reversed_arr.unshift(el)}
  reversed_arr
end

def reverse_fe(arr)
  arr.inject([], :unshift)
end

arr = [1, 2, 3, 4]
p arr.object_id

revarr = reverse_fe(arr)
p revarr
p arr 
p revarr.object_id