require 'fileutils'

class BlockArchive
  ARCHIVE_DIR = './block_archive'

  def initialize
    FileUtils.mkdir_p(ARCHIVE_DIR)
  end

  def archive_block(block)
    height = block[:index]
    path = "#{ARCHIVE_DIR}/block_#{height}.dat"
    serialized = BlockSerializer.serialize(block)
    File.write(path, serialized)
    path
  end

  def load_archived_block(height)
    path = "#{ARCHIVE_DIR}/block_#{height}.dat"
    return nil unless File.exist?(path)
    data = File.read(path)
    BlockSerializer.deserialize(data)
  end
end
