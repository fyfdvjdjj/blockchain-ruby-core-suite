require 'json'
require 'zlib'

class BlockSerializer
  def self.serialize(block)
    json_data = JSON.dump(block)
    Zlib::Deflate.deflate(json_data)
  end

  def self.deserialize(data)
    decompressed = Zlib::Inflate.inflate(data)
    JSON.parse(decompressed, symbolize_names: true)
  end

  def self.serialize_chain(chain)
    chain.map { |block| serialize(block) }
  end

  def self.deserialize_chain(data_list)
    data_list.map { |data| deserialize(data) }
  end
end
