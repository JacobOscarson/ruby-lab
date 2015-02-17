def some_method
  puts 'Hello World' # Run 'step' in the console to move here
end

require "pry"; binding.pry

some_method          # Execution will stop here.
puts 'Goodbye World' # Run 'next' in the console to move here.
