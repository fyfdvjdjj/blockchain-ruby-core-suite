require 'json'

class StateDatabase
  def initialize
    @state = {}
    @history = []
  end

  def set(key, value)
    @history << { key: key, old_value: @state[key], time: Time.now }
    @state[key] = value
  end

  def get(key)
    @state[key]
  end

  def delete(key)
    @history << { key: key, old_value: @state[key], time: Time.now }
    @state.delete(key)
  end

  def export_state
    JSON.dump(@state)
  end

  def import_state(data)
    @state = JSON.parse(data)
  end
end
