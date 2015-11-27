# othertees-slack

It allows you to integrate your Slack with Othertess.com recent tees in two ways.

## Incoming Webhooks
You could use slack Incoming Webhooks, generate a link, and after deploying the app on heroku, setup schedule daily job to: 'rake recent_tees' and set SLACK_URL to generated incoming url

## Outgoing Webhooks
You could use slack Outgoing Webhooks and point it to your app-url/gateway. Than, when you call your trigger word, by default you will get recent tees from the very last day. By addition, when you add 'available' to your trigger word, you will get all, actualy available, tees.

Try it with https://othertees-slack.herokuapp.com/gateway if you want (call it with POST for test)

### Preview
![alt text](https://dl.dropboxusercontent.com/u/5171036/Screenshot%20from%202015-11-27%2009%3A40%3A36.png "othertees slac preview")


### Sources
- https://api.slack.com/incoming-webhooks
- https://api.slack.com/outgoing-webhooks
- http://www.sitepoint.com/building-a-slackbot-with-ruby-and-sinatra/?utm_source=github
- http://www.othertees.com/
