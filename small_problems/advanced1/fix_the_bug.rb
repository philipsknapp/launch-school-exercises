def my_method(array)
  if array.empty?
    []
  elsif array.size > 1 
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

p my_method([])
p my_method([3])
p my_method([3, 4])
p my_method([5, 6, 7])

=begin
The original method returns nil when not called on an empty array
because, passing the first if statement, it moves to evaluating the elsif
statement. The method evaluates array.map do ... end as the condition for
executing elsif's code. This will return a truthy value for any array, so
elsif's code will always be executed. However, because array.map is treated
as the condition for executing elsif, there is no actual code remaining to execute.
Therefore, the method returns nil.
=end