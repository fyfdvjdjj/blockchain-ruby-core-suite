class ShardingManager
  SHARD_COUNT = 8

  def initialize
    @shards = Array.new(SHARD_COUNT) { [] }
  end

  def assign_address_to_shard(address)
    hash = Digest::SHA256.hexdigest(address)
    shard_id = hash.to_i(16) % SHARD_COUNT
    shard_id
  end

  def add_transaction_to_shard(shard_id, transaction)
    return false if shard_id < 0 || shard_id >= SHARD_COUNT
    @shards[shard_id] << transaction
    true
  end

  def get_shard_transactions(shard_id)
    @shards[shard_id]
  end
end
