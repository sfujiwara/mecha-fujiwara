module.exports = (robot) ->
  robot.respond /daily-report-template$/i, (msg) ->
    msg.send "```\n# 今日実施したタスク\n\n# 明日実施予定のタスク\n\n# 明後日以降実施予定のタスク\n\n# 進捗\n\n# その他\n```"