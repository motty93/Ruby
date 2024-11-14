require 'faraday'
require 'typhoeus/adapters/faraday'
require 'json'

Faraday.default_adapter = :typhoeus

con = Faraday.new(url: 'https://jsonplaceholder.typicode.com') do |faraday|
  faraday.adapter :typhoeus
end

response = con.get('/users')

if response.success?
  data = JSON.parse(response.body)
  data[0].each do |key, value|
    puts "#{key}: #{value}"
  end
else
  puts "Error: #{response.status}\n Message: #{response.reason_phrase}"
end
