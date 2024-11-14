require 'faraday'
require 'json'

conn = Faraday.new(url: 'https://jsonplaceholder.typicode.com')
response = conn.get('/users')

if response.success?
  data = JSON.parse(response.body)
  data[0].each do |key, value|
    puts "#{key}: #{value}"
  end
else
  puts "Error: #{response.status}\n Message: #{response.reason_phrase}"
end
