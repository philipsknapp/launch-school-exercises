def transpose(arr)
  result = [[nil, nil, nil], 
            [nil, nil, nil], 
            [nil, nil, nil]]
  arr.size.times do |row|
    arr[0].size.times { |column| result[column][row] = arr[row][column] }
  end
  result
end

def transpose!(arr)
  reference = []
  arr.each { |subarr| reference << subarr.dup.freeze }
  arr.size.times do |row|
    arr[0].size.times { |column| arr[column][row] = reference[row][column] }
  end
  nil
end


matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

transpose!(matrix)

p matrix