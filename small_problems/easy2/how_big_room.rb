SQM_TO_SQFT = 10.7639
SQFT_TO_SQIN = 144
SQIN_TO_SQCM = (2.54 * 2.54)

def area_meters
  puts "Enter the length of the room in meters:"
  length = gets.to_f
  
  puts "Enter the width of the room in meters:"
  width = gets.to_f
  
  sqm = (length * width).round(2)
  sqft = sqm * SQM_TO_SQFT
  
  puts "The area of the room is #{sqm} square meters
    (#{sqft} square feet)."
end

def area_feet
  puts "Enter the length of the room in feet:"
  length = gets.to_f
  
  puts "Enter the width of the room in feet:"
  width = gets.to_f
  
  sqft = (length * width).round(2)
  sqin = (sqft * SQFT_TO_SQIN).round(2)
  sqcm = (sqin * SQIN_TO_SQCM).round(2)
  
  puts "The area of the room is #{sqft} square feet
    (#{sqin} square inches or #{sqcm} square centimeters.)."
end

area_feet