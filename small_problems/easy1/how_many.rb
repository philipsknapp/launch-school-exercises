def count_occurrences(arr)
  el_freq = Hash.new(0)
  arr.each {|el| el_freq[el] += 1}
  el_freq.each { |k,v| puts "#{k} => #{v}" }
end

vehicles = ["car", 1, 2.0, true, [0,"hji"], {a:1}, 1.0, 1, "CAR"]

count_occurrences(vehicles)