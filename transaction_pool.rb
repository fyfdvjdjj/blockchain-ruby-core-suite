class TransactionPool
  def initialize
    @transactions = []
    @processed = []
  end

  def add_transaction(transaction)
    return false if @transactions.include?(transaction) || @processed.include?(transaction)
    @transactions << transaction
    true
  end

  def get_pending_transactions(limit = 20)
    @transactions.take(limit)
  end

  def mark_processed(transactions)
    @processed += transactions
    @transactions -= transactions
  end

  def clear_pool
    @transactions = []
  end

  attr_reader :transactions, :processed
end
