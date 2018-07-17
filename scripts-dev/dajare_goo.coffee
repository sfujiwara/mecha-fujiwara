# Description
#   Hubot responds to your dajare
#
# Configuration:
#   DOCOMO_API_KEY: required
#
# Author:
#   Shuhei Fujiwara

is_dajare = (yomi_list, pos_list) ->
  for i in [0..yomi_list.length]
    if pos_list[i] == "名詞"
      word_freq = (w for w in yomi_list when w == yomi_list[i]).length
      str_freq = yomi_list.join("").split(yomi_list[i]).length - 1
      return true if str_freq > word_freq
  return false

module.exports = (robot) ->
  robot.hear /(\S+)/i, (msg) ->
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
      word_list = body.word_list
      yomi_list = (i[2] for i in word_list[0])
      pos_list = (i[1] for i in word_list[0])
      msg.send "ﾌﾟｷﾞｮｯﾋｗｗｗﾌｫｯﾌｫｰｯｗｗｗ" if is_dajare yomi_list, pos_list
