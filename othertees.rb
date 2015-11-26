require 'nori'

class Othertees
  def initialize(days_number)
    @days_number = days_number

    othertees_feed_url = "http://www.othertees.com/feed/"

    resp = HTTParty.get(othertees_feed_url)
    resp = Nori.new.parse resp.body
    resp = JSON.parse(resp.to_json)
    @tees = resp["rss"]['channel']['item']
  end

  def recent_tees_string
    recent_tees = @tees.select{ |item| (Time.parse(item['pubDate']) + (@days_number*24*60*60)) > Time.now}

    recent_tees.map! do |item|
      image = Nori.new.parse item["description"]
      image_url = image['a']['img']['@src']
      title = image['a']['img']['@title']

      tshirt_info_string(title, image_url)
    end

    recent_tees.join(' ')
  end

  private

  def tshirt_info_string(title, url)
    "#{title} #{url}"
  end
end
