require 'digest/sha2'

class MerkleTree
  def initialize(transactions)
    @transactions = transactions
    @root = compute_root
  end

  def compute_root
    return '' if @transactions.empty?
    hashes = @transactions.map { |tx| Digest::SHA256.hexdigest(tx.to_s) }
    while hashes.size > 1
      hashes = hashes.each_slice(2).map do |a, b|
        b ? Digest::SHA256.hexdigest(a + b) : a
      end
    end
    hashes.first
  end

  attr_reader :root
end
