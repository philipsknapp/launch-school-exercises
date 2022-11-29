def sum_of_sums_mathematical(arr)
  total = 0
  arr.each_with_index {|num, i| total += num * (arr.size - i)}
  total
end

def sum_of_sums_carryval(arr)
  sum_array = [0]

  arr.each do |el|
    sum_array.push(el + sum_array.last)
  end

  sum_array.sum
end

def sum_of_sums_brute(arr)
  sum_array = []
  
  arr.size.times do |i|
    sum_array.push(arr[0..i].sum)
  end
  
  sum_array.sum    
end

arr = [1]
p sum_of_sums_brute(arr)