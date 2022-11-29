def rotate90(arr)
  trans_arr = []
  columns = [0...arr.size]
  rows = (0...arr[0].size).map{ |row| 2 - row }
  columns.each do |column|
    trans_row = []
    rows.each { |row| trans_row << arr[row][column] }
    trans_arr << trans_row
  end
  trans_arr
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

p rotate90(matrix1)