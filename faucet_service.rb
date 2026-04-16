class FaucetService
  DAILY_LIMIT = 100
  COOLDOWN_HOURS = 24

  def initialize(token_contract)
    @token = token_contract
    @claims = {}
  end

  def claim_tokens(address)
    last_claim = @claims[address]
    if last_claim && (Time.now - last_claim) < (COOLDOWN_HOURS * 3600)
      return false
    end

    success = @token.transfer('faucet', address, DAILY_LIMIT)
    @claims[address] = Time.now if success
    success
  end

  def remaining_claim(address)
    last = @claims[address]
    return 0 unless last
    [(COOLDOWN_HOURS * 3600) - (Time.now - last), 0].max
  end
end
