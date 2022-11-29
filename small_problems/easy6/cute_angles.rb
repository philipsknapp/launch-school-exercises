DEGREE = "\xC2\xB0"

def dms(in_degrees)
  remaining = in_degrees.to_f % 360
  degree = remaining.floor
  remaining -= degree
  remaining *= 60
  minute = remaining.floor
  remaining -= minute
  remaining *= 60
  second = remaining.round
  '%(' + degree.to_s + DEGREE + sprintf('%02d', minute) \
    + "'" + sprintf('%02d', second) + '")'
end

puts dms(400)