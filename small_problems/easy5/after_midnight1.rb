def after_midnight(hrs_mns)
  hours, minutes = hrs_mns[0,2].to_i, hrs_mns[3,2].to_i
  ((hours * 60) + minutes) % 1440
end

def before_midnight(hrs_mns)
  hours, minutes = hrs_mns[0,2].to_i, hrs_mns[3,2].to_i
  (((24-hours) * 60) - minutes) % 1440
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0