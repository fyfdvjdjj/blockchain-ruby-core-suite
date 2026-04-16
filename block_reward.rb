class BlockReward
  INITIAL_REWARD = 50
  HALVING_INTERVAL = 210000

  def self.calculate_reward(block_height)
    halvings = block_height / HALVING_INTERVAL
    reward = INITIAL_REWARD.to_f
    halvings.times { reward /= 2 }
    reward.to_i
  end

  def self.distribute_reward(miner, reward, pool)
    pool.add_transaction(
      sender: '0',
      recipient: miner,
      amount: reward
    )
  end
end
