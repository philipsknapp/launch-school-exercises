def time_of_day (is_day)
  puts is_day ? "It's daytime!" : "It's nighttime!"
end

daylight = [true, false].sample
time_of_day (daylight)