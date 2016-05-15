# Description
#   Hubot predict base-stats and types
#
# Configuration:
#   None
#
# Commands:
#   hubot pn2bs <pokemon>
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
      text = "#{body.name}\nタイプ: #{body.type1} / #{body.type2}\nHP #{body.hp}  A #{body.attack}  B #{body.block}  C #{body.contact}  D #{body.defense}  S #{body.speed}"
      msg.send text
