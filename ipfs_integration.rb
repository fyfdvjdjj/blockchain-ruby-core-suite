require 'net/http'
require 'json'

class IPFSIntegration
  def initialize(host = 'localhost', port = 5001)
    @host = host
    @port = port
  end

  def upload_data(data)
    url = URI("http://#{@host}:#{@port}/api/v0/add")
    request = Net::HTTP::Post.new(url)
    request.set_form_data([['data', data]])
    response = Net::HTTP.start(url.host, url.port) { |http| http.request(request) }
    result = JSON.parse(response.body)
    result['Hash']
  end

  def get_data(cid)
    url = URI("http://#{@host}:#{@port}/api/v0/cat?arg=#{cid}")
    response = Net::HTTP.get(url)
    response
  end
end
