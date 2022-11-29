require "date"

def friday_13th(year)
  count = 0
  (1..12).each do |month| 
    count += 1 if Date.new(year, month, 13).friday?
  end
  count
end

def five_fridays(year)
  curr_date = Date.ordinal(year, 1)
  curr_date = curr_date + (5 - curr_date.wday) % 7
  curr_month = curr_date.mon
  result_count = 0
  friday_count = 0
  while curr_date.year == year
    if curr_date.mon != curr_month
      friday_count = 0
      curr_month = curr_date.mon
    end
    friday_count += 1
    result_count += 1 if friday_count >= 5
    curr_date = curr_date + 7
  end
  result_count
end

p five_fridays(2022)