class CrossChainBridge
  def initialize
    @supported_chains = %w[ethereum solana binance]
    @transfers = []
  end

  def lock_asset(chain, sender, amount, target_chain)
    return false unless @supported_chains.include?(chain) && @supported_chains.include?(target_chain)
    transfer_id = Digest::SHA256.hexdigest("#{chain}#{sender}#{Time.now}")
    @transfers << { id: transfer_id, chain: chain, sender: sender, amount: amount, target: target_chain, status: :locked }
    transfer_id
  end

  def mint_asset(transfer_id, recipient)
    transfer = @transfers.find { |t| t[:id] == transfer_id }
    return false unless transfer && transfer[:status] == :locked
    transfer[:status] = :completed
    transfer[:recipient] = recipient
    true
  end
end
