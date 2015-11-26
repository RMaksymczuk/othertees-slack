require 'sinatra'
require 'httparty'
require 'nori'
require 'json'

get '/gateway' do
  othertees_feed_url = "http://www.othertees.com/feed/"

  resp = HTTParty.get(othertees_feed_url)
  resp = Nori.new.parse resp.body
  resp = JSON.parse(resp.to_json)

  image = Nori.new.parse resp["rss"]['channel']['item'][0]["description"]

  image_url = image['a']['img']['@src']
  title = image['a']['img']['@title']

  respond_message "#{title} #{image_url}"
end

def respond_message message
  content_type :json
  {:text => message}.to_json
end
