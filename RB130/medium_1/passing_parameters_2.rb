arr = %w(raven finch hawk eagle)

def raptorize(arr)
  yield arr
end

raptors = raptorize(arr) { |bird1, bird2, *birds| birds}

p raptors