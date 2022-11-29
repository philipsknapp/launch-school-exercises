def letter_freqs_hash(str)
  result = Hash.new(0)
  str.chars.each { |char| result[char] += 1 }
  result
end

def anagram_groups(arr)
  word_array = arr.clone
  anagram_data = {}
  word_array.each { |word| anagram_data[word] = letter_freqs_hash(word) }
  
  until word_array.empty?
    print_result = []
    starting_word = word_array.shift
    print_result.push(starting_word)
    anagram_test_val = anagram_data[starting_word]
    
    word_array.each do |word|
      if anagram_data[word] == anagram_test_val
        print_result.push(word)
      end
    end
    
    word_array.delete_if{|word| print_result.include?(word)}
    p print_result
  end
end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']
          
anagram_groups(words)