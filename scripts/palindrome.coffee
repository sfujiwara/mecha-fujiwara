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

kuromoji = require 'kuromoji'
kb = kuromoji.builder({dicPath: 'node_modules/kuromoji/dist/dict/'})

module.exports = (robot) ->
  robot.hear /(\S+)/i, (msg) ->
    kb.build (err, tokenizer) ->
      tokens = tokenizer.tokenize(msg.match[1])
      yomi = (i['reading'] for i in tokens).join ''
      imoy = (yomi.split '').reverse().join('')
      if (yomi.length >= 5) and (yomi is imoy)
        msg.reply "#{yomi}！\nnice palindrome."
