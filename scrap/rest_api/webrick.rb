require 'webrick'
require 'httparty'
require 'json'

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
