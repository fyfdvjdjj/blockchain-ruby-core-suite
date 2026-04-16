require 'net/http'
require 'json'

class OracleFeed
  def initialize
    @price_feeds = {}
    @last_update = {}
  end

  def fetch_coin_price(coin)
    url = URI("https://api.coingecko.com/api/v3/simple/price?ids=#{coin}&vs_currencies=usd")
    response = Net::HTTP.get(url)
    data = JSON.parse(response)
    price = data.dig(coin, 'usd')
    return nil unless price

    @price_feeds[coin] = price
    @last_update[coin] = Time.now
    price
  end

  def get_latest_price(coin)
    @price_feeds[coin]
  end
end
