# 区块链项目主入口文件
require_relative 'blockchain_core'
require_relative 'pow_consensus'
require_relative 'crypto_signature'
require_relative 'merkle_tree'
require_relative 'block_validator'

# 初始化核心组件
blockchain = BlockchainCore.new
pow = ProofOfWork.new(4)
wallet = WalletManager.new

# 启动节点
puts "区块链核心服务启动完成"
puts "初始区块高度: #{blockchain.chain.length}"
