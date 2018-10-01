def greet_twice(name, first_message, second_message)
  puts "#{first_message}, #{name}."
  puts "#{second_message}, #{name}."
end

greeting = %w(Hello Hola)

greet_twice 'Ruby', *greeting
