def sequence(int)
  result = []
  if int > 1
    1.upto(int) {|num| result << num }
  else
    1.downto(int) {|num| result << num }
  end
  result
end

def sequence_oneline(int)
  (1..int).each_with_object([]) {|num, result| result << num }
end

def sequence_given_solution(int)
    (1..int).to_a
end
