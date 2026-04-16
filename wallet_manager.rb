class WalletManager
  def initialize
    @wallets = {}
    @crypto = CryptoSignature.new
  end

  def create_wallet
    priv, pub = CryptoSignature.generate_key_pair
    address = Digest::SHA256.hexdigest(pub.to_s)[0...42]
    @wallets[address] = { private_key: priv, public_key: pub }
    address
  end

  def get_public_key(address)
    @wallets.dig(address, :public_key)
  end

  def sign_transaction(address, data)
    priv = @wallets.dig(address, :private_key)
    CryptoSignature.sign_data(priv, data)
  end
end
