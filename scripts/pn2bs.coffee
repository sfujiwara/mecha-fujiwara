# Description
#   Hubot predict base-stats and types
#
# Configuration:
#   None
#
# Commands:
#   hubot pn2bs
#
# Author:
#   Shuhei Fujiwara

module.exports = (robot) ->
  robot.respond /pn2bs (.+)/i, (msg) ->
    request = require 'request'
    request
      url: "https://pn2bs.herokuapp.com/pred"
      qs:
        name: msg.match[1]
      json: true
    , (err, response, body) ->
      text = "> #{body.name}\nHP\tA\tB\tC\tD\tS\n#{body.hp}\t#{body.attack}\t#{body.block}\t#{body.contact}\t#{body.defense}\t#{body.speed}"
      msg.send text