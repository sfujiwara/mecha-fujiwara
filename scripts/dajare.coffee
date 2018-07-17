# Description
#   Hubot responds to your dajare
#
# Author:
#   Shuhei Fujiwara

kuromoji = require "kuromoji"

DIC_PATH = "node_modules/kuromoji/dict/"
tokenizer = null
kuromoji.builder(dicPath: DIC_PATH).build (err, _tokenizer) ->
  tokenizer = _tokenizer

is_dajare = (yomi_list, pos_list) ->
  for i in [0..yomi_list.length]
    if pos_list[i] == "名詞"
      word_freq = (w for w in yomi_list when w == yomi_list[i]).length
      str_freq = yomi_list.join("").split(yomi_list[i]).length - 1
      return true if str_freq > word_freq
  return false

module.exports = (robot) ->
  robot.hear /(.+)/, (msg) ->
    # msg.send msg.message.text
    tokens = tokenizer.tokenize(msg.message.text)
    yomi_list = (token["reading"] for token in tokens)
    pos_list = (token["pos"] for token in tokens)
    msg.send "ﾌﾟｷﾞｮｯﾋｗｗｗﾌｫｯﾌｫｰｯｗｗｗ" if is_dajare yomi_list, pos_list
