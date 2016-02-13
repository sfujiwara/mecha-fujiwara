# Description
#   Hubot search the word on weblio
#
# Configuration:
#   None
#
# Commands:
#   hubot weblio <word>
#
# Author:
#   Shuhei Fujiwara

module.exports = (robot) ->
  robot.respond /weblio (.*)/i, (msg) ->
    word = msg.match[1]
    msg.reply "weblio で調べてきたよ！\nhttp://ejje.weblio.jp/content/#{word}"
