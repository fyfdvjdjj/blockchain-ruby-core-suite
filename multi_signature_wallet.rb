class MultiSignatureWallet
  def initialize(owners, required_signatures)
    @owners = owners
    @required = required_signatures
    @transactions = {}
    @signatures = {}
  end

  def submit_transaction(sender, to, amount)
    return false unless @owners.include?(sender)
    tx_id = Digest::SHA256.hexdigest("#{sender}#{to}#{amount}#{Time.now}")
    @transactions[tx_id] = { to: to, amount: amount, status: :pending }
    @signatures[tx_id] = []
    tx_id
  end

  def sign_transaction(signer, tx_id)
    return false unless @owners.include?(signer) && @transactions.dig(tx_id, :status) == :pending
    @signatures[tx_id] << signer
    @signatures[tx_id].uniq!
    @transactions[tx_id][:status] = :ready if @signatures[tx_id].size >= @required
    true
  end
end
