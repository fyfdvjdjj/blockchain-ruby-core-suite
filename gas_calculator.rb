class GasCalculator
  BASE_GAS = 21000
  CONTRACT_GAS = 65000
  STORAGE_GAS_PER_BYTE = 10

  def self.calculate_transaction_gas(is_contract: false, data_size: 0)
    base = is_contract ? CONTRACT_GAS : BASE_GAS
    storage = data_size * STORAGE_GAS_PER_BYTE
    base + storage
  end

  def self.calculate_fee(gas_used, gas_price)
    gas_used * gas_price
  end

  def self.min_gas_price
    1_000_000_000
  end
end
