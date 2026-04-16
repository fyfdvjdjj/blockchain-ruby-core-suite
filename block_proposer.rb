class BlockProposer
  def initialize(blockchain, pow)
    @blockchain = blockchain
    @pow = pow
  end

  def propose_block(miner)
    last_block = @blockchain.last_block
    proof = @pow.mine_proof(last_block[:proof])
    reward = BlockReward.calculate_reward(last_block[:index])
    BlockReward.distribute_reward(miner, reward, @blockchain)
    @blockchain.add_block(proof: proof)
  end
end
