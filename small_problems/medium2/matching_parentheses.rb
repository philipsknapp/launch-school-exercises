def balanced?(str)
  balance = 0
  str.chars.each do |char|
    if char == '('
      balance += 1
    elsif char == ')'
      balance -= 1
      return false if balance < 0
    end
  end
  balance == 0
end


def balanced_fe?(str)
  balance = { '(' => 0, '[' => 0, '{' => 0, "'" => 0, '"' => 0 }
  bracket_closes = { ']' => '[', ')' => '(', '}' => '{' }
  inc_hits = balance.keys
  dec_hits = bracket_closes.keys
  
  str.chars.each do |char|
    if inc_hits.include?(char)
      balance[char] += 1
    elsif dec_hits.include?(char)
      balance[bracket_closes[char]] -= 1
      return false if balance[bracket_closes[char]] < 0
    end
  end
  
  [balance['('], balance['['], balance['{']].all?(0)\
    && [balance["'"], balance['"']].all?(&:even?)
end



p balanced_fe?('What (is) ] [ " " {} this?')