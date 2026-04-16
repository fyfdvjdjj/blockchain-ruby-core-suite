class ChainExplorerAPI
  def initialize(blockchain)
    @blockchain = blockchain
  end

  def get_block_by_height(height)
    return nil if height < 1 || height > @blockchain.chain.length
    @blockchain.chain[height - 1]
  end

  def get_block_by_hash(hash)
    @blockchain.chain.find { |b| @blockchain.hash_block(b) == hash }
  end

  def search_transaction(sender: nil, recipient: nil)
    @blockchain.chain.flat_map { |b| b[:transactions] }.select do |tx|
      (sender.nil? || tx[:sender] == sender) && (recipient.nil? || tx[:recipient] == recipient)
    end
  end
end
