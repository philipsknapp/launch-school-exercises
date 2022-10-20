status = ['awake', 'tired'].sample

what_do = if status == 'awake'
  "Be productive"
else
  "Go to sleep!"
end 

puts what_do