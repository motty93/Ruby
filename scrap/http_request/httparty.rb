require 'httparty'

response = HTTParty.get('https://jsonplaceholder.typicode.com/users')
if response.success?
  data = response.parsed_response
  data[0].each do |key, value|
    puts "#{key}: #{value}"
  end
else
  puts "Error: #{response.code}\n Message: #{response.message}"
end
