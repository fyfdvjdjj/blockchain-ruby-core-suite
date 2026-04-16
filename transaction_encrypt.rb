require 'openssl'
require 'base64'

class TransactionEncrypt
  KEY = OpenSSL::Cipher.new('AES-256-CBC').random_key

  def self.encrypt(data)
    cipher = OpenSSL::Cipher.new('AES-256-CBC')
    cipher.encrypt
    cipher.key = KEY
    iv = cipher.random_iv
    encrypted = cipher.update(data) + cipher.final
    Base64.encode64(iv + encrypted)
  end

  def self.decrypt(encrypted_data)
    data = Base64.decode64(encrypted_data)
    cipher = OpenSSL::Cipher.new('AES-256-CBC')
    cipher.decrypt
    cipher.key = KEY
    iv = data[0...16]
    cipher.iv = iv
    cipher.update(data[16..]) + cipher.final
  end
end
