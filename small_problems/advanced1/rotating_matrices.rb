def rotate90(arr)
  trans_arr = []
  columns = (0...arr[0].size).map{ |column| column}
  rows = (0...arr.size).map{ |row| (arr.size - 1) - row } 
  columns.each do |column|
    trans_row = []
    rows.each do |row|
      trans_row << arr[row][column] 
    end
    trans_arr << trans_row
  end
  trans_arr
end

def rotate_any(arr, degrees)
  rows = (0...arr.size).map{ |row| row }
  columns = (0...arr[0].size).map{ |column| column}
  
  trans_arr = []
  trans_sub_arr = []
  columns.each { |_| trans_sub_arr << nil }
  rows.each { |_| trans_arr << trans_sub_arr.dup }
  
  rows.each do |row|
    columns.each do |column|
      case degrees
      when 90
        x = (columns.size - 1) - column
        y = row
      when 180
        x = (rows.size - 1) - row
        y = (columns.size - 1) - column
      when 270
        x = column
        y = (rows.size - 1) - row
      when 360
        return arr
      else 
        return "error! rotation must be 90, 180, 270, or 360 degrees!" 
      end
      trans_arr[row][column] = arr[x][y]
    end
  end
  trans_arr
end

def rotate_any_shortcut(arr, degrees)
  trans_arr = arr
  return "Error!" unless [90, 180, 270, 360].include?(degrees)
  ((degrees % 360) / 90).times { trans_arr = rotate90(trans_arr) }
  trans_arr
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

p rotate_any_shortcut(matrix1, 10)
