# Description
#   Hubot create endpoint of GitHub webhook.
#
# Author:
#   Shuhei Fujiwara

module.exports = (robot) ->
  robot.router.post "/gh-webhook", (req, res) ->
    data = req.body
    event_type = req.get "X-Github-Event"
    # PushEvent
    if event_type is "push"
      rep =
        """
        :octocat: GitHub Event: #{event_type}
        [#{data.repository.name}:#{data.ref}] submitted by #{data.sender.login}
        #{data.commits[0].message}
        #{data.commits[0].url}
        """
      robot.send {room: "#hubot"}, rep
    else
      rep =
        """
        :octocat: *GitHub Event: #{event_type}*
        何か知らんイベントが起こったよ
        """
      robot.send {room: "#hubot"}, rep
    res.send  "ok"