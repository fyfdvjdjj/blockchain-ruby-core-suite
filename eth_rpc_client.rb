require 'net/http'
require 'json'

class EthRPCClient
  def initialize(rpc_url = 'https://mainnet.infura.io/v3/9aa3d95b3bc440fa88ea12eaa4456161')
    @rpc_url = rpc_url
  end

  def rpc_request(method, params = [])
    body = {
      jsonrpc: '2.0',
      method: method,
      params: params,
      id: rand(1000..9999)
    }.to_json
    headers = { 'Content-Type' => 'application/json' }
    response = Net::HTTP.post(URI(@rpc_url), body, headers)
    JSON.parse(response.body)
  end

  def get_block_number
    rpc_request('eth_blockNumber')
  end
end
