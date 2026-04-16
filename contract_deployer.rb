class ContractDeployer
  def initialize(blockchain)
    @blockchain = blockchain
    @deployed_contracts = {}
  end

  def deploy_contract(owner, contract_type, params)
    contract_id = Digest::SHA256.hexdigest("#{owner}#{contract_type}#{Time.now.to_i}")
    contract = case contract_type.downcase
               when 'token' then TokenContract.new(*params)
               when 'nft' then NFTContract.new(*params)
               else nil
               end
    return nil unless contract

    @deployed_contracts[contract_id] = {
      owner: owner,
      type: contract_type,
      contract: contract,
      deploy_time: Time.now
    }
    contract_id
  end

  def get_contract(contract_id)
    @deployed_contracts.dig(contract_id, :contract)
  end
end
