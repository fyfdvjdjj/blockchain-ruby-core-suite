require 'digest/sha2'

class ProofOfWork
  def initialize(difficulty = 4)
    @difficulty = difficulty
    @target = '0' * @difficulty
  end

  def valid_proof?(last_proof, proof)
    guess = "#{last_proof}#{proof}"
    guess_hash = Digest::SHA256.hexdigest(guess)
    guess_hash.start_with?(@target)
  end

  def mine_proof(last_proof)
    proof = 0
    proof += 1 until valid_proof?(last_proof, proof)
    proof
  end

  attr_reader :difficulty
end
