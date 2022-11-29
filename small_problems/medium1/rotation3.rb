def max_rotation(num)
  digit_array = num.digits.reverse
  digit_array.length.times do |place|
    digit_array.push(digit_array.delete_at(place))
  end
  digit_array.reduce {|total, digit| total * 10 + digit }
end
