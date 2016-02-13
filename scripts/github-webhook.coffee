# Description
#   Hubot create endpoint of GitHub webhook.
#
# Author:
#   Shuhei Fujiwara

module.exports = (robot) ->
  robot.router.post "/gh-webhook", (req, res) ->
    data = req.body
    robot.send {room: "#hubot"}, "```\n" + (JSON.stringify data) + "\n```"
    res.send  "ok"