def word_sizes(str)
  freq_hash = Hash.new(0)
  str.split.map(&:size).sort.each do |len|
    freq_hash[len] += 1
  end
  freq_hash
end

p word_sizes('')