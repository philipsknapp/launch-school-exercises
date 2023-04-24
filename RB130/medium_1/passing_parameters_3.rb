items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do | *group, last |
  puts group.join(', ')
  puts last
end

gather(items) do | first, *group , last |
  puts first
  puts group.join(', ')
  puts last
end

gather(items) do | first, *group |
  puts first
  puts group.join(', ')
end

gather(items) do | el1, el2, el3, el4|
  puts "#{el1}, #{el2}, #{el3}, and #{el4}"
end