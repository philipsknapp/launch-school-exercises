name = 'Roger'

def case_agnostic_compare(str1, str2)
  str1.downcase == str2.downcase
end

puts "comparisons using my method:"
puts case_agnostic_compare(name, 'RoGeR')
puts case_agnostic_compare(name, 'DAVE')


puts "comparisons using the .casecmp? method:"
puts name.casecmp?('RoGeR')
puts name.casecmp?('DAVE')