# Description
#   Hubot replies using docomo dialogue API.
#
# Configuration:
#   DOCOMO_API_KEY: required
#
# Author:
#   Shuhei Fujiwara

module.exports = (robot) ->
  robot.respond /(\S+)/i, (msg) ->
    key_docomo_dialogue_context = 'docomo-dialogue-context'
    # Get doalogue context
    context = robot.brain.get key_docomo_dialogue_context
    # Send POST request
    request = require 'request'
    endpoint = 'https://api.apigw.smt.docomo.ne.jp/dialogue/v1/dialogue?APIKEY=' + process.env.DOCOMO_API_KEY
    request.post
      url: endpoint
      json:
        utt: msg.match[1]
        nickname: msg.message.user.name
        context: context
    , (err, response, body) ->
      # Save context
      robot.brain.set key_docomo_dialogue_context, body.context
      # Reply
      msg.reply body.utt
