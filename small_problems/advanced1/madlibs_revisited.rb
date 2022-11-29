word_list = {adjective: %w(quick lazy sleepy ugly),
  noun: %w(fox dog head leg), 
  verb: %w(jumps lifts bites licks),
  adverb: %w(easily lazily noisily excitedly)
  }

word_selection = {}

text = File.open("madlibs_text.txt")
text_lines = text.readlines

text_lines.each do |line|
  word_list.each_key { |k| word_selection[k] = word_list[k].sample }
  puts format(line, word_selection)
end