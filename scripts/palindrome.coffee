# Description
#   Hubot find palindrome.
#
# Dependencies:
#   "kuromoji": "0.0.5"
#
# Configuration:
#   None
#
# Author:
#   Shuhei Fujiwara

module.exports = (robot) ->
  kuromoji = require 'kuromoji'
  kb = kuromoji.builder({dicPath: 'node_modules/kuromoji/dist/dict/'})
  tokenizer = null
  kb.build (err, _tokenizer) -> tokenizer = _tokenizer
  robot.hear /(\S+)/i, (msg) ->
    tokens = tokenizer.tokenize(msg.match[1])
    yomi = (i['reading'] for i in tokens).join ''
    imoy = (yomi.split '').reverse().join('')
    if (yomi.length >= 5) and (yomi is imoy)
      msg.reply "#{yomi}！nice palindrome."
