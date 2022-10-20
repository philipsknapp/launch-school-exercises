stoplight = ['green', 'yellow', 'red'].sample

case stoplight
  when 'green' then puts "Go!"
  when 'yellow' then puts "Slow Down!"
  else puts "Stop!"
end