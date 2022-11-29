def buy_fruit(quantities)
  quantities.each_with_object([]) do |fruit, result| 
    fruit[1].times { result << fruit[0] }
  end
end


p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]])