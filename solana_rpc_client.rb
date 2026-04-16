require 'net/http'
require 'json'

class SolanaRPCClient
  def initialize(rpc_url = 'https://api.mainnet-beta.solana.com')
    @rpc_url = rpc_url
  end

  def get_balance(address)
    body = {
      jsonrpc: '2.0',
      id: '1',
      method: 'getBalance',
      params: [address]
    }.to_json
    response = Net::HTTP.post(URI(@rpc_url), body, { 'Content-Type' => 'application/json' })
    JSON.parse(response.body)
  end
end
