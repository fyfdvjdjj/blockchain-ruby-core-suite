class TransactionRouter
  def initialize
    @routes = {
      token: :token_contract,
      nft: :nft_contract,
      staking: :staking_manager,
      voting: :dao_voting
    }
  end

  def route_transaction(type, data)
    handler = @routes[type.downcase.to_sym]
    return { status: :error, message: '无效路由' } unless handler
    { status: :success, handler: handler, data: data }
  end

  def register_route(type, handler)
    @routes[type.downcase.to_sym] = handler
  end
end
