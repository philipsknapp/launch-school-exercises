def digit_to_int(str)
  case str
  when '0' then 0
  when '1' then 1
  when '2' then 2
  when '3' then 3
  when '4' then 4
  when '5' then 5
  when '6' then 6
  when '7' then 7
  when '8' then 8
  when '9' then 9
  end
end

def string_to_integer(str)
  int = 0
  (str.size-1).downto(0) do |place|
    int += digit_to_int(str[place]) * (10 ** ((str.size-1) - place))
  end
  int
end

p string_to_integer('4321')