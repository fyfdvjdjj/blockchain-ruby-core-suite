class ContractValidator
  def self.valid_token_contract?(contract)
    return false unless contract.respond_to?(:transfer) && contract.respond_to?(:balance_of)
    contract.respond_to?(:total_supply)
  end

  def self.valid_nft_contract?(contract)
    return false unless contract.respond_to?(:transfer) && contract.respond_to?(:owner_of)
    contract.respond_to?(:token_metadata)
  end

  def self.safe_call(contract, method, *args)
    return nil unless contract.respond_to?(method)
    contract.send(method, *args)
  end
end
