# Description
#   Hubot runs shell script at `shell-scripts/<file-name>`
#
# Configuration:
#   None
#
# Commands:
#   hubot sh <file-name>
#
# Author:
#   Shuhei Fujiwara

child_process = require "child_process"
module.exports = (robot) ->
  robot.respond /sh (.*)/i, (msg) ->
    child_process.exec "sh shell-scripts/#{msg.match[1]}", (error, stdout, stderr) ->
      msg.send("```\n#{stdout}```")
      msg.send("```\n#{stderr}\n```") if stderr
      msg.send("```\n#{err}\n```") if err
