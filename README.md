# othertees-slack

It allows you to integrate your Slack with Othertess.com recent tees in two ways.

## Incoming Webhooks
You could use slack Incoming Webhooks, generate a link, and after deploying the app on heroku, setup schedule daily job to: rake recent_tees

## Outgoing Webhooks
You could use slack Outgoing Webhooks and point it on your app-url/gateway. Than, when you call your trigger word, by default you will get recent tees from the very last day. By addition, when you add 'available' to yout trigger word, you will get all, actualy available, tees.



### Sources
- https://api.slack.com/incoming-webhooks
- https://api.slack.com/outgoing-webhooks
- http://www.sitepoint.com/building-a-slackbot-with-ruby-and-sinatra/?utm_source=github
