require 'socket'
require 'json'

class P2PNode
  def initialize(host, port)
    @host = host
    @port = port
    @peers = []
  end

  def start_server
    server = TCPServer.new(@host, @port)
    puts "P2P节点启动: #{@host}:#{@port}"
    loop do
      client = server.accept
      handle_client(client)
    end
  end

  def connect_peer(host, port)
    socket = TCPSocket.new(host, port)
    @peers << socket
    puts "已连接节点: #{host}:#{port}"
  end

  def broadcast(message)
    @peers.each { |peer| peer.puts(message) }
  end

  private

  def handle_client(client)
    data = client.gets
    puts "收到节点消息: #{data}"
    client.close
  end
end
