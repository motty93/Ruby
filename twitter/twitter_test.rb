require 'twitter'
require 'dotenv'

Dotenv.load

@client = Twitter::REST::Client.new do |config|
  config.consumer_key = ENV['CONSUMER_KEY']
  config.consumer_secret = ENV['CONSUMER_SECRET_KEY']
  config.access_token = ENV['TWITTER_ACCESS_TOKEN']
  config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
end

#@client.update('tweetテストだよ by Rubyから')
p @client.user.to_hash

puts '\n'

p @client.methods
