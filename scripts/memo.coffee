# Description
#   Hubot remembers your message.
#
# Commands:
#   hubot memo - show message which hubot remembers
#   hubot memo <message> - hubot remembers the message
#
# Configuration:
#   None
#
# Author
#   Shuhei Fujiwara

module.exports = (robot) ->
  robot.respond /MEMO$/i, (msg) ->
    memo = robot.brain.get "memo"
    msg.reply memo
  robot.respond /MEMO (\S+)/i, (msg) ->
    robot.brain.set "memo", msg.match[1]
    msg.reply "覚えたよ\n> #{msg.match[1]}"
