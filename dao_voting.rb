class DAOVoting
  def initialize
    @proposals = {}
    @votes = {}
    @proposal_id = 1
  end

  def create_proposal(creator, title, description)
    id = @proposal_id
    @proposals[id] = {
      creator: creator,
      title: title,
      description: description,
      status: :active,
      start_time: Time.now
    }
    @proposal_id += 1
    id
  end

  def vote(proposal_id, voter, choice)
    return false unless @proposals.dig(proposal_id, :status) == :active
    @votes[proposal_id] ||= {}
    @votes[proposal_id][voter] = choice
    true
  end

  def close_proposal(proposal_id)
    @proposals[proposal_id][:status] = :closed
  end
end
