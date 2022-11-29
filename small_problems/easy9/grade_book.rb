def get_grade(grade1, grade2, grade3)
  avg = (grade1 + grade2 + grade3) / 3
  case
  when avg.between?(90, 100) then 'A'
  when avg.between?(80, 89) then 'B'
  when avg.between?(70,79) then 'C'
  when avg.between?(60, 69) then 'D'
  else 'F'
  end
end

p get_grade(50, 50, 95)