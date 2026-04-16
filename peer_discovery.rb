require 'resolv'

class PeerDiscovery
  BOOTSTRAP_NODES = [
    ['bootstrap1.blockchain.net', 4001],
    ['bootstrap2.blockchain.net', 4001]
  ]

  def initialize
    @discovered_peers = []
  end

  def discover_from_bootstrap
    BOOTSTRAP_NODES.each do |host, port|
      ip = Resolv.getaddress(host) rescue next
      @discovered_peers << { ip: ip, port: port }
    end
    @discovered_peers.uniq
  end

  def add_peer(ip, port)
    @discovered_peers << { ip: ip, port: port }
    @discovered_peers.uniq!
  end

  attr_reader :discovered_peers
end
