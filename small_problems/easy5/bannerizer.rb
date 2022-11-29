def print_in_box(str = '')
  edge = '+' + '-' * (str.size + 2) + '+'
  empty_line = '|' + ' ' * (str.size + 2) + '|'
  puts edge
  puts empty_line
  puts '| ' + str + ' |'
  puts empty_line
  puts edge
end

def print_in_box_fe1(str = '')
  str = str[0...80]
  edge = '+' + '-' * (str.size + 2) + '+'
  empty_line = '|' + ' ' * (str.size + 2) + '|'
  puts edge
  puts empty_line
  puts '| ' + str + ' |'
  puts empty_line
  puts edge
end


def print_in_box_fe2(str = '')
  multiline_array = (str == '' ? [''] : [])
  while str != ''
    multiline_array << str.slice!(0...80)
  end
  
  width = multiline_array[0].size + 2
  edge = '+' + '-' * (width) + '+'
  empty_line = '|' + ' ' * (width) + '|'
  
  puts edge
  puts empty_line
  multiline_array.each do |line|
    puts '|' + line.center(width) + '|'
  end
  puts empty_line
  puts edge
end

print_in_box_fe2('To boldly go where')