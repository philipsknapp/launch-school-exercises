NUMBER_WORDS = %w(zero one two three four five six seven eight nine ten
                  eleven twelve thirteen fourteen fifteen sixteen seventeen
                  eighteen nineteen twenty)
                  
def alphabetic_number_sort(arr)
  arr.sort{|el1, el2| NUMBER_WORDS[el1] <=> NUMBER_WORDS[el2]}
end

p alphabetic_number_sort((0..19).to_a)