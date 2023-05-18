class Element
  attr_reader :datum, :next

  def initialize(datum, nxt = nil)
    @datum = datum
    @next = nxt
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  attr_reader :head

  def push(val)
    @head = Element.new(val, head)
  end

  def pop
    result = peek
    @head = head.next unless head.nil?
    result
  end

  def peek
    empty? ? nil : head.datum
  end

  def size
    result = 0
    each { result += 1 }
    result
  end

  def empty?
    size == 0
  end

  def self.from_a(arr)
    result = SimpleLinkedList.new
    return result unless arr.is_a?(Array)
    arr.reverse.each { |el| result.push(el) }
    result
  end

  def to_a
    result = []
    each { |val| result << val }
    result
  end

  def reverse
    result = SimpleLinkedList.new
    each { |val| result.push(val) }
    result
  end

  def each
    el = @head
    until el.nil?
      yield el.datum if block_given?
      el = el.next
    end
    self
  end
end
