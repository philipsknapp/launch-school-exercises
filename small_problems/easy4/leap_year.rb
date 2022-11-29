def leap_year?(year)
  if year % 400 == 0
    true
  elsif year % 100 == 0
    false
  elsif year % 4 == 0
    true
  else
    false
  end
end

def fe?(year)
  if year % 4 == 0
    if year % 100 == 0
      year % 400 == 0
    else
      true
    end
  else
    false
  end
end
      
p fe?(2400)