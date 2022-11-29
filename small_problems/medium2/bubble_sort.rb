def bubble_sort_opt!(arr)
  stop = arr.length - 1
  until stop == 0
    new_stop = 0
    (0...stop).each do |i|
      if arr[i] > arr[i+1]
        arr[i], arr[i + 1] = arr[i + 1], arr[i] 
        new_stop = i + 1
      end
    stop = new_stop
    end
  end
end

array = %w(Sue Bonnie)
bubble_sort_opt!(array)
p array