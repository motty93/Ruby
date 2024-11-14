require 'rspec'
require 'rack/test'
require 'webrick'
require 'httparty'
require 'json'

RSpec.describe 'Webrick server' do
  include Rack::Test::Methods

  before(:all) do
    # サーバーをバックグラウンドで起動
    @server_thread = Thread.new do
      server = WEBrick::HTTPServer.new(Port: 3030)
      server.mount_proc '/' do |req, res|
        res['Content-Type'] = 'application/json'
        case req.path
        when '/users'
          if req.request_method == 'GET'
            result = HTTParty.get('https://jsonplaceholder.typicode.com/users')
            res.body = result.success? ? result.parsed_response.to_json : JSON.dump({ error: result.message })
          else
            res.status = 405
            res.body = JSON.dump({ error: 'Method Not Allowed' })
          end
        else
          res.status = 404
          res.body = JSON.dump({ error: 'Not Found' })
        end
      end
      trap('INT') { server.shutdown }
      server.start
    end
    sleep 1 # サーバー起動待機
  end

  after(:all) do
    # サーバーをシャットダウン
    Thread.kill(@server_thread)
  end

  it 'GET /users' do
    response = HTTParty.get('http://localhost:3030/users')
    expect(response.code).to eq(200)
    expect(response.parsed_response).to be_an(Array)
    expect(response.parsed_response.first).to include('id', 'name', 'username', 'email')
  end

  it 'GET /unknown' do
    response = HTTParty.get('http://localhost:3030/unknown')
    expect(response.code).to eq(404)
    expect(response.parsed_response).to eq({ 'error' => 'Not Found' })
  end
end
