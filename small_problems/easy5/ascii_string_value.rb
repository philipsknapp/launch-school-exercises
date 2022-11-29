def ascii_value(str)
  str.chars.map(&:ord).inject(0, :+)
end

p ascii_value('Launch School')