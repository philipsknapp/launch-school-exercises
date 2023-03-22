class CircularQueue
  def initialize(size)
    @buffer = Array.new(size)
    @oldest = 0
    @newest = 0
    @size = size
  end
  
  def enqueue(value)
    if empty?
      buffer[0] = value
      self.oldest, self.newest = 0, 0
    else
      self.newest = cycle_increment(newest)
      dequeue if buffer[newest] != nil
      buffer[newest] = value
    end
  end
  
  def dequeue
    return nil if empty?
    old_val = buffer[oldest]
    buffer[oldest] = nil
    self.oldest = cycle_increment(oldest)
    old_val
  end
  
  def to_s
    buffer.to_s
  end
  
  private
  attr_reader :buffer, :size
  attr_accessor :oldest, :newest
  
  def cycle_increment(num)
    (num + 1) % size
  end
  
  def empty?
    buffer.all?(nil)
  end
end

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil