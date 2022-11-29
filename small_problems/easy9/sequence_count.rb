def sequence(length, int)
  result = length == 0 ? [] : (1..length).to_a
  result.map { |num| num * int }
end

def sequence_given_solution(count, first)
  (1..count).map { |value| value * first }
end

p sequence(0, 1000000)