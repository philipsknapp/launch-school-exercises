def array_in_speech(arr)
  speech = ''
  if arr.length == 1
    speech = "#{arr[0]}"
  elsif arr.length == 2
    speech = "#{arr[0]} and #{arr[1]}"
  else
    arr.each_with_index do |el, i|
      if i == arr.size - 1
        speech << "and #{el}" 
      else
        speech << "#{el}, "
      end
    end
  end
  speech
end

def lights_output(lights, multiple)
  lights_on = []
  lights_off = []
  lights.each_with_index do |el, i|
    if el
      lights_on << el
    else
      lights_off << i + 1
    end
  end
  
  print "round #{multiple}: "
  print "no " if lights_off.empty?
  print "lights "
  print array_in_speech(lights_off)
  puts " are now off;"
  print "none" if lights_on.empty?
  print array_in_speech(lights_on)
  puts " are on"
end

def light_switch(n, verbose = false)
  lights = (1..n).to_a
  puts "round 1: every light is turned on" if verbose
  
  (2..n).each do |multiple|
    counter = multiple - 1
    while counter < lights.length
      if lights[counter]
        lights[counter] = nil
      else
        lights[counter] = counter + 1
      end
      counter += multiple
    end
          
    lights_output(lights, multiple) if verbose
  end

  p lights.select {|light| light}
end

light_switch(1000)