require 'net/http'
require 'uri'
require 'json'

url = URI.parse('https://jsonplaceholder.typicode.com/users')
response = Net::HTTP.get_response(url)

if response.is_a?(Net::HTTPSuccess)
  data = JSON.parse(response.body)
  data[0].each do |key, value|
    puts "#{key}: #{value}"
  end
else
  puts "Error: #{response.code}\n Message: #{response.message}"
end
