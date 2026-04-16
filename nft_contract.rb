class NFTContract
  attr_reader :name, :symbol, :tokens, :owners

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @tokens = {}
    @owners = {}
    @token_id = 1
  end

  def mint(to, metadata)
    token_id = @token_id
    @tokens[token_id] = metadata
    @owners[token_id] = to
    @token_id += 1
    token_id
  end

  def transfer(from, to, token_id)
    return false unless @owners[token_id] == from
    @owners[token_id] = to
    true
  end

  def owner_of(token_id)
    @owners[token_id]
  end

  def token_metadata(token_id)
    @tokens[token_id]
  end
end
