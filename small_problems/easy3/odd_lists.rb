def oddities(arr)
  odd_arr = []
  counter = 0
  while counter <= arr.count - 1
    odd_arr << arr[counter]
    counter += 2
  end
  odd_arr
end

def evenies(arr)
  even_arr = []
  counter = 1
  while counter <= arr.count - 1
    even_arr << arr[counter]
    counter += 2
  end
  even_arr
end

def fe1(arr)
  arr.each_with_index do |el, i|
  arr.delete_at(i+1)
  end
end

def fe2(arr)
  odd_arr = []
  counter = 0
  while counter <= arr.count - 1
    odd_arr << arr[counter] if counter.even?
    counter += 1
  end
  odd_arr
end

p fe1([1,2,3,4,5,6,7,8,9,10])