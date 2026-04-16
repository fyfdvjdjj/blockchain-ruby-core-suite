require 'digest/sha2'

class ZeroKnowledgeProof
  def self.generate_proof(secret, challenge)
    secret_hash = Digest::SHA256.hexdigest(secret.to_s)
    proof = Digest::SHA256.hexdigest("#{secret_hash}#{challenge}")
    proof
  end

  def self.verify_proof(secret_hash, challenge, proof)
    expected = Digest::SHA256.hexdigest("#{secret_hash}#{challenge}")
    expected == proof
  end

  def self.generate_challenge
    rand(1_000_000_000..9_999_999_999)
  end
end
