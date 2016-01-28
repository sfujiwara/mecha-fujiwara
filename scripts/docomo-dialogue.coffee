# Description:
#   Hubot replies using docomo dialogue API.
#
# Commands:
#   <hubot_name> docomo-dialogue <message>
#
# Author:
#   Shuhei Fujiwara

module.exports = (robot) ->
  robot.respond /docomo-dialogue (.*)/i, (msg) ->
    request = require('request');
    endpoint = "https://api.apigw.smt.docomo.ne.jp/dialogue/v1/dialogue?APIKEY=" + process.env.DOCOMO_API_KEY
    request.post
      url: endpoint
      json:
        utt: msg.match[1]
        nickname: msg.message.user.name
        context: ""
    , (err, response, body) ->
      msg.send body.utt
