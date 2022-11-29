def interleave(a1, a2)
  a_both = []
  a1.size.times do |i| 
    a_both << a1[i]
    a_both << a2[i]
  end
  a_both
end

def interleave_fe(a1, a2)
  a1.zip(a2).flatten
end

p interleave_fe([1, 2, 3], ['a', 'b', 'c'])