def bubble_sort!(array)
  loop do
    swapped = false
    1.upto(array.size - 1) do |index|
      # yield first and second args to block - swap if block returns true 
      correct_order = if block_given?
                        yield(array[index - 1], array[index])
                      else
                        array[index - 1] <= array[index]
                      end
      next if correct_order
      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end

    break unless swapped
  end
end

def bubble_sort_by!(array)
  loop do
    swapped = false
    1.upto(array.size - 1) do |index|
      first_comparator = block_given? ? yield(array[index - 1]) : array[index - 1]
      second_comparator = block_given? ? yield(array[index]) : array[index]
      next if first_comparator <= second_comparator
      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end

    break unless swapped
  end
end


array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort_by!(array) { |value| value.downcase }
p array == %w(alice bonnie Kim Pete rachel sue Tyler)