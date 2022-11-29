def remove_vowels(arr)
  arr.each{ |str| str.delete! "aeiouAEIOU"}
end

# designed to refer to & mutate the same string objects passed into the method
# tested below:

arrg = %w(ABC AEIOU XYZ)
arrg.each {|str| puts str.object_id}

rrg = remove_vowels(arrg)
p rrg
rrg.each {|str| puts str.object_id}