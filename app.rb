require 'sinatra'
require 'httparty'
require 'nori'
require 'json'

post '/gateway' do
  if params[:text] && params[:trigger_word]
    message = params[:text].gsub(params[:trigger_word], '').strip.downcase
  end

  othertees_feed_url = "http://www.othertees.com/feed/"

  resp = HTTParty.get(othertees_feed_url)
  resp = Nori.new.parse resp.body
  resp = JSON.parse(resp.to_json)

  case message
  when 'available'
    days_number = 2
  else
    days_number = 1
  end

  items = resp["rss"]['channel']['item']
  items.select!{ |item| (Time.parse(item['pubDate']) + (days_number*24*60*60)) > Time.now}

  items.map! do |item|
    image = Nori.new.parse item["description"]
    image_url = image['a']['img']['@src']
    title = image['a']['img']['@title']

    tshirt_info_string(title, image_url)
  end

  respond_message items.join(' ')
end

def respond_message message
  content_type :json
  {:text => message}.to_json
end

def tshirt_info_string(title, url)
  "#{title} #{url}"
end
