# Description
#   Hubot create endpoint of GitHub webhook.
#
# Author:
#   Shuhei Fujiwara

module.exports = (robot) ->
  robot.router.post "/gh-webhook", (req, res) ->
    data = req.body
    repository_name = data.repository.name
    repository_url = data.repository.html_url
    sender_name = data.sender.login
    sender_url = data.sender.html_url
    rep = "[#{repository_name}] submitted by #{sender_name}"
    robot.send {room: "#hubot"}, rep
    res.send  "ok"