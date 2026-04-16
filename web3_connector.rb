class Web3Connector
  def initialize
    @providers = {}
  end

  def connect_provider(chain, rpc_url)
    @providers[chain.to_sym] = case chain.downcase
                               when 'ethereum' then EthRPCClient.new(rpc_url)
                               when 'solana' then SolanaRPCClient.new(rpc_url)
                               end
  end

  def get_provider(chain)
    @providers[chain.to_sym]
  end

  def connected_chains
    @providers.keys
  end
end
