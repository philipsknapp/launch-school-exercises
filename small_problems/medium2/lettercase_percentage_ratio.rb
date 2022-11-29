def letter_percentages(str)
  result = { lowercase: 0, uppercase: 0, neither: 0 }
  char_count = str.length
  result[:lowercase] = str.count("a-z")
  result[:uppercase] = str.count("A-Z")
  result[:neither] = (char_count - result[:lowercase]) - result[:uppercase]
  result.transform_values! { |val| ((val.to_f / char_count) * 100).round(1) }
  result
end

p letter_percentages("Wel IsAy THERE !1!")