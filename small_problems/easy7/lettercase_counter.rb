def letter_case_count(str)
  result = {lowercase: 0, uppercase: 0, neither: 0}
  str.chars.each do |char|
    p char
    if /[a-z]/ =~ char
      result[:lowercase] += 1
    elsif /[A-Z]/ =~ char
      result[:uppercase] +=1
    else
      result[:neither] += 1
    end
  end
  result
end

p letter_case_count('')