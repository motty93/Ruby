require 'dotenv'
require 'sendgrid-ruby'
include SendGrid

# .envの読み込み
Dotenv.load
from = Email.new(email: ENV['MAIL_FROM'])
subject = 'testです'
to = Email.new(email: ENV['MAIL_TO'])
content = Content.new(type: 'text/plain', value: 'Hello, Email')
mail = Mail.new(from, subject, to, content)

sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
response = sg.client.mail._('send').post(request_body: mail.to_json)
puts response.status_code
puts response.body
puts response.headers
