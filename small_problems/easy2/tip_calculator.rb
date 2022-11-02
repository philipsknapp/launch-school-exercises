def get_pos_num(prompt)
  num = ''
  loop do
    print prompt + " "
    num = int_or_float(gets.chomp)
    if num.nil?
      puts 'please enter a number!'
    elsif num <= 0
      puts 'number must be greater than 0!'
    else
      return num
    end
  end
end

def int_or_float(str)
  if str.to_i.to_s == str
    str.to_i
  elsif str.to_f.to_s == str
    str.to_f
  end
end

bill = get_pos_num("What's your bill?")

percentage = ""
loop do
  percentage = get_pos_num("What is the tip percentage?")
  if percentage < 20
    puts "Less than 20%? Are you sure? (y/n)"
    if gets.chomp.downcase == 'y'
      puts "OK, cheapskate."
      break
    else
      puts "Right, let's try again!"
    end
  else
    break
  end
end

tip = ((percentage.to_f / 100) * bill).ceil(2)
total = (bill + tip).ceil(2)
puts "The tip is $#{format('%.2f', tip)}"
puts "The total is $#{format('%.2f', total)}"
