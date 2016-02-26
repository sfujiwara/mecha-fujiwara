# Description
#   Hubot tell us the weather
#
# Configuration:
#   None
#
# Commands:
#   hubot weather
#
# Author:
#   Shuhei Fujiwara

module.exports = (robot) ->
  robot.respond /weather$/i, (msg) ->
    request = require 'request'
    request
      url: "http://weather.livedoor.com/forecast/webservice/json/v1"
      qs:
        city: 130010
      json: true
    , (err, response, body) ->
      msg.reply body.description.text + "\n\n" + body.description.publicTime + "\n" + body.link