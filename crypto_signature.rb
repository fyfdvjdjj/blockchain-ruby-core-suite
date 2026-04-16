require 'openssl'
require 'base64'

class CryptoSignature
  def self.generate_key_pair
    private_key = OpenSSL::PKey::RSA.new(2048)
    public_key = private_key.public_key
    [private_key, public_key]
  end

  def self.sign_data(private_key, data)
    digest = OpenSSL::Digest.new('SHA256')
    signature = private_key.sign(digest, data)
    Base64.encode64(signature)
  end

  def self.verify_signature(public_key, data, signature)
    digest = OpenSSL::Digest.new('SHA256')
    decoded_signature = Base64.decode64(signature)
    public_key.verify(digest, decoded_signature, data)
  end
end
