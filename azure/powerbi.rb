require 'oauth2'
require 'dotenv'
require 'pry'

Dotenv.load

client = OAuth2::Client.new(
           ENV['ACTIVE_DIRECTORY_CLIENT_ID'],
           ENV['ACTIVE_DIRECTORY_CLIENT_SECRET'],
           site: "https://login.microsoftonline.com/#{ENV['ACTIVE_DIRECTORY_TENANT_ID']}"
         )

client.auth_code.authorize_url(redirect_uri: 'http://localhost:8080/oauth2/callback')

binding.pry
# token = client.auth_code.get_token('', redirect_uri: 'http://localhost:8080/oauth2/callback')
