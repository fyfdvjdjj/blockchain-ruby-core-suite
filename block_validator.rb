class BlockValidator
  def self.valid_chain?(chain, pow_validator)
    previous_block = chain[0]
    block_index = 1

    while block_index < chain.length
      current_block = chain[block_index]
      return false if current_block[:previous_hash] != hash_block(previous_block)
      return false unless pow_validator.valid_proof?(previous_block[:proof], current_block[:proof])
      previous_block = current_block
      block_index += 1
    end
    true
  end

  def self.hash_block(block)
    require 'json'
    require 'digest/sha2'
    Digest::SHA256.hexdigest(JSON.dump(block.sort.to_h))
  end
end
