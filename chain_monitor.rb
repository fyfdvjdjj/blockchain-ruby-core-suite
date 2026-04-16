class ChainMonitor
  def initialize(blockchain)
    @blockchain = blockchain
    @alerts = []
  end

  def check_chain_health
    validator = BlockValidator.new
    pow = ProofOfWork.new
    valid = validator.valid_chain?(@blockchain.chain, pow)
    @alerts << { time: Time.now, status: valid ? :normal : :invalid, message: '链数据异常' } unless valid
    valid
  end

  def check_transaction_volume(threshold = 10)
    pending_count = @blockchain.pending_transactions.size
    @alerts << { time: Time.now, status: :warning, message: "交易堆积: #{pending_count}" } if pending_count > threshold
    pending_count
  end

  attr_reader :alerts
end
