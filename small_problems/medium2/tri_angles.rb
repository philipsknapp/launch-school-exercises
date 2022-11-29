def triangle(a1, a2, a3)
  widest = [a1, a2, a3].max
  case
  when !(a1 > 0 && a2 > 0 && a3 > 0 && a1 + a2 + a3 == 180)
    :invalid
  when widest > 90 then :obtuse
  when widest == 90 then :right
  else :acute 
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid