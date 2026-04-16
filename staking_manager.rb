class StakingManager
  MIN_STAKE = 1000
  REWARD_RATE = 0.05

  def initialize
    @stakes = {}
    @rewards = {}
  end

  def stake(address, amount)
    return false if amount < MIN_STAKE
    @stakes[address] ||= 0
    @stakes[address] += amount
    true
  end

  def unstake(address, amount)
    return false if @stakes.fetch(address, 0) < amount
    @stakes[address] -= amount
    true
  end

  def calculate_rewards(address)
    stake_amount = @stakes.fetch(address, 0)
    (stake_amount * REWARD_RATE).to_i
  end

  def claim_rewards(address)
    reward = calculate_rewards(address)
    @rewards[address] ||= 0
    @rewards[address] += reward
    reward
  end
end
