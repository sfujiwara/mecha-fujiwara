# Description:
#   Hubot tell us the information of rain cloud
#
# Commands:
#   hubot raincloud <area>
#
# Author:
#   Shuhei Fujiwara

module.exports = (robot) ->
  robot.respond /raincloud (.+)/i, (msg) ->
    unless process.env.YAHOO_API_KEY?
      robot.respond "環境変数 YAHOO_API_KEY が見つからんかったよ"
      return
    request = require "request"
    # Send request to YAHOO geocoder
    request
      url: "http://geo.search.olp.yahooapis.jp/OpenLocalPlatform/V1/geoCoder"
      qs:
        appid: process.env.YAHOO_API_KEY
        query: msg.match[1]
        result: 1
        output: "json"
      json: true
    , (err, response, body) ->
      console.log body.Feature[0]
      console.log msg.match[1]
      coordinates = body.Feature[0].Geometry.Coordinates.split(",")
      lon = coordinates[0]
      lat = coordinates[1]
      console.log "test"
      # Generate URL for static map with rainfall information
      url = "http://map.olp.yahooapis.jp/OpenLocalPlatform/V1/static"
      params = 
        "appid": process.env.YAHOO_API_KEY
        "lat": lat
        "lon": lon
        "width": 500
        "height": 300
        "overlay": "type:rainfall"
        "z": 12
      console.log params
      rep =
        "#{body.Feature[0].Name}付近の雨雲の様子だよ\n" +
        url + "?" + ("#{key}=#{val}" for key, val of params).join("&") +
        "\nあとは自分で調べてね\nhttp://weather.yahoo.co.jp/weather/raincloud/"
      msg.reply rep

