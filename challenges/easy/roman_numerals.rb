class RomanNumeral
  DEC_TO_ROMAN = { thousands: { one: 'M', five: '', ten: '' },
                   hundreds: { one: 'C', five: 'D', ten: 'M' },
                   tens: { one: 'X', five: 'L', ten: 'C' },
                   ones: { one: 'I', five: 'V', ten: 'X' } }

  DECIMAL_PLACE_ORDER = [:thousands, :hundreds, :tens, :ones]

  def initialize(decimal)
    @decimal = decimal
  end

  def to_roman
    roman = ""
    digits = digit_array
    0.upto(3) do |index|
      symbols = DEC_TO_ROMAN[DECIMAL_PLACE_ORDER[index]]
      roman += digit_pattern(digits[index], \
                             symbols[:one], symbols[:five], symbols[:ten])
    end
    roman
  end

  def digit_array
    digits = @decimal.digits.reverse
    while digits.length < 4
      digits.unshift(0)
    end
    digits
  end

  def digit_pattern(digit, one, five, ten)
    case digit
    when 0 then ''
    when 1..3 then one * digit
    when 4 then one + five
    when 5 then five
    when 6..8 then five + (one * (digit - 5))
    when 9 then one + ten
    end
  end
end
