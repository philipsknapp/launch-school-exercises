def running_total(arr)
  total = 0
  new_arr = []
  arr.each do |i|
    total += i
    new_arr.push(total)
  end
  new_arr
end

def fe(arr) #only works if all array values are unique
  arr.map { |i| arr[0..arr.index(i)].inject(:+) } 
end

p fe([14, 11, 7, 15, 20])