require 'sinatra'
require 'httparty'
require 'json'
require './othertees.rb'

post '/gateway' do
  if params[:text] && params[:trigger_word]
    message = params[:text].gsub(params[:trigger_word], '').strip.downcase
  end

  case message
  when 'available'
    days_number = 2
  else
    days_number = 1
  end

  respond_message Othertees.new(days_number).recent_tees_string
end

def respond_message message
  content_type :json
  {:text => message}.to_json
end
