# Description
#   Hubot does morphological analysis
#
# Configuration:
#   None
#
# Commands:
#   hubot morph <sentence>
#
# Author:
#   Shuhei Fujiwara

module.exports = (robot) ->
  robot.respond /morph (.*)/i, (msg) ->
    unless process.env.DOCOMO_API_KEY
      robot.logger.warning "DOCOMO_API_KEY not found"
      msg.reply "`DOCOMO_API_KEY` が見つかりませんでした"
      return
    # Send POST request
    request = require 'request'
    endpoint = 'https://api.apigw.smt.docomo.ne.jp/gooLanguageAnalysis/v1/morph?APIKEY=' + process.env.DOCOMO_API_KEY
    request.post
      url: endpoint
      json:
        sentence: msg.match[1]
    , (err, response, body) ->
      # Reply
      result = JSON.stringify body, null, 2
      msg.reply "goo API で形態素解析したよ\n```json\n#{result}\n```"
