def longest_sentence_fe(address)
  file = File.open(address)
  text = file.read
  sentences = text.split(/(?<=\.|\?|!)\s*/)
  word_counts = sentences.map { |sentence| sentence.split(' ')}.map(&:size)
  result_length = word_counts.max
  result_sentence = sentences[word_counts.find_index(result_length)]
  puts "The longest sentence in #{address}, with a length of #{result_length} words, is:"
  puts result_sentence
end

def longest_paragraph_fe(address)
  file = File.open(address)
  text = file.read
  paras = text.split(/\n*\r+\n*\r*/)
  word_counts = paras.map { |para| para.split(' ')}.map(&:size)
  result_length = word_counts.max
  result_para = paras[word_counts.find_index(result_length)]
  puts "The longest paragraph in #{address}, with a length of #{result_length} words, is:"
  puts result_para
end

def longest_word_fe(address)
  file = File.open(address)
  text = file.read
  words = text.split(/\W+/)
  lengths = words.map(&:size)
  longest_length = lengths.max
  result = words[lengths.find_index(longest_length)]
  puts "The longest word in #{address}, with a length of #{longest_length} characters, is:"
  puts result
end

longest_word_fe("frankenstein.txt")