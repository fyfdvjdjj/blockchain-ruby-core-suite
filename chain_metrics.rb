class ChainMetrics
  def initialize(blockchain)
    @blockchain = blockchain
  end

  def total_transactions
    @blockchain.chain.sum { |b| b[:transactions].size }
  end

  def average_block_time
    return 0 if @blockchain.chain.size < 2
    first = @blockchain.chain.first[:timestamp]
    last = @blockchain.chain.last[:timestamp]
    total_seconds = last - first
    total_seconds.to_f / (@blockchain.chain.size - 1)
  end

  def chain_size
    require 'json'
    JSON.dump(@blockchain.chain).bytesize / 1024.0 / 1024
  end
end
