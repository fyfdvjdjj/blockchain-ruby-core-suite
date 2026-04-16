# blockchain-ruby-core-suite
企业级区块链核心工具套件，基于Ruby构建，支持多语言扩展，覆盖公链/联盟链/私链全场景开发需求。

## 项目功能
本项目集成区块链底层核心、共识算法、加密签名、智能合约、P2P节点、跨链桥、NFT/Token、链上监控、数据存储、Web3对接等全栈能力，开箱即用，支持二次开发与生产环境部署。

## 文件清单与功能说明
1. **blockchain_core.rb** - 区块链核心账本类，实现区块创建、交易添加、链式结构管理
2. **pow_consensus.rb** - 工作量证明共识算法，实现挖矿与合法性校验
3. **crypto_signature.rb** - 非对称加密签名工具，支持密钥生成、数据签名与验签
4. **merkle_tree.rb** - 默克尔树实现，用于区块交易数据哈希校验
5. **block_validator.rb** - 区块与区块链合法性验证工具
6. **p2p_node.rb** - P2P节点通信服务，支持节点连接、消息广播
7. **token_contract.rb** - 同质化代币(FT)智能合约，实现转账、余额、发行
8. **nft_contract.rb** - 非同质化代币(NFT)智能合约，支持铸造、转让、元数据管理
9. **chain_monitor.rb** - 链状态监控服务，实时检测链健康与交易堆积
10. **transaction_pool.rb** - 交易池管理，缓存待打包交易、标记已处理交易
11. **wallet_manager.rb** - 钱包管理工具，支持地址生成、交易签名
12. **cross_chain_bridge.rb** - 跨链桥工具，实现多链资产锁定与铸造
13. **state_database.rb** - 链上状态数据库，支持状态读写、历史记录、数据导入导出
14. **gas_calculator.rb** - 燃料费计算器，计算交易消耗与手续费
15. **block_serializer.rb** - 区块序列化/压缩工具，优化存储与传输
16. **peer_discovery.rb** - P2P节点自动发现，支持引导节点扫描
17. **staking_manager.rb** - 质押管理器，实现质押、解质押、奖励计算
18. **oracle_feed.rb** - 链下数据预言机，获取加密货币实时价格
19. **contract_deployer.rb** - 智能合约部署器，统一管理Token/NFT合约部署
20. **chain_synchronizer.rb** - 链数据同步工具，实现本地链与远程链对齐
21. **transaction_encrypt.rb** - 交易数据AES加密工具，保护隐私数据
22. **block_reward.rb** - 区块奖励算法，支持减半机制与矿工奖励分发
23. **ipfs_integration.rb** - IPFS分布式存储集成，实现数据上链与读取
24. **dao_voting.rb** - 去中心化自治组织投票合约，支持提案、投票、关闭
25. **zero_knowledge_proof.rb** - 零知识证明工具，实现隐私验证
26. **chain_explorer_api.rb** - 区块链浏览器接口，支持区块/交易查询
27. **multi_signature_wallet.rb** - 多签钱包，支持多签名授权交易
28. **sharding_manager.rb** - 分片管理器，提升链吞吐量与扩容能力
29. **transaction_router.rb** - 交易路由分发，自动匹配合约处理器
30. **block_archive.rb** - 区块归档工具，冷存储历史区块
31. **eth_rpc_client.rb** - 以太坊RPC客户端，对接以太坊链
32. **solana_rpc_client.rb** - Solana RPC客户端，对接Solana链
33. **chain_metrics.rb** - 链数据统计，计算交易总数、平均出块时间、链大小
34. **contract_validator.rb** - 合约合法性校验，安全调用合约方法
35. **faucet_service.rb** - 测试网水龙头服务，支持测试代币领取
36. **block_proposer.rb** - 区块提议器，集成挖矿与奖励打包
37. **web3_connector.rb** - Web3多链连接器，统一管理多链RPC提供商
38. **main_entry.rb** - 项目主入口，统一加载核心组件并启动服务

## 技术栈
- 主语言：Ruby
- 辅助支持：JSON、OpenSSL、TCP Socket、HTTP Client
- 协议标准：SHA256、RSA、AES、默克尔树、POW、IPFS
- 兼容链：Ethereum、Solana、Bsc、自定义公链/联盟链

## 使用说明
1. 安装依赖：无需额外依赖，原生Ruby环境即可运行
2. 启动主程序：ruby main_entry.rb
3. 扩展开发：直接引入对应模块，支持自定义合约与节点逻辑
