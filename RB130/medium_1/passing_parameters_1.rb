items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  output = items.join(', ')  
  yield output
end

gather(items) do |input|
  puts "Let's start gathering food."
  puts "#{input}"
  puts "Nice selection of food we have gathered!"
end