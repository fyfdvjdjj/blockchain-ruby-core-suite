class ChainSynchronizer
  def initialize(local_chain)
    @local_chain = local_chain
  end

  def sync_chain(remote_chain)
    return false if remote_chain.length < @local_chain.chain.length

    validator = BlockValidator.new
    pow = ProofOfWork.new
    return false unless validator.valid_chain?(remote_chain, pow)

    @local_chain.instance_variable_set(:@chain, remote_chain)
    true
  end

  def compare_chain_length(remote_length)
    remote_length > @local_chain.chain.length
  end
end
