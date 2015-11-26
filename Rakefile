desc "Send recent Tees"
task :recent_tees do
  require 'httparty'
  require './othertees.rb'

  slack_url = ENV['SLACK_URL']
  if slack_url
    HTTParty.post(slack_url, body: { text: Othertees.new(1).recent_tees_string}.to_json )
  end
end
