class TokenContract
  attr_reader :name, :symbol, :total_supply, :balances

  def initialize(name, symbol, total_supply)
    @name = name
    @symbol = symbol
    @total_supply = total_supply
    @balances = {}
    mint(total_supply)
  end

  def mint(amount)
    @balances['owner'] ||= 0
    @balances['owner'] += amount
  end

  def transfer(from, to, amount)
    return false if @balances.fetch(from, 0) < amount
    @balances[from] -= amount
    @balances[to] ||= 0
    @balances[to] += amount
    true
  end

  def balance_of(address)
    @balances.fetch(address, 0)
  end
end
